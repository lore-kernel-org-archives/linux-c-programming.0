From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: connecting to a hoast
Date: Mon, 13 Sep 2004 02:16:45 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1095059805.2813.0.camel@client001>
References: <Pine.LNX.4.61.0409121703550.2066@debian>
Reply-To: jtwilliams@vt.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0409121703550.2066@debian>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John T Williams <jtwilliams@contextweb.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Ok

-------- Start Code ---------------------------------
#include <sys/socket.h>         // for connection api
#include <sys/types.h>          // for predefined values
#include <netdb.h>              // for hostname resolution api

char* host =3D "ftp.domain.com=A1;
int port =3D 25;
struct sockaddr_in passive; =20
struct protoent * proto;
int skt;

proto =3D getprotobyname("tcp")  =20
// gets the prototype number for tcp/ip=20

skt =3D socket(PF_INET, SOCK_STREAM, proto->p_proto );   =20
//creates a socket=20

passive.sin_family      =3D AF_INET;             =20
// IPv4 connection type
passive.sin_addr        =3D gethostbye(host);    =20
// resolves the hostname and returns the correct in_addr
passive.sin_port        =3D htons(port);         =20
// htons changes the bit order so that it is in network format

connect(skt, &passive, sizeof(passive));       =20
// connect to host  =20

close(skt);
// close connection
-------- End Code -----------------------------------
this code does not check for errors and will probably crash if anything
goes wrong.  How ever it does show how to connect to a server.

You should read:
http://www.gnu.org/software/libc/manual/html_node/Connections.html#Conn=
ections

- John


On Sun, 2004-09-12 at 16:04, Ameer Armaly wrote:
> Hi all.
> I was wondering, where is a step by step instructions to connect to a=
=20
> hoast?
> The documentation seems very cryptic, and doesn't give directions.
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
