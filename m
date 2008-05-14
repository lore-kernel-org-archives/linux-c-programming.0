From: =?UTF-8?B?7J207KKF66+8?= <anapple.orange@gmail.com>
Subject: FW: Why does math.h not declare function round?
Date: Wed, 14 May 2008 23:31:47 +0900
Message-ID: <FE65CEDE566B4EA39A9BBA400D8FE30A@OrangeMini>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject:date:message-id:mime-version:content-type:content-transfer-encoding:x-mailer:x-mimeole:thread-index:from;
        bh=PqDpNDomr5jtllthe5d3svymg25RRmA39P32V10nl0c=;
        b=omZxfig8z6sbZRZWvlW1OTYS80iEvuYR2wLGdYugsmHyka61p9SJXXxcfuMSjTVyuufjgDjDT+KDq1h0tL+8scXu7JZrNb3qwvfEsD5S5cJMVlZs/h/KL8rckWceI0YefN4iiztyopNILt3p6614FqTFNxqCKgnxB/gEaGVwTEo=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-c-programming@vger.kernel.org

=20

-----Original Message-----
=46rom: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-progr=
amming-owner@vger.kernel.org] On Behalf Of Steve Graegert
Sent: Monday, September 24, 2007 4:10 PM
To: Plato
Cc: linux-c-programming
Subject: Re: Why does math.h not declare function round?

On 9/24/07, Plato <zhangguoqiang@xunlei.com> wrote:
> Hi!
>     I made such a program foo.c:
>
> #include <math.h>
>
> int main()
> {
>     double bar=3D1.2;
>     printf("%f\n", round(bar));
> }
>
> Then compile and run:
> [root@so41 tmp]# gcc foo.c -ofoo -lm
> [root@so41 tmp]# ./foo
> 0.000000
>
> The result was obviously wrong. Then I add statement:
> #include <math.h>
> double round(double x);
>
> int main()
> {
>     double bar=3D1.2;
>     printf("%f\n", round(bar));
> }
>
> Then compile and run:
> [root@so41 tmp]# gcc foo.c -ofoo -lm
> [root@so41 tmp]# ./foo
> 1.000000
>
> Now it's right.
>
> I wonder why function round not declared in math.h. Anyone have idea?

It is available in C99 mode only (see <bits/mathcalls.h>):

#ifdef __USE_ISOC99
__MATHCALLX (round,, (_Mdouble_ __x), (__const__));

To write fully portable code use floor() and ceil() instead.

	\Steve

--

Steve Gr=C3=A4gert <steve@graegert.com>
Internet: http://digitalether.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in the body of a message to majordomo@vger.kernel.org More majo=
rdomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
