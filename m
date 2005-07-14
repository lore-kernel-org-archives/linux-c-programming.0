From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: macros with global variables?
Date: Thu, 14 Jul 2005 08:35:15 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0507140830420.4466@mathanlap1.rdmcorp.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="17476865-1104785889-1121344515=:4466"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: C programming list <linux-c-programming@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--17476865-1104785889-1121344515=:4466
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


  not sure if this is outside the scope of this mailing list but i
just downloaded the source for a simple SSL-aware ftp client
(netkit-ftp-ssl), did the configure and the make and got:

ftp.c: In function =E2recvrequest=E2:
ftp.c:1127: error: =E2pdata=E2undeclared (first use in this function)
ftp.c:1127: error: (Each undeclared identifier is reported only once
ftp.c:1127: error: for each function it appears in.)


  ok, fair enough, check the offending header file to find the
following macro definition:

#define is_ssl_fd(X,Y)    ( (SSL_get_fd((X))=3D=3D0) || \
                            (SSL_get_fd((X))=3D=3D1) || \
                            (SSL_get_fd((X))=3D=3Dpdata) || \
                            (SSL_get_fd((X))=3D=3D(Y)) \

  ?????.  so i have a macro which accepts two arguments, but expands
to include an explicit reference to something called "pdata", which
does not exist, hence the error message.

  i tend to avoid defining macros that refer to anything but their own
arguments.  what might the above mean?  is there some well-known idiom
for C programmers that makes the above, in some way, acceptable?
(i've perused the code and the object "pdata", whatever that is, is
simply not defined anywhere.  so is there a context in which the above
makes sense in some way?)

rday
--17476865-1104785889-1121344515=:4466--
