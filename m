From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: Re: ASLR and -fpic
Date: Wed, 12 Mar 2014 16:47:14 +0530
Message-ID: <CAGZFCEEqvfxcjj1D9=aTcWkJZds5FkOF+v6me3pDk4uGyONX-w@mail.gmail.com>
References: <CAGZFCEE3+2yXqKDSAvx-9s=P-15KYGjYJpEa+mNXT9wnzc9sJQ@mail.gmail.com>
	<CACz=Wee9N4Ds1SqrpDhC=KJQ-MfeTTn=kEjWmOUpWoeGY4w+sQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=R5N8bkVtVYCQ2GbnZoHAGGts9aPyCgFW1+zVJ2tVjfI=;
        b=OI1pNrZUKMKzeHc9nIxysCyuSyFW3GwfoaH6pn7A49iWnCC+S/j80s8A+oHrZM8xHE
         kFdHk7aaE4skTlX0+UMW9zpWRvEtTrv1sD9BPDCOBBi5yWt0F50yChie6Hvab4LHesRl
         qhhisgCOSleO5opLIe88qPtGO6/GpBUrZ7XhDPUxTvByA6WxRBXGLZqLTW817NXnbAOu
         OftsISYHFnQ37xsZVlELB6UixbSLRTin8OBwHbdBfnsOEqq7x0GTlqBvfKaWHldVOqea
         1cDeS6q6jCvzpg4VPBhB7qtJmugdDB6Kjsl9hVa5VbL/ATcj3qmFv3cvjv3Aj9nxZGII
         sF4A==
In-Reply-To: <CACz=Wee9N4Ds1SqrpDhC=KJQ-MfeTTn=kEjWmOUpWoeGY4w+sQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Raphael S Carvalho <raphael.scarv@gmail.com>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

so if i enable  ASLR  using   /proc/sys/kernel/randomize_va_space,
already compiled programs ( with out fpic  ) will not be randomised ?

On Wed, Mar 12, 2014 at 4:24 PM, Raphael S Carvalho
<raphael.scarv@gmail.com> wrote:
>
>
>
> On Wed, Mar 12, 2014 at 7:47 AM, ratheesh kannoth <ratheesh.ksz@gmail.com>
> wrote:
>>
>> If we need ASLR  feature, should we compile executable with -fpic ?
>
> -fPIE -fstack-protector-all
>
>>
>>
>>
>>
>>
>>
>> -Ratheesh
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
>
> --
> Raphael S. Carvalho
