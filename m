From: "Sandro Dangui" <sdangui@nortelnetworks.com>
Subject: RE: SEGFAULT
Date: Wed, 20 Aug 2003 16:21:07 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <31E38B53D182D51195FA00508BE3A33402972939@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John T. Williams" <jtwilliams@vt.edu>, linux-c-programming@vger.kernel.org


I can see two mistakes:

First, you have to initialize hostnamelength = sizeof(HOSTNAME);

Second, accept() doesn't alloc memory to return data in sockaddr_in*;
Then, you must define "active" variable like this: struct sockaddr_in
active;
And call: accept(skt, (struct sockaddr *) &active, &activeLen);




-----Original Message-----
From: John T. Williams [mailto:jtwilliams@vt.edu] 
Sent: quarta-feira, 20 de agosto de 2003 15:56
To: linux-c-programming@vger.kernel.org
Subject: SEGFAULT


    I can't figure out why this code sigfaults when it exits. gdb only tells
me

Program received signal SIGSEGV
0xda64a8c0 in ? ()

and shows the step as being the final "}"  in main ().
as far as I can tell this means either one of the linux libraries is wrong
or my code is doing something funny with a buffer. I'll gladly e-mail a
dollar to anyone who can tell me what is wrong with this short bit of code.
Well, I mean what is wrong that causes the SIGSEGV.


_________________CODE______________________

#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <netinet/in.h>
#include <unistd.h>
#include <netdb.h>

#define HOST_NAME_MAX 255

int main( ) {
 int loop;
 struct sockaddr_in *active;
 struct sockaddr_in passive;
 struct hostent *host;
 struct protoent *proto;
 int port, activeLen, newSkt, skt;
 char HOSTNAME[HOST_NAME_MAX];
 int hostnamelength;
 int pid;

 host = NULL;

 proto = getprotobyname("tcp");

 if( ( skt = socket(PF_INET, SOCK_STREAM, proto->p_proto  ) ) == -1 ) {
  printf("Cannot create socket\n");
  exit(1);
 }

 if(gethostname(HOSTNAME, hostnamelength) ) {
  printf("fuck\n");
  exit(1);

 }

 host = gethostbyname(HOSTNAME);

 passive.sin_family = host->h_addrtype;
 passive.sin_port = htons( 4023 );
 bcopy(host->h_addr, &passive.sin_addr, host->h_length);

 if(bind(skt, (struct sockaddr *) &passive, sizeof(passive) ) ) {
  printf("bind failed\n");
  exit(1);
 }

 if( listen(skt, 10) ) {
  printf("listen failed\n");
  close(skt);
  exit(1);
 }

 activeLen = sizeof(active);

 for(loop=0;loop<2;loop++) {


  newSkt = accept(skt, (struct sockaddr *) active, &activeLen);

  if( (pid = fork() ) == 0 ) {

   close(skt);
   printf("connection accepted\n");
   fflush(NULL);
   close(newSkt);
   _exit(0);


  } else  close(newSkt);
 }

 wait(NULL);
 sleep(1);

 close(skt);

 return 0;
}
_______________________END CODE________________

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
