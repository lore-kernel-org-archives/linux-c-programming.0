From: ronkhu <ronkhu@ntsp.nec.co.jp>
Subject: Re: help on memory problem
Date: Wed, 08 Oct 2003 15:26:48 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F83BC38.2080508@hq.ntsp.nec.co.jp>
References: <31E38B53D182D51195FA00508BE3A33402CD20A5@zwnbc004.cala.nortel.com>
Reply-To: ronkhu@ntsp.nec.co.jp
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

How about the clean up for the data structures that have been allocated=
?
can u send us some code snippet....

-Ron

Sandro Dangui wrote:

>Do you have recursive calls?
>If you alloc all memory you need in the beginning, then the only probl=
em
>that I can figure is that you have an infinite recursive call... or a =
loop
>between calls. It may be causing a stack overflow.
>
>
>-----Original Message-----
>From: qhwang [mailto:qhwang@ieeta.pt]=20
>Sent: ter=E7a-feira, 7 de outubro de 2003 19:43
>To: linux-c-programming@vger.kernel.org
>Subject: help on memory problem
>
>
>Hi there,
>
>Can anyone help me to get out of the mess, please? I am writing a prog=
ram
>which tries to detect faces inside an image. For further comparison, n=
ow I
>use the "brutal force search" strategy which means there is a  window =
(here
>32x32) scanning the input image (e.g., 160x120) pixel by pixel.  The p=
roblem
>is, this "brutal forace search" uses quite a lot memory and it's alway=
s
>killed by the system after running a while. At first I think there are=
 some
>memory leaks but I could not find any when I set the macro MALLOC_CHEC=
K_=3D1.
>I also modify the code to make sure all the data structure are only
>allocated once, e.g., in the main program, but the problem is still th=
ere.
>When I use "top" to monitor the memory infor when the program is runni=
ng and
>find that the option "SIZE" reaches more than 250 MB and "RSS" reaches=
 40
>MB. My program is only about 110 KB. The memory of my computer is only=
 64 MB
>but with my laptop (256 MB) the problem is same. Can anybody give me s=
ome
>pointers about it?
>
>Many thanks.
>
>QingHua
>
>-
>To unsubscribe from this list: send the line "unsubscribe
>linux-c-programming" in the body of a message to majordomo@vger.kernel=
=2Eorg
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-prog=
ramming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> =20
>



-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
