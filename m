From: "Thomas 'Dent' Mirlacher" <dent@cosy.sbg.ac.at>
Subject: Re: problem with <asm/semaphore.h>
Date: Tue, 4 Jun 2002 13:44:44 +0200 (MET DST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <adi9k5$c50$2@main.gmane.org>
References: <E17FCaW-0002V9-00@rammstein.mweb.co.za>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <E17FCaW-0002V9-00@rammstein.mweb.co.za>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bonganilinux@mweb.co.za
Cc: Hossein Mobahi <hmobahi@yahoo.com>, linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

On Tue, 4 Jun 2002 bonganilinux@mweb.co.za wrote:

> I think you a trying to include a file from the linux source
> which will not work for use-space apps. Try using 
> #include <semaphore.h> instead 

yes, sounds right, since struct semaphore in asm/semaphore will be
defined only if __KERNEL__ is defined.

	tm

-- 
in some way i do, and in some way i don't.

