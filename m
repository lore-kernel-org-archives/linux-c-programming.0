From: Thomas Weber <thomas.weber.linux@googlemail.com>
Subject: Re: float
Date: Tue, 11 Jan 2011 08:46:08 +0100
Message-ID: <4D2C0AC0.2000200@gmail.com>
References: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=pEKG1T0cMy/yJjokMUIjCmPCjn+NFBPfokFothy2j8U=;
        b=WHyqoyCNTykzl1UlYeqgftpko9RP3YtDeZVvPV8NUiRQPtY612kJQJBP52UjOiCImq
         mb25zz+FrGF2buw+uNmAvV9hTS2YRHY/iivT8YW9WZEwFGkLIftcH9TdgqAWqkQ+FezK
         8QiygI8snpE3yvxzJvgqffy1bSn+puMsdV8kc=
In-Reply-To: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Am 11.01.2011 08:38, schrieb ratheesh k:
> I could not understand  why it getting printed like this. Could any
> body tell me.
> 
> #include <stdio.h>
> 
> int main()
> {
>         float f=0.0f;
>         int i;
> 
>         for(i=0;i<10;i++)
missing braces here?
>                 f = f + 0.1f;
> 
>         if(f == 1.0f)
>                 printf("f is 1.0 \n");
>         else
>                 printf("f is NOT 1.0\n");
> 
>         return 0;
> }
> --


Thomas

