From: Antonio Tellez Flores <atellezf@yahoo.com.mx>
Subject: Re: question about iostream.h
Date: Sat, 16 Oct 2004 03:15:06 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1097914367.23096.2.camel@localhost>
References: <1097907587.3872.21.camel@localhost.localdomain>
	 <1097912468.22833.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1097912468.22833.2.camel@localhost>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Parrilla <eparrilla@comcast.net>
Cc: linux prg <linux-c-programming@vger.kernel.org>

Hi
> =1B
> > I am trying to use
> > <iostream.h> or <iostream> but it keeps telling me that file is not
> > found
> > but I found file located at:
> >=20
> > /usr/include/g++-3/iostream.h
> >=20
> > if I type
> > #include </usr/include/g++-3/iostream.h>
> > it gives me the following error:
> > /usr/include/g++-3/iostream:6:22: iostream.h: No such file or direc=
tory
> > linktest1.c:8:16: list: No such file or directory
>=20
> add the next lines:=20
>=20
> #include <iostream>
> using namespace std;

and compile with g++ instead of gcc

bye
--=20
Antonio T=E9llez Flores
Ciencias de la Computaci=F3n
=46acultad de Ciencias - UNAM
Home Page: http://ada.fciencias.unam.mx/~atellez

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
