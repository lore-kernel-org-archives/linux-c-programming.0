From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: Use of htons function
Date: Mon, 20 Sep 2004 13:41:22 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <414F0832.9000106@ig.com.br>
References: <20040920_160857_092073.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040920_160857_092073.r_zaca@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ronaldo Zacarias Afonso <r_zaca@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

PORTUGUES Version: Se voc=EA fala portugu=EAs posso te explicar novamen=
te.

ENGLISH Version:
When you re transmiting data over network, you sometimes don't know the=
=20
application or hardware that are in the other side (peer).Thus, you nee=
d=20
establish a standard for your data format.

Of course, when the data are characters, you could think that you dont=20
need format definition, because characters whould be easy to undertand=20
from other side. But it inst true, because the characters can be=20
codified in ASCII, EBCDIC or another way. Then, you need to establish a=
=20
standard for your data format.

Well, when the data are binary, like as a 16 bits integer instead of 5=20
number characters.... samples representations for the number "42076":
a) Big-endian hardware this number will be: 0xA4 0x5C   (2 binary bytes=
)
b) Little-endian hardware this number will be: 0x5C 0xA4  (2 binary byt=
es)
c) Text ASCII this number will be: "42076" (5 ASCII text bytes)

As you can see, you have 3 or more ways to format your number, but the =
2=20
first are smaller and less expensive for networks when the amoung of=20
fields data be large (example: a lot of fields of 16 bits or 32 bits).

Well, TCP/IP allow you a standard for binary traffic for 16 and 32 bits=
,=20
and the funciton htons() is one of them, that convert a binary data of=20
16 bits from host format to TCP/IP (network short) format. Thus, your=20
peer needs to use nstoh() function to convert the 16 bits TCP/IP binary=
=20
data to host format.

Some about big and little-endian:
- Intel is a Little-endian format
- PowerPC, mainframes, and others processor usually from Motorola or IB=
M=20
are Big-endian.
- TCP/IP use Big-endian format, then, the use of the funtions like=20
htons() on PowerPC or mainfraimes are optional, but isnt right to ommit=
=20
them, because usually they arent functions, but MACROS defined by #defi=
ne.

Regards,

Luciano



Ronaldo Zacarias Afonso wrote:

>  Hello all,=20
>
>  Some one could tell me what the function "htons" realy does? Where c=
an I=20
>use it?=20
>  I tryed to find its purpose in the "man htons", but it seems a littl=
e bit=20
>confusing.=20
>  Thanks.=20
>
>______________________________________________________________________=
___________
>Quer mais velocidade?
>S=F3 com o acesso Aditivado iG, a velocidade que voc=EA quer na hora q=
ue voc=EA precisa.
>Clique aqui: http://www.acessoaditivado.ig.com.br
>
> =20
>

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
