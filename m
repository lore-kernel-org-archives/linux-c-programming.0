From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Why does math.h not declare function round?
Date: Mon, 24 Sep 2007 09:10:27 +0200
Message-ID: <6a00c8d50709240010j4b994474tc0e2a671ac8de963@mail.gmail.com>
References: <200709241210070352829@xunlei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=/D64HF3dQ8M2OKD2LHHp1qyasrpJRAvbufB3U83GcVI=;
        b=T1rJajmI+mezYP1WPvdk6Q0cZgWTYEgKc5fALadOr3rWPF/uvW9hBItFWxnqIhkQ9DpmsJOBUaEUwAls3hJ7f2DnjjAXBB0NS+qmlk2h0DgUQfS+NXPJWJvQBuOMCHeOJAnC70wxJoqCDr4sIUWvzyGlWpXuT2EmEbbRb+e5KpE=
In-Reply-To: <200709241210070352829@xunlei.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Plato <zhangguoqiang@xunlei.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

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

Steve Gr=E4gert <steve@graegert.com>
Internet: http://digitalether.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
