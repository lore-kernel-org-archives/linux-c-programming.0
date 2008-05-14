From: =?ks_c_5601-1987?B?wMzBvrnO?= <anapple.orange@gmail.com>
Subject: FW: NAN and complex.h
Date: Wed, 14 May 2008 23:31:47 +0900
Message-ID: <D9FA32E4672744FA8FA42D9CE4309C24@OrangeMini>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject:date:message-id:mime-version:content-type:content-transfer-encoding:x-mailer:x-mimeole:thread-index:from;
        bh=aiRLah9LEJnDezkqkxzdViLtyUnnF9lEY3usMtAkzLw=;
        b=oxPfXHDOKS8oM2xzFIS/9l3Cr21r20hGTdQ0jbInx/oa+qAYEIfbfSTrvhijQ3HJ0imb4AAjTUAP175cXqHw4XymgPC+OfssgD4DNPycQBDj4sAQX3KRo/jwdrhCCKdbwu0xNXZxNLKIoSlyn0uCqiFBuT9N/0oXhb2aScyBPz4=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

 

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-programming-
owner@vger.kernel.org] On Behalf Of Lukasz Mielicki
Sent: Monday, September 24, 2007 3:31 PM
To: linux-c-programming@vger.kernel.org
Subject: Re: NAN and complex.h

> Hi I made a program which basically averages data from a file. The 
> data is stored as complex float and I'm reading it with fread with no
problem.
> Some
> data are taged as NAN (at least ENVI, an image procesing soft read 
> these values as NAN). If I average the whole data adding a number with 
> a NAN gives me a NAN and my whole program fails.
>
> What I did is the folowing which doesn't seems to work:
>
> if(cabsf(zhhzhh)!= NAN)
> {
>    printf("%f\n", cabsf(zhhzhh));
> }
>
> For some reason the test seeams to be positive all the time, I keep 
> printing NAN's ("nan" actualy).
>
> Any idea?

use isnan or isfinite to check for wrong values

BX
-
To unsubscribe from this list: send the line "unsubscribe linux-c-
programming" in the body of a message to majordomo@vger.kernel.org More
majordomo info at  http://vger.kernel.org/majordomo-info.html

