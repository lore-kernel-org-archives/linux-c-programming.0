From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: out of memory
Date: Wed, 8 Oct 2003 10:31:07 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000001c38da0$6ece3f40$0b04a8c0@aca.org.ar>
References: <31E38B53D182D51195FA00508BE3A33402CE4E51@zwnbc004.cala.nortel.com>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <31E38B53D182D51195FA00508BE3A33402CE4E51@zwnbc004.cala.nortel.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Yes, but don't send the code snippet as an attachment. It's seems like =
you
have problems with that.
Send your code snippet as part of the message body please


-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Sandro
Dangui
Enviado el: Mi=E9rcoles, 08 de Octubre de 2003 09:44
Para: qhwang
CC: linux-c-programming@vger.kernel.org
Asunto: RE: out of memory



Then you have to send us the piece of code that contains this hungry lo=
op.


-----Original Message-----
=46rom: qhwang [mailto:qhwang@ieeta.pt]
Sent: quarta-feira, 8 de outubro de 2003 09:36
To: Dangui, Sandro [CMPS:RY11:EXCH]
Cc: linux-c-programming@vger.kernel.org
Subject: Re: out of memory




> Do you have recursive calls?
> If you alloc all memory you need in the beginning, then the only
> problem that I can figure is that you have an infinite recursive
> call... or a loop between calls. It may be causing a stack overflow.

In my program there is a loop over 10k iteratives (image). In each loop
there are some kind of statistical learning algorithm running. It is ki=
lled
after it uses about 650 MB space (code + mainly data) with my laptop af=
ter
out of memory and swap.  I believe the problem lies inside the loop but
there should be no infinite loop because when I reduce the loop to over=
 1k
iteratives the program runs well. In this case it uses more 100 MB spac=
e.

I wonder where is this huge data space requirement coming from, since t=
here
is no memory allocation inside the loop?



> BTW: You have problems with your e-mail:
It's very strange.

QingHua


-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
