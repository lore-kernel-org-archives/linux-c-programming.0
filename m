From: Eric Bambach <eric@cisu.net>
Subject: Re: processor       : 0
Date: Wed, 9 Mar 2005 13:05:11 -0600
Message-ID: <200503091305.11669.eric@cisu.net>
References: <20050309183715.84484.qmail@web52901.mail.yahoo.com>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-Reply-To: <20050309183715.84484.qmail@web52901.mail.yahoo.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

On Wednesday 09 March 2005 12:37 pm, Ankit Jain wrote:
> [root@ravi sridhar]# more /proc/cpuinfo
>
> if somebody can tell me whats this processor 0
> indicates. my system is having intel processor PIV

Hmmm what are you asking? Is this a question for c-programming? Try=20
linux-newbie for any follow-up questions.
> processor       : 0
This tells you this information is for your first and only processor (b=
ecause=20
there are no more listings)
> vendor_id       : GenuineIntel
You have an Intel
> cpu family      : 15
=46amily model #
> model             : 2
Model #
> model name    : Intel(R) Pentium(R) 4 CPU 2.40GHz
In Laymen terms, what is the Processor name
> stepping          : 7
Not sure, but if you have a multiprocessor machine you need to match th=
is=20
exactly for both processors.
> cpu MHz         : 2400.114
Speed in Megahertz
> cache size        : 512 KB
Cache Size. More is better ;)
> fdiv_bug          : no
> hlt_bug            : no
> f00f_bug          : no
> coma_bug        : no
Does it suffer from various bugs that previous processors have? No, you=
r=20
processor is all good.
> fpu                  : yes
It has a floating point unit
> fpu_exception  : yes
It supports floating point exceptions
> cpuid level       : 2
> wp                    : yes
Not sure, the wp is something a hardware guru can answer.
> flags                 : fpu vme de pse tsc msr pae mce
> cx8 apic sep mtrr pge mca
>      cmov pat pse36 clflush dts acpi mmx fxsr sse sse2
> ss ht tm
These are all the "extra" instructions and features it supports. Intere=
sting=20
ones are:
sse/sse2 multimedia instructions
ht hyperthreading
acpi I forget the acronym, but this is for advanced configuration and p=
ower=20
saving features
pae Page address extentions, it lets your support 4GB of memory instead=
 of=20
16M.
> bogomips        : 4784.12
An irellevant calculation Linux uses to program its idle loop. Can be a=
 VERY=20
GENERIC indicator of processor speed but should never be relied up as a=
ny=20
sort of quantatative benchmark.
> thanks

So what was it you wanted info about? Could you be more specific? All o=
f this=20
info is fairly self-explanatory. Did you need to find out if your proce=
ssor=20
supports a specific feature?
>
> __________________________________
> Celebrate Yahoo!'s 10th Birthday!
> Yahoo! Netrospective: 100 Moments of the Web
> http://birthday.yahoo.com/netrospective/
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kerne=
l.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
----------------------------------------
--EB

> All is fine except that I can reliably "oops" it simply by trying to =
read
> from /proc/apm (e.g. cat /proc/apm).
> oops output and ksymoops-2.3.4 output is attached.
> Is there anything else I can contribute?

The latitude and longtitude of the bios writers current position, and
a ballistic missile.

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0--Alan Cox LKML-Decembe=
r 08,2000=20

----------------------------------------
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
