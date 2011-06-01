From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: macro to print filename
Date: Wed, 01 Jun 2011 21:11:18 +0200
Message-ID: <op.vwevk4xc3l0zgt@mnazarewicz-glaptop>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
 <BANLkTinbg1RRpGFFYhge6D5YxRyGnxmT6w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:cc:subject:references
         :date:mime-version:content-transfer-encoding:from:message-id
         :in-reply-to:user-agent;
        bh=XO5dcMv7352x5UCXuZOsThhv9IvjDhzGq7ovuPc9xVI=;
        b=N8TQG0bqHLvns+hzNThudoQVCJzRJcg/9QZSsQzo37GYqZBlMDTz/wttgdmvOk8pvj
         kyRxV9OWHJzRovoyfw59s3dG4G4jEZtj2s6h6i6EoRgJiOMBp9c6cHBpwqlMkVFmPxIP
         dtz7wURlJyIiefXStTULFh5abr4prGZ3nQKhk=
In-Reply-To: <BANLkTinbg1RRpGFFYhge6D5YxRyGnxmT6w@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>, Zhongye Jia <jia.zhongye@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, 01 Jun 2011 20:08:50 +0200, Zhongye Jia <jia.zhongye@gmail.com>  
wrote:
> #include <stdio.h>
>
> int main()
> {
>         char filename[] = __FILE__, *basename;
>         basename = filename + sizeof(filename) - 2;
>         while( basename+1 != filename && *basename != '/' ) {
>                 basename--;
>         }
>         basename++;

And you are not using strchr() why?  I know OP said about not using
string libraries but I don't think he meant that he's fine with
reimplementing the wheel.

>         printf("%s\n%s\n", filename, basename);
>         return 0;
> }

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz    (o o)
ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
