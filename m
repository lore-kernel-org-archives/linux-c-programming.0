From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: A exploitable C program
Date: Fri, 12 Jul 2002 13:01:06 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020712130106.A4048@neutrino.particles.org>
References: <20020711233356.F343@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020711233356.F343@nietzsche.metrotel.net.co>; from xlp@emtel.net.co on Thu, Jul 11, 2002 at 11:33:56PM -0500
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ashtrax <xlp@emtel.net.co>
Cc: linux-c-programming@vger.kernel.org

On Thu, Jul 11, 2002 at 11:33:56PM -0500, ashtrax wrote:
> Hi, I keep trying to understand buffer overflow, I would like you help me finding a exploitable C program, not so complex, that demands me a serious and deep analysis of how find shellcode, elf disamble and other process I already ignore.
> I want to have the ability of release proof of concept exploit and understand credentials, setiud root and all secure programming topics.
> What program do you suggest for have a good start?

Please, use a mail client with a sane wrapping.

The most combrehensive tutorial regarding buffer overflow, AFAIK, is:

http://www.shmoo.com/phrack/Phrack49/p49-14

It doesn't cover non-executable stacks though. I doubt that you'll test
your code in an OS which provides non-executable stacks.

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
