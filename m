From: Piyush Jain <piyushj@cse.iitk.ac.in>
Subject: RE: out of memory
Date: Wed, 8 Oct 2003 19:08:44 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0310081907460.12906-100000@csews112.cse.iitk.ac.in>
References: <000001c38da0$6ece3f40$0b04a8c0@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000001c38da0$6ece3f40$0b04a8c0@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: mariano_moreyra@aca.org.ar
Cc: linux-c-programming@vger.kernel.org

plz. send the code relevant part only...
On Wed, 8 Oct 2003, Mariano Moreyra wrote:

> Yes, but don't send the code snippet as an attachment. It's seems lik=
e you
> have problems with that.
> Send your code snippet as part of the message body please
>=20
>=20
> -----Mensaje original-----
> De: linux-c-programming-owner@vger.kernel.org
> [mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Sandro
> Dangui
> Enviado el: Mi=E9rcoles, 08 de Octubre de 2003 09:44
> Para: qhwang
> CC: linux-c-programming@vger.kernel.org
> Asunto: RE: out of memory
>=20
>=20
>=20
> Then you have to send us the piece of code that contains this hungry =
loop.
>=20
>=20
> -----Original Message-----
> From: qhwang [mailto:qhwang@ieeta.pt]
> Sent: quarta-feira, 8 de outubro de 2003 09:36
> To: Dangui, Sandro [CMPS:RY11:EXCH]
> Cc: linux-c-programming@vger.kernel.org
> Subject: Re: out of memory
>=20
>=20
>=20
>=20
> > Do you have recursive calls?
> > If you alloc all memory you need in the beginning, then the only
> > problem that I can figure is that you have an infinite recursive
> > call... or a loop between calls. It may be causing a stack overflow=
=2E
>=20
> In my program there is a loop over 10k iteratives (image). In each lo=
op
> there are some kind of statistical learning algorithm running. It is =
killed
> after it uses about 650 MB space (code + mainly data) with my laptop =
after
> out of memory and swap.  I believe the problem lies inside the loop b=
ut
> there should be no infinite loop because when I reduce the loop to ov=
er 1k
> iteratives the program runs well. In this case it uses more 100 MB sp=
ace.
>=20
> I wonder where is this huge data space requirement coming from, since=
 there
> is no memory allocation inside the loop?
>=20
>=20
>=20
> > BTW: You have problems with your e-mail:
> It's very strange.
>=20
> QingHua
>=20
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20

"Anyone can do any amount of work provided=20
	it isn't the work he is supposed to be doing at the moment."
-----------------
Piyush Jain
PhD Student (CSE)
G-108/Hall7
Mobile:9839079614


-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
