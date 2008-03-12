From: "Bert Wesarg" <bert.wesarg@googlemail.com>
Subject: Re: How to name the pthread or Renaming?
Date: Wed, 12 Mar 2008 09:12:46 +0100
Message-ID: <36ca99e90803120112s7091ea4foa616ecbd631cea38@mail.gmail.com>
References: <47D51268.7020705@sun.com>
	 <36ca99e90803100723q142411e0r8e0462be8eac5d6d@mail.gmail.com>
	 <47D54A87.6010608@sun.com>
	 <36ca99e90803100941u4294b271lb295ad4b2a3b33ed@mail.gmail.com>
	 <47D61F00.1090507@sun.com>
	 <36ca99e90803110605g16ed53a8je2e40316c9618ca4@mail.gmail.com>
	 <47D78410.1020906@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=QmodgnGr+36dAQ6EOjvVkil39tCTy+ZJg7rZ/G2fFAg=;
        b=JmA0A4oHwepI+7/CfEPHx54ilC2/weKmpmVvAY38CW9I3nG2PLUV1p3edCMLwZZ87jTAbp9/LV/bEBEF4Az2DQRpNRHUoqIXp+vAi6wGbMrNfNoSDOIL4YdCDaTB+eIr1Ako4aE1mWGF0dIMcRmGzChH7tEeWCZtwBNN/4XVYhE=
In-Reply-To: <47D78410.1020906@sun.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ziaudeen.Abdulrazak@sun.com
Cc: linux-c-programming@vger.kernel.org

On Wed, Mar 12, 2008 at 8:19 AM, ziaudeen <Ziaudeen.Abdulrazak@sun.com> wrote:
>
>  Bert Wesarg wrote:
>  Ok, I was wrong, the name you can set with prctl is indeed a
> per-thread attribute. you can see this either in the stat file from
> the /proc filesystem (inside parentheses) or with ps and the comm
> format, not the args format, and the same with top, where you switch
> this with 'c'.
>
>  Could you please tell me exactly what is the command " ps -c" Is it ? I
> don't understand the comm mode means..
I wrote 'comm format' and not 'mode'. if you mean with the '-c' the
misc option 'true command name', than why do you put a '-' in front of
it? the help message shows only a single 'c' => "ps c"

Bert

>
>  - Ziaudeen
