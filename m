From: "K. Anantha Kiran" <ananth@cse.iitk.ac.in>
Subject: Re: Reading BIOS
Date: Sat, 27 Nov 2004 15:13:01 +0530
Message-ID: <41A84C25.9080707@cse.iitk.ac.in>
References: <1101371672.3795.36.camel@myLinux> <20041125105214.GF2067@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041125105214.GF2067@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>

Can anybody give references to interpret the output of *lspci* command

Thanks In Advance
K.Ananth

Jan-Benedict Glaw wrote:

>On Thu, 2004-11-25 14:04:32 +0530, Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
>wrote in message <1101371672.3795.36.camel@myLinux>:
>  
>
>>Hi,
>>Is it possible to probe for, say, ide controllers from the BIOS, CMOS
>>information with a C program? Is there any documentation available
>>regarding the same??
>>    
>>
>
>Well, you don't really want to fiddle with physical addresses from
>within userspace programs while running a protected-mode operating
>system:-)
>
>If you only want to know the type of IDE controller, and if your
>hardware wasn't build during stone age, it's probably as simple as
>reading the IDE controller's PCI device IDs. There's a libpci available
>for Linux which helps you doing this (because there are different access
>methods for accessing the PCI busses).
>
>'lspci' for example uses it, probably parsing lspci's output is just
>enough for your job...
>
>MfG, JBG
>
>  
>

