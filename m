From: "Daniel." <danielhilst@gmail.com>
Subject: Re: [EXTERNAL] Is defined() macro portable or GNU only?
Date: Thu, 1 Oct 2015 10:11:30 -0300
Message-ID: <CAF3SDA4B=sKK_smuRspwQY6D19XWAgCRn89qWt-vW71y51TBdQ@mail.gmail.com>
References: <CAF3SDA7TQOz9Vzk+iVzLn2SgxW22R-jARjJ+yzvYkSYXnzzM+A@mail.gmail.com>
	<D231AF64.FCEF%mlcurry@sandia.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=OTng2DJQJfrEFBsoGQylPzVo89IKaGrQxB/rxM0zbhY=;
        b=lUU09vHYdDL7/wPiKq+M+ADRo/oXwINHVjZveMtNEkW0knXbNc4TVIIp6d0atcIMDa
         OeD0iZSuZ7/Rm/IE9IV2Wm6TmCdfpGjbm0i56QQ2/OZ/GlQG/60CuNZbRhAiRsq1JAsF
         NL2hmu8sFQvZvcHqzfOQpfeoUWIofazkqFnCabJCmZo05MLhj1bKrQNpsOTSI46UDRBv
         RSnxUSavsoZgGWZIGkgAoZm0ktW1GJsrZs6Tv/HCufMuuB8tYl/+PqHXk7PVtBM2sMhc
         ufkL5Rc3NpdhS1voKyxhR2c0ObqtI3KqzgGHXqvjo8zPMTqW0GzPP/YQFzWopBWF1uAr
         Poew==
In-Reply-To: <D231AF64.FCEF%mlcurry@sandia.gov>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Curry, Matthew Leon" <mlcurry@sandia.gov>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Thank you Matthew!

Regards,
- dhs

2015-09-30 18:27 GMT-03:00 Curry, Matthew Leon <mlcurry@sandia.gov>:
> It=C2=B9s part of ANSI C, and is described in K&R.
>
> Matthew
>
> On 9/30/15, 1:25 PM, "linux-c-programming-owner@vger.kernel.org on be=
half
> of Daniel." <linux-c-programming-owner@vger.kernel.org on behalf of
> danielhilst@gmail.com> wrote:
>
>>Hi all,
>>
>>I used to check definitions with #ifdef, but in cases where
>>multiple macros are checked I use #if defined(foo) && defined(bar).
>>Is this defined() check portable/standard? Or is some kind of
>>extension added by GCC?
>>
>>Regards,
>>- dhs
>>--
>>"Do or do not. There is no try"
>>  Yoda Master
>>--
>>To unsubscribe from this list: send the line "unsubscribe
>>linux-c-programming" in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



--=20
"Do or do not. There is no try"
  Yoda Master
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
