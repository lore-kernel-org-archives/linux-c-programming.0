From: =?UTF-8?B?5L+e6aKQ6LaF?= <yyc1992@gmail.com>
Subject: Re: extra slash in current path
Date: Thu, 23 Jun 2011 11:02:26 -0400
Message-ID: <BANLkTi=AeqT1CmiiNUXOcxYPe9=ORKME9g@mail.gmail.com>
References: <BANLkTi=y1roManmZGMLBXSFbBVqK_KqDZg@mail.gmail.com>
 <20110623153116.404f2a63.taeuber@bbaw.de> <BANLkTinOb-4Xm_W2fmzivk6jBJwjeHYKVA@mail.gmail.com>
 <BANLkTimXH8K91cZ69oPRu=wbYt9JgBadfA@mail.gmail.com> <BANLkTin9bQ4hzs-odYU-Gxy-f-T+HLLAdQ@mail.gmail.com>
 <4E034E2A.1010100@msgid.tls.msk.ru> <20110623165206.d88dcbb3.taeuber@bbaw.de> <BANLkTimdzyT6w2LoKtTjhHTKF5d6zWXFGw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:content-type:content-transfer-encoding;
        bh=mCz+AahjAvqeE2UqjzcwxkS9g8bFQjHvmbYfkKNX3jA=;
        b=MhJWsoArqWXlCOXbgTTbM8yLweQgTmHG20drrYRqWPkJR2d1dkpPrCcbcVB2YUXSSt
         Ezflq33v/SrIzsm3IrU8YyxKMyVxPG31Qk/JNOgZVxmIWjB1VNtqUVD/fl63ZLl6rn6J
         OKYU5zD2BdXP9vGv0L4TxP5lz8tQsP7donLqM=
In-Reply-To: <BANLkTimdzyT6w2LoKtTjhHTKF5d6zWXFGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

On Thu, Jun 23, 2011 at 10:52 AM, Lars T=E4uber <taeuber@bbaw.de> wrote=
:
> Am Thu, 23 Jun 2011 18:31:06 +0400
> Michael Tokarev <mjt@tls.msk.ru> schrieb:
>> 23.06.2011 18:11, yuyichao-mit wrote:
>>
>> >>>> $ cd //
>> >>>> $ pwd
>> >>>> //
>>
>> The current directory is cached in $PWD environment
>> variable by shell (bash at least). =A0This variable is
>> checked in glibc (getcwd() et al) - if it is set and
>> stat($PWD) is the same as stat("."), that value is used.
>
> It also is somehow cached inside bash/dash for it's built in commands=
=2E
> $ cd //
> $ export PWD=3D5

this PWD=3D5 is not necessary.

> $ pwd
> //
> $ /bin/pwd
> /

$ export PWD=3D////
$ /bin/pwd
/
$ pwd
//
$ echo $PWD
////
$ a.out (simply output get_current_dir_name())
////
so getcwd indeed use $PWD (for symlink?) but pwd and /bin/pwd both
simplify the output although bash simplify it in a strange way~~~

~~interesting

>
>
> Regards
> Lars
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
