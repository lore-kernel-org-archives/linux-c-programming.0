From: Benjamin Sobotta <mayday@gmx.net>
Subject: Re: processor       : 0
Date: Wed, 9 Mar 2005 19:55:04 +0100
Message-ID: <200503091955.04749.mayday@gmx.net>
References: <20050309183715.84484.qmail@web52901.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050309183715.84484.qmail@web52901.mail.yahoo.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

On Wednesday 09 March 2005 19:37, Ankit Jain wrote:
> [root@ravi sridhar]# more /proc/cpuinfo
>
> if somebody can tell me whats this processor 0
> indicates. my system is having intel processor PIV
>
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 15
> model             : 2
> model name    : Intel(R) Pentium(R) 4 CPU 2.40GHz
> stepping          : 7
> cpu MHz         : 2400.114
> cache size        : 512 KB
> fdiv_bug          : no
> hlt_bug            : no
> f00f_bug          : no
> coma_bug        : no
> fpu                  : yes
> fpu_exception  : yes
> cpuid level       : 2
> wp                    : yes
> flags                 : fpu vme de pse tsc msr pae mce
> cx8 apic sep mtrr pge mca
>      cmov pat pse36 clflush dts acpi mmx fxsr sse sse2
> ss ht tm
> bogomips        : 4784.12
>
> thanks
>
>
>
>
> __________________________________
> Celebrate Yahoo!'s 10th Birthday!
> Yahoo! Netrospective: 100 Moments of the Web
> http://birthday.yahoo.com/netrospective/
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

That indicates that it is processor _number_ zero in your system.

Cheers,

Ben
