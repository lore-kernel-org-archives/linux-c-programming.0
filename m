From: "Curry, Matthew Leon" <mlcurry@sandia.gov>
Subject: Re: [EXTERNAL] Is defined() macro portable or GNU only?
Date: Wed, 30 Sep 2015 21:27:46 +0000
Message-ID: <D231AF64.FCEF%mlcurry@sandia.gov>
References: <CAF3SDA7TQOz9Vzk+iVzLn2SgxW22R-jARjJ+yzvYkSYXnzzM+A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAF3SDA7TQOz9Vzk+iVzLn2SgxW22R-jARjJ+yzvYkSYXnzzM+A@mail.gmail.com>
Content-Language: en-US
Content-ID: <D04DC606BC74604686E4A542732E9934@sandia.gov>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Daniel." <danielhilst@gmail.com>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

It=B9s part of ANSI C, and is described in K&R.

Matthew

On 9/30/15, 1:25 PM, "linux-c-programming-owner@vger.kernel.org on beha=
lf
of Daniel." <linux-c-programming-owner@vger.kernel.org on behalf of
danielhilst@gmail.com> wrote:

>Hi all,
>
>I used to check definitions with #ifdef, but in cases where
>multiple macros are checked I use #if defined(foo) && defined(bar).
>Is this defined() check portable/standard? Or is some kind of
>extension added by GCC?
>
>Regards,
>- dhs
>--=20
>"Do or do not. There is no try"
>  Yoda Master
>--
>To unsubscribe from this list: send the line "unsubscribe
>linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
