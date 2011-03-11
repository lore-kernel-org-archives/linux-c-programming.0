From: ern0 <ern0plus4@gmail.com>
Subject: Re: g++ without typecast
Date: Fri, 11 Mar 2011 13:23:38 +0100
Message-ID: <4D7A144A.3020902@gmail.com>
References: <AANLkTi=GUjHMhXcWdaMbop+4f5Q9t549dOHECFvUAQtj@mail.gmail.com> <AANLkTikM+tApusZWzpcVRXThYGsJdzek1BSA7DBG8yx=@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=6UUtLW6I0hLCAJXu+jvbre3MZxutNWzgR1y9h6CIrAI=;
        b=lSAWt2k3t88CmL5jQhkrVffOaiXeld+v2ffrzXUR5YVwoYUj6MGsyCqanOkr+Y6SHo
         yAgNK6C9nU2kdsE4ECLg9qof0YMN3B+AkIrbIew0x/kUDROtCfdMwLVJ0xQ6hRhp2JUV
         qjM+HIPvNdY5p5yRhwqDmYdyaY7MKDtLbIxvM=
In-Reply-To: <AANLkTikM+tApusZWzpcVRXThYGsJdzek1BSA7DBG8yx=@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 03/11/2011 12:42 PM, ratheesh k wrote:
> Is there any flag or anyother way thru which we could compile this
> using g++ ( without explicit type cast )

AFAIK there's no syntax for define pointer constant values in the source 
code.

Don't afraid casting, it costs nothing. If you wanna use pointer 
constant values for special meanings, give them a name and #define it, 
just like NULL (which means "points to no object/struct/etc").
-- 
ern0
dataflow programmer
