From: "mikael-aronsson" <mikael-aronsson@telia.com>
Subject: Re: 64 bits integer
Date: Wed, 10 Nov 2004 08:07:38 +0100
Message-ID: <001101c4c6f3$f6af4250$bf95d1d9@w128mtec>
References: <41916F51.2060102@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>, linux-c-programming <linux-c-programming@vger.kernel.org>

Hi !

You can use the type "long long" to define 64 bit data in gcc, use strtoll()
atoll() to parse a string, and all the *printf functions has support for 64
bit values also.

Mikael

----- Original Message ----- 
From: "Luciano Moreira - igLnx" <lucianolnx@ig.com.br>
To: "linux-c-programming" <linux-c-programming@vger.kernel.org>
Sent: Wednesday, November 10, 2004 2:30 AM
Subject: 64 bits integer


> How can we do to manipulate integer higher than 32 bits in linux ?
>
> Does exist some system call (or another library), that allow us to do
> something like as following ?
>
> int64 x;
> x = atoi64("12345678901234567890");
>
> char x[21];
> i64toa(x, sizeof(x));
>
> Thanks,
>
> Luciano
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

