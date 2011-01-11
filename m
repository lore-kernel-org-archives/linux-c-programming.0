From: Thomas Weber <thomas.weber.linux@googlemail.com>
Subject: Re: float
Date: Tue, 11 Jan 2011 09:01:45 +0100
Message-ID: <4D2C0E69.8050800@gmail.com>
References: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com> <AANLkTi=7Qg7LMats1A3p-c_-pzYsxyeqc8=gj6soEaUM@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=oQbCbZr5ukvtqQNqFakR3J4gC/UwNaR3zFTBQljUI4k=;
        b=AGaZrVKDBU7bd2vfSTIhcmMSgRncksf4DLVhyzxXcvrS9J1N3auR7yQQQJLkQ8JtHn
         dNIOLQTurZcpL9nLDCbxsrHrjwa0RT/voFet7EGBKsNdJfQA81qgaig21R7aZuRxwbpT
         1izxVQlETZGGD80aIepjHkMNiXBjTaWPyZmrs=
In-Reply-To: <AANLkTi=7Qg7LMats1A3p-c_-pzYsxyeqc8=gj6soEaUM@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Uriel Corfa <uriel@corfa.fr>
Cc: ratheesh k <ratheesh.ksz@gmail.com>, linux-c-programming@vger.kernel.org

Am 11.01.2011 08:55, schrieb Uriel Corfa:
> I'd say : rounding errors. Floating point goes in mysterious ways.
> 
> On Tue, Jan 11, 2011 at 8:38 AM, ratheesh k <ratheesh.ksz@gmail.com> wrote:
>> I could not understand  why it getting printed like this. Could any
>> body tell me.
>>
>> #include <stdio.h>
>>
>> int main()
>> {
>>        float f=0.0f;
>>        int i;
>>
>>        for(i=0;i<10;i++)
>>                f = f + 0.1f;
>>
>>        if(f == 1.0f)
>>                printf("f is 1.0 \n");
>>        else
>>                printf("f is NOT 1.0\n");
>>
>>        return 0;
>> }
> 

Okay, now I got it.

Look for IEEE754.

0.1 is in double precision 0.10000000149011612

Thomas
