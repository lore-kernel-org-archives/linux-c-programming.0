From: Mat Harris <mat.harris@genestate.com>
Subject: more socket stuff
Date: Wed, 26 Feb 2003 13:46:31 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030226134631.A23368@genestate.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--XF85m9dhOBO43t/C
Content-Type: multipart/mixed; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

i was just playing around with the sockets in an attempt to better understa=
nd
them when i found this.

i have a very simple client and server. the server is written in perl and w=
as
just there to print whatever the client sent it, and i works fine. However,
when i send it the same data from the C app, i just messes me round. Below =
is
the output from the two commands.

telnet:
	NICK aurora aurora aurora aurora aurora
	USER aurora

C app:
	USER aurora aurora aurora aurora aurora
	=C04@`?@a=E9@?@`7=E5@9@1@=C04@?=F4=FF=BF=C7@=D1=C5@=D06@`=F3=FF=BF=D0B=E81=
@JB=E81@rocr/=D0Bx4@=B8@=E81@
	y=E9@=C04G@JB=D0B`=F3=FF=BF=A8=B2B=E81@=E0=F2=FF=BF=F3=FF=BF=C04@=E81@8=F4=
=FF=BF]=CB@X      @H=F4=FF=BF7@=C04@=B8@p=F4=FF=BFP=F5=FF=BF=C0@=C0@=B5l@@@=
=B8]=F8=F5=FF=BFl@=BD@=C04@=F8=F5=FF=BF@^=D1=C2d=F8 0@=D06@=C2U=C9=C2d=F8=
=FF=FF=FF=FF=F1@=C04@(=F8=FF=BF=DB=DA@<=F6=FF=BF%=D8@=C2=F6=FF=BF=F4=F4=F4L=
inuxmaiden.genestate.com2.4.18-3smpNICK aurora
	urora aurora aurora aurora
	=C04@`?@a=E9@?@`7=E5@9@1@=C04@?=F4=FF=BF=C7@=D1=C5@=D06@`=F3=FF=BF=D0B=E81=
@JB=E81@rocr/=D0Bx4@=B8@=E81@
	y=E9@=C04G@JB=D0B`=F3=FF=BF=A8=B2B=E81@=E0=F2=FF=BF=F3=FF=BF=C04@=E81@8=F4=
=FF=BF]=CB@X      @H=F4=FF=BF7@=C04@=B8@p=F4=FF=BFP=F5=FF=BF=C0@=C0@=B5l@@@=
=B8]=F8=F5=FF=BFl@=BD@=C04@=F8=F5=FF=BF@^=D1=C2d=F8 0@=D06@=C2U=C9=C2d=F8=
=FF=FF=FF=FF=F1@=C04@(=F8=FF=BF=DB=DA@<=F6=FF=BF%=D8@=C2=F6=FF=BF=F4=F4=F4L=
inuxmaiden.genestate.com2.4.18-3smp

hm? is all that my fault. i have attached the client


--=20
Mat Harris			OpenGPG Public Key ID: C37D57D9
mat.harris@genestate.com	www.genestate.com=09

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=socket
Content-Transfer-Encoding: quoted-printable

#define MAXDATASIZE 100   /* Max number of bytes of data */

int start_socket()
{
  int fd, numbytes;       /* files descriptors */
  char buf[MAXDATASIZE];  /* buf will store received text */
 =20
  struct hostent *he;         /* structure that will get information about =
remote host */
  struct sockaddr_in server;  /* server's address information */

  if ((he=3Dgethostbyname(SERVER))=3D=3DNULL){       /* calls gethostbyname=
() */
    printf("gethostbyname() error\n");
    exit(-1);
  }

  if ((fd=3Dsocket(AF_INET, SOCK_STREAM, 0))=3D=3D-1){  /* calls socket() */
    printf("socket() error\n");
    exit(-1);
  }

  server.sin_family =3D AF_INET;
  server.sin_port =3D htons(PORT); /* htons() is needed again */
  server.sin_addr =3D *((struct in_addr *)he->h_addr);  /*he->h_addr passes=
 "*he"'s info to "h_addr" */
  bzero(&(server.sin_zero),8);

  if(connect(fd, (struct sockaddr *)&server,sizeof(struct sockaddr))=3D=3D-=
1){ /* calls connect() */
    perror("connect() error");
    exit(-1);
  }

  return fd;
}

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="conf.h"

/***************************************************************************
                  conf.h  -  Stores the config for aurora
                             -------------------
    begin                : Wed Feb 26 2003
    copyright            : (C) 2003 by Mat Harris
    email                : mat.harris@genestate.com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

/* The server that aurora will connect to */
#define SERVER "127.0.0.1"

/* The port to connect to */
#define PORT 8850

/* The name to use when connecting -- PLEASE CHANGE THIS */
#define BOTNICK "aurora"

/* Which channel to connect to */
#define CHANNEL "#cpg"

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="aurora.c"

/***************************************************************************
            aurora.c  -  The main code that holds aurora together
                             -------------------
    begin                : Wed Feb 26 2003
    copyright            : (C) 2003 by Mat Harris
    email                : mat.harris@genestate.com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

/* Load up all the necessary system libraries */
#include <stdio.h>
#include <fcntl.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <string.h>
#include <netinet/in.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>

/* Load all my libraries and headers for this project */
#include "conf.h"
#include "socket"

int main()
{
  int fdnet, count;
  char readbuf[1024], wbuf[1024], scratch[1024];

  if ((fdnet = start_socket(PORT)) < 0)
  {
    perror("Socket Error");
    exit(1);
  }
  else
  {
    printf ("Socket connected\n");
    strcpy(wbuf, "USER ");
    strcat(wbuf, BOTNICK);
    strcat(wbuf, " ");
    strcat(wbuf, BOTNICK);
    strcat(wbuf, " ");
    strcat(wbuf, BOTNICK);
    strcat(wbuf, " ");
    strcat(wbuf, BOTNICK);
    strcat(wbuf, " ");
    strcat(wbuf, BOTNICK);
    strcat(wbuf, "\n");
    write(fdnet, wbuf, sizeof(wbuf));
    printf("Sent: %s\n", wbuf);

    strcpy(wbuf, "NICK ");
    strcat(wbuf, BOTNICK);
    strcat(wbuf, "\n");
    write(fdnet, wbuf, sizeof(wbuf));
    printf("Sent: %s", wbuf);

    read(fdnet, readbuf, sizeof(readbuf));
    printf("%s", readbuf);

/*    strcpy(scratch, readbuf[0]);
    strcat(scratch, readbuf[1]);
    strcat(scratch, readbuf[2]);
    strcat(scratch, readbuf[3]);
    pingreply(readbuf);

    strcpy(wbuf, "JOIN ");
    strcat(wbuf, CHANNEL);
    strcat(wbuf, "\n\r");
    write(fdnet, wbuf, sizeof(wbuf));*/
  }

  return 1;
}

--CE+1k2dSO48ffgeK--

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+XMU2EsYvZsN9V9kRAtHzAJ9KEZtzisC+ZxjjuWzx1vHnXcdVfwCfWOlR
AYWRQuv+hJEBmS2+EVSrdCw=
=05mN
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
