From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <mariani.dario@gmail.com>
Subject: Re: make rule heritage, is that possible?
Date: Mon, 27 Jan 2014 13:18:26 -0200
Message-ID: <CAPHC=MAjs0rqpcLoURqhdkiCN2gy=FbcbS6EuxtB6c5bxd+JJw@mail.gmail.com>
References: <52E65E05.6070307@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=u88abbdxyZOSPCqrCCNeGDsI6tPirftTbD3/Z1L0jiM=;
        b=j78pQ78NM/lzIiKtyj9He4u9itfKRO0/0upOvhs0BP/oYLtZMlN5iLr8Osg7oWmgU6
         44qs6L2kOr/hfQPvDiFoF3VqsmYv+PWBm3JtU/T0Y1HYelyhbSSka5+VhEJpTRNwpvz1
         P/rq1LQqXy/+T5jX3i2JCIO2Du83HoppZteIacUDtCeaHQflZwkNVsIyeHCj/od/nQeG
         AaLN00+uWLr/olugcuV1PTDoNIdvhoA43QU/82TG4KJOAComvuMF8VppFopbQUf19XvG
         mr7gictAHh24ERPlBVmc0pijGrxOgNkH4yP9JQrKmjnL+q5Cxw5snHuiMAeiw2mNYHYI
         872w==
In-Reply-To: <52E65E05.6070307@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Daniel Hilst Selli <danielhilst@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

  Yes, I have this working. I have a top level makefile that calls
make on each subproject, and in each subproject makefile, first I
define the variables specific to the project and then I include a
common.mk. It took me some time to have it working to my taste, you
will probably have to read the make manual thoroughly as I did.
  There is another option, which I never investigated, there are many
other options for project compilation, like cmake or bjam.
  Dar=EDo

On Mon, Jan 27, 2014 at 10:24 AM, Daniel Hilst Selli
<danielhilst@gmail.com> wrote:
> I was writing a set of makefiles to build some of my projects and I s=
ee me
> copying/pasting some rules that are exactly the same, only changing t=
he
> directory where they are executed and the variables contents.
>
> Is there a way to write this kind of rules once and let it been inher=
ited
> from a make directory level to another...
>
> I think on something like this,
>
> Top Makefile
> --
> generic-rule:
>         ...
> --
>
> subdir/Makefile
> --
> inherit generic-rule
> --
>
> I think about writing this rules on a Common.mk makefile and -include=
 this
> file. Does anyone tried someting like that before?
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
