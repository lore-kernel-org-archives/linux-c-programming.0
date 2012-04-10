From: Bogdan Cristea <cristeab@gmail.com>
Subject: Re: close socket and TCP RST
Date: Tue, 10 Apr 2012 23:01:32 +0200
Message-ID: <1441444.tphEHApd4k@desktop>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=qywkYamXpw7yHW/M98k+Jog6q1V3G0RsAGB5EIf4tO4=;
        b=FDZ6IFoMjTwR8+lPvYeUxTkwCLKSta/YbiYhzpkcJ3kRcPJp+GTJkM4ha0G8Wi4gDp
         GJklMXkwI+GmpfdZA2N5JkPcdzRgiAxiU1w/p1WpkW+pXrzPcvelhLv7loH3kV+254os
         hwxxvTgvpFVuatAdsewlRtqvvz6UA7AffzWw15IO9tdbNv3HO+H8ATTiohkYDBMPuJvL
         k9YxaGUes3OcVhx1AYjh662ocM+qpz4mgO5uY3bZYyYiN7p2DUI+OVVYfemnzvTIIAf3
         ogAsLvix2/xueoF6Gb3WuCFQj8XgPXvJDCCIXiBGHNExX9kaNe0RaYZ0tIwlGCmS7M18
         YG9Q==
In-Reply-To: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Celelibi <celelibi@gmail.com>, linux-c-programming@vger.kernel.org

On Tuesday 10 April 2012 01:46:45 you wrote:
> Hello,
> 
> I'm not sure about the mailing list I should ask this. I would try
> linux-net if it was still alive.
> 
> I spent a few days searching about a weird bug I had.
> It is actually similar to this one:
> http://marc.info/?l=linux-net&m=127651583824851&w=2 .
> 
> Summary for lazy people ^^: calling close(2) on a socket with a
> non-empty receive kernel-buffer cause the connection to be ReSeT and
> the send buffer discarded and not sent.
> 
> 
> I have a server program (code included below)  that wait for a client.
> When a client connect, the server:
> - sent "Greet\n"
> - read one char
> - send "Hello "
> - send "World\n"
> - send "Quit\n"
> - close the socket
> 
> And it happens that sometimes (quite often actually) that the client
> does not recieve anything after "Hello " and the connection is just
> closed.
> Actually, after I dumped the TCP trafic with wireshark, I saw that
> "World\n" and "Quit\n" were NOT sent, despite the send(2) succeded.
> The server just send a packet with the RST flag to interrupt the
> connection.
> Even more strange: This only occurs when the client send more data to
> the server than what was expected.
> i.e.: the server read one byte, the client send one, the last messages
> arrives just fine. The client send two bytes, the last messages never
> arrives!
> 
> From what I intuited and understood from the Linux kernel code:
> http://lxr.linux.no/linux+v3.3.1/net/ipv4/tcp.c#L1893
> When the sever call close(2) on the socket file descriptor, the
> connection is "reset" if the receive buffer was not empty. And in that
> case, the output buffer is never sent to the client (whenever
> SO_LINGER is set or not).
> 
> 
> The workaround I found is to call shutdown(2) before calling close.
> When the outgoing direction of the socket is shutdown the buffer is
> flushed and sent, and it initiate a gentle connection ending. (While
> the close still send a RST because of the non-empty input buffer.)
> 
> Therefore I have two questions:
> 1) Is this a standard behavior? Doesn't the RFC state that every
> pending data is sent when the connection is closed?
> 2) Shouldn't that behavior be documented somewhere? I didn't found any
> information about that anywhere. I looked at the man close(2),
> shutdown(2), socket(7), tcp(7).
> 
> From this I deduce that shutdown must be called everytime we want to
> close a socket. But this is not taught anywhere. :p
> 
> 
> 
> Here is the code of the server for those who want to try it. And since
> it seems time related I also provide a client that exhibit the bug (at
> least on my machine).
> 
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <string.h>
> #include <sys/types.h>
> #include <sys/socket.h>
> #include <netdb.h>
> 
> 
> 
> #define STRING_GREET "Greet\n"
> #define STRING_HELLO "Hello "
> #define STRING_WORLD "World"
> #define STRING_QUIT  "Quit\n"
> 
> 
> 
> 
> int create_socket(void) {
> 	struct addrinfo hints, *res, *rp;
> 	int sockfd = -1;
> 	int err;
> 
> 
> 	memset(&hints, 0, sizeof(hints));
> 	hints.ai_family = AF_UNSPEC;
> 	hints.ai_socktype = SOCK_STREAM;
> 	hints.ai_protocol = 0;
> 	hints.ai_flags = AI_V4MAPPED | AI_PASSIVE;
> 
> 	err = getaddrinfo("127.0.0.1", "1337", &hints, &res);
> 	if (err) {
> 		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(err));
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	for (rp = res; rp; rp = rp->ai_next) {
> 		int optval;
> 
> 		sockfd = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
> 		if (sockfd == -1) {
> 			perror("socket");
> 			continue;
> 		}
> 
> 		optval = 1;
> 		err = setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &optval,
> sizeof(optval)); if (err == -1) {
> 			perror("setsockopt");
> 			close(sockfd);
> 			sockfd = -1;
> 			continue;
> 		}
> 
> 		err = bind(sockfd, rp->ai_addr, rp->ai_addrlen);
> 		if (err == -1) {
> 			perror("bind");
> 			close(sockfd);
> 			sockfd = -1;
> 			continue;
> 		}
> 
> 		break;
> 	}
> 
> 	freeaddrinfo(res);
> 
> 	if (sockfd == -1) {
> 		fprintf(stderr, "can't bind at all\n");
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	err = listen(sockfd, 5);
> 	if (err == -1) {
> 		perror("listen");
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	return sockfd;
> }
> 
> 
> 
> void handle_client(int sockfd, int s) {
> 	char c;
> 	int err;
> 
> 	err = send(s, STRING_GREET, strlen(STRING_GREET), MSG_NOSIGNAL);
> 	if (err == -1) {
> 		perror("send");
> 		close(s);
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}
> 	fprintf(stderr, "send(STRING_GREET) = %d\n", err);
> 
> 	err = recv(s, &c, sizeof(c), 0);
> 	if (err == -1) {
> 		perror("recv");
> 		close(s);
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	err = send(s, STRING_HELLO, strlen(STRING_HELLO), MSG_NOSIGNAL);
> 	if (err == -1) {
> 		perror("send");
> 		close(s);
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}
> 	fprintf(stderr, "send(STRING_HELLO) = %d\n", err);
> 
> 	err = send(s, STRING_WORLD, strlen(STRING_WORLD), MSG_NOSIGNAL);
> 	if (err == -1) {
> 		perror("send");
> 		close(s);
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}
> 	fprintf(stderr, "send(STRING_WORLD) = %d\n", err);
> 
> 	err = send(s, "\n", 1, 0);
> 	if (err == -1) {
> 		perror("send");
> 		close(s);
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}
> 	fprintf(stderr, "send(\\n) = %d\n", err);
> 
> 	err = send(s, STRING_QUIT, strlen(STRING_QUIT), MSG_NOSIGNAL);
> 	if (err == -1) {
> 		perror("send");
> 		close(s);
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}
> 	fprintf(stderr, "send(STRING_QUIT) = %d\n", err);
> 
> 	/*err = shutdown(s, SHUT_RDWR);
> 	if (err == -1) {
> 		perror("shutdown");
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}*/
> 
> 	err = close(s);
> 	if (err == -1) {
> 		perror("close");
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}
> }
> 
> 
> 
> int main(void) {
> 	struct linger lin;
> 	int sockfd;
> 	int err;
> 
> 	sockfd = create_socket();
> 
> 	lin.l_onoff = 1;
> 	lin.l_linger = 1;
> 	err = setsockopt(sockfd, SOL_SOCKET, SO_LINGER, &lin, sizeof(lin));
> 	if (err == -1) {
> 		perror("setsockopt(SO_LINGER)");
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}
> 
> 
> 	while (1) {
> 		int s;
> 
> 		s = accept(sockfd, NULL, NULL);
> 		if (s == -1) {
> 			perror("accept");
> 			close(sockfd);
> 			exit(EXIT_FAILURE);
> 		}
> 
> 		handle_client(sockfd, s);
> 	}
> 
> 	err = close(sockfd);
> 	if (err == -1) {
> 		perror("close");
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	return EXIT_SUCCESS;
> }
> 
> 
> 
> 
> 
> 
> 
> 
> The client:
> 
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <string.h>
> #include <sys/types.h>
> #include <sys/socket.h>
> #include <netdb.h>
> 
> 
> #define MIN(a, b) (((a) < (b)) ? (a) : (b))
> 
> 
> size_t readline(int fd, unsigned char *out, size_t out_size) {
> 	static unsigned char buff[8 * 1024];
> 	static size_t data_buff = 0;
> 	size_t retval = 0;
> 	ssize_t nr;
> 
> 	while (1) {
> 		unsigned char *nl;
> 
> 
> 		/* Is there already a \n in the buffer? */
> 		nl = memchr(buff, '\n', data_buff);
> 		if (nl) {
> 			size_t nc = MIN(out_size, nl - buff + 1UL);
> 			memcpy(out, buff, nc);
> 			retval += nc;
> 			memmove(buff, buff + nc, data_buff - nc);
> 			data_buff -= nc;
> 			break;
> 		} else {
> 			/* No \n found */
> 			if (data_buff >= out_size) {
> 				/* No space left in the out buffer */
> 				memcpy(out, buff, out_size);
> 				retval += out_size;
> 				memmove(buff, buff + out_size, data_buff - out_size);
> 				data_buff -= out_size;
> 				break;
> 			} else {
> 				/* No \n and some space left in the out buffer.
> 				 * copy _ALL_ the buffer! */
> 				memcpy(out, buff, data_buff);
> 				retval += data_buff;
> 				out += data_buff;
> 				out_size -= data_buff;
> 				data_buff = 0;
> 			}
> 		}
> 
> 
> 		nr = recv(fd, buff, sizeof(buff), 0);
> 
> 		/* No matter the errors, we have data! */
> 		if (nr == -1 && retval != 0)
> 			break;
> 
> 		if (nr == -1) {
> 			perror("recv");
> 			close(fd);
> 			exit(EXIT_FAILURE);
> 		}
> 
> 		if (nr == 0)
> 			break;
> 
> 		data_buff = nr;
> 	}
> 
> 	return retval;
> }
> 
> 
> 
> int main(void) {
> 	struct addrinfo hints, *res, *rp;
> 	int sockfd = -1;
> 	int err;
> 	unsigned char buff[8 * 1024];
> 	size_t line_size = 0;
> 
> 
> 	memset(&hints, 0, sizeof(hints));
> 	hints.ai_family = AF_INET;
> 	hints.ai_socktype = SOCK_STREAM;
> 	hints.ai_protocol = 0;
> 	hints.ai_flags = AI_V4MAPPED;
> 
> 	err = getaddrinfo("127.0.0.1", "1337", &hints, &res);
> 	if (err) {
> 		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(err));
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	for (rp = res; rp; rp = rp->ai_next) {
> 		sockfd = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
> 		if (sockfd == -1) {
> 			perror("socket");
> 			continue;
> 		}
> 
> 		err = connect(sockfd, rp->ai_addr, rp->ai_addrlen);
> 		if (err == -1) {
> 			perror("connect");
> 			close(sockfd);
> 			sockfd = -1;
> 			continue;
> 		}
> 
> 		break;
> 	}
> 
> 	freeaddrinfo(res);
> 
> 	if (sockfd == -1) {
> 		fprintf(stderr, "can't connect at all\n");
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	line_size = readline(sockfd, buff, sizeof(buff));
> 	write(STDOUT_FILENO, buff, line_size);
> 
> 	err = send(sockfd, "XX", 2, 0);
> 	if (err == -1) {
> 		perror("send");
> 		close(sockfd);
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	line_size = readline(sockfd, buff, sizeof(buff));
> 	write(STDOUT_FILENO, buff, line_size);
> 
> 	line_size = readline(sockfd, buff, sizeof(buff));
> 	write(STDOUT_FILENO, buff, line_size);
> 
> 	err = close(sockfd);
> 	if (err == -1) {
> 		perror("close");
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	return EXIT_SUCCESS;
> }
> 
> 
> Thanks for reading that whole long message.
> 
> Celelibi
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hi

It seems indeed a little strange that with SO_LINGER option you cannot send 
everything. Anyway, at the first look it seems that you have several 
programming errors:
- socket ops for the server should be set before starting to listen on the 
socket
-in the main function you never exit from the while loop, so why bother to 
close the socket after this loop ?

Have a closer look at your code, there might be a bug in your program.

regards
-- 
Bogdan
