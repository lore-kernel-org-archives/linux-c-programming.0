From: Bogdan Cristea <cristeab@gmail.com>
Subject: Re: printf and long double
Date: Mon, 4 Oct 2010 15:03:27 +0300
Message-ID: <201010041503.27721.cristeab@gmail.com>
References: <20101003225652.GA3618@dinofilaria.home> <19625.11998.318578.160832@cerise.gclements.plus.com> <4CA9C086.1050401@wired-net.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:organization:to:subject
         :date:user-agent:references:in-reply-to:cc:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=p7XN8FrnmxNxeUcvnx4+QwW7SNBygikK2gZraCUN24o=;
        b=x9k1HEdy/TwDuMlgOGEQfWCsMb4kXrCqCYl6ZLQ2t/nyYsRuVm0tWhkaaSE8eYuXq7
         O3hKPRcyHLMwrd2q7vk0Ow8AGztVWFuGdygsdQerxby93P70tIVYsP0ZjUYPKeDna+X6
         ZKEK8lsKr8YOx/dfiQsvMUWNJ8bwNg9YCh/YA=
In-Reply-To: <4CA9C086.1050401@wired-net.gr>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Chrysostomos Nanakos <nanakos@wired-net.gr>
Cc: linux-c-programming@vger.kernel.org

On Monday 04 October 2010 14:54:46 you wrote:
> I wish I could get 24 decimal digits precision with the current long 
> double (80-bit). I can't get more than 15 digits even in a simple division.
> I think that the extended-precision can't give more than 19 decimal 
> digits of precision (log(10,2^64)=19.2). The quadruple precision can 
> give at most 34 decimal digits (log(10,2^113)=34).
> 
> Please consider the example below:
> --------------------------------------------------
> long double a = 1.0L/7.0L;
> printf("%Lf\n",a);
> --------------------------------------------------
> 
> Can't get more than 15 digits precision....-:(
> Is this a compiler problem or libc's problem? In x86_64 machines the 
> long double values supposed to give at least 106-bit precision even when 
> implemented in software. Is gcc compliant with the quadruple notation?

Have you tried to specify manually the number of digits after the decimal 
point ?

	long double a = 1.0L/7.0L;
	printf("%'.100Lf\n",a);

On a 64 bits machine the output is:

0.1428571428571428571409210675491330277964152628555893898010253906250000000000000000000000000000000000

regards
Bogdan
