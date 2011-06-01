From: Aniruddha Bhattacharyya <aniruddha.aot@gmail.com>
Subject: Re: macro to print filename
Date: Thu, 2 Jun 2011 00:54:59 +0530
Message-ID: <BANLkTimHdt6psdjPjKAPskBxaycF=-BECw@mail.gmail.com>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
 <BANLkTinbg1RRpGFFYhge6D5YxRyGnxmT6w@mail.gmail.com> <op.vwevk4xc3l0zgt@mnazarewicz-glaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=Gw6i5zErci659FhB9VAQesrnFlum4gcXw2BNgihAMMc=;
        b=gBXPUqFi98lo1FUSZUWhwLdLpe5QfRzhr/nKFMfOJY4CGkdj8JB23q806H10sFo+G9
         dkXPqxLdRXG2/XtpiIsbpHfduRpne34sC4MhMTLedvZl8De+UHRAPy6FZ/n2FphPxk9w
         fk7+ytUks4pXt92svNh7q5ep4iY+kNy+NFSdo=
In-Reply-To: <op.vwevk4xc3l0zgt@mnazarewicz-glaptop>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michal Nazarewicz <mina86@mina86.com>
Cc: ratheesh kannoth <ratheesh.ksz@gmail.com>, Zhongye Jia <jia.zhongye@gmail.com>, linux-c-programming@vger.kernel.org

=46rom what I understood, Ratheesh wanted a compile time solution.

My workaround will be to go for =A0a Makefile based compilation.
1) =A0"gcc -E yourfile.c" =A0will preprocess only. so __FILE__ will be =
expanded .

output file will be yourfile.c (with macro expanded)

2) then run your custom tool/bash script to trim the filepath to filena=
me.
use awk tool maybe.

3) Do the final compile using Gcc


On Thu, Jun 2, 2011 at 12:41 AM, Michal Nazarewicz <mina86@mina86.com> =
wrote:
>
> On Wed, 01 Jun 2011 20:08:50 +0200, Zhongye Jia <jia.zhongye@gmail.co=
m> wrote:
>>
>> #include <stdio.h>
>>
>> int main()
>> {
>> =A0 =A0 =A0 =A0char filename[] =3D __FILE__, *basename;
>> =A0 =A0 =A0 =A0basename =3D filename + sizeof(filename) - 2;
>> =A0 =A0 =A0 =A0while( basename+1 !=3D filename && *basename !=3D '/'=
 ) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0basename--;
>> =A0 =A0 =A0 =A0}
>> =A0 =A0 =A0 =A0basename++;
>
> And you are not using strchr() why? =A0I know OP said about not using
> string libraries but I don't think he meant that he's fine with
> reimplementing the wheel.
>
>> =A0 =A0 =A0 =A0printf("%s\n%s\n", filename, basename);
>> =A0 =A0 =A0 =A0return 0;
>> }
>
> --
> Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 _ =A0 =A0 _
> .o. | Liege of Serenely Enlightened Majesty of =A0 =A0 =A0o' \,=3D./ =
`o
> ..o | Computer Science, =A0Michal "mina86" Nazarewicz =A0 =A0(o o)
> ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
