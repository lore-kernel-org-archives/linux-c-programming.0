From: "John T. Williams" <jtwilliams@vt.edu>
Subject: SEGFAULT
Date: Wed, 20 Aug 2003 14:56:12 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001301c3674c$bc7dc3c0$ed64a8c0@descartes>
References: <3F3D20F3.7030304@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

    I can't figure out why this code sigfaults when it exits.
gdb only tells me

Program received signal SIGSEGV
0xda64a8c0 in ? ()

and shows the step as being the final "}"  in main ().
as far as I can tell this means either one of the linux libraries is wrong
or my code is doing something funny with a buffer.
I'll gladly e-mail a dollar to anyone who can tell me what is wrong with
this short bit of code.  Well, I mean what is wrong that causes the SIGSEGV.


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

