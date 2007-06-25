From: "Pedro de Medeiros" <pedrovmm+lists@gmail.com>
Subject: Re: various meanings of static
Date: Mon, 25 Jun 2007 20:01:32 -0300
Message-ID: <38511efb0706251601n28622266k661db6c949be50cc@mail.gmail.com>
References: <467CB8EC.8080209@gmail.com>
	 <84bd26ef0706230555x35fdceber20d5788370b602ee@mail.gmail.com>
	 <18045.17976.961868.834988@cerise.gclements.plus.com>
	 <38511efb0706241408m42241137n254944e32902262c@mail.gmail.com>
	 <18048.13578.542604.949301@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        b=FvAsq3BVsLz5Zk3/lmHtkCtER2wE82G6AHYwKB08/3EWWKF5jDAW12M1lIr9uuDTpnS1GB8H4iXPbwS9wh3tuLaz2oRz52+IOaD3Xxmq9mPUSpjDQ1QSPGeozYETlHVPFC5yF7l/c3zPEmsy+SUxERJ3p8zP63xw+XzNy7njS/E=
In-Reply-To: <18048.13578.542604.949301@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On 6/25/07, Glynn Clements <glynn@gclements.plus.com> wrote:
>
> Using the preprocessor to create a project-specific language is seldom
> as good an idea as it may seem at the time, as you tend to end up with
> code which only the author understands.
>
> In general, to be able to work on a C source file should only require
> knowledge of C along with the types, variables and functions used by
> that particular file. Having to be familiar with a large number of
> project-specific conventions and idioms before you can touch anything
> tends to result in code which is hard to maintain.

Yes, now I agree.

Well, if macros are not worse than __attribute__ declarations for
machine-readability and if you acknowledge their usefulness, then
maybe you should have given the reason above in the first place. ;-)

Cheers,
Pedro.
