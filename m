From: Karsten Jeppesen <kj-list@jeppesens.com>
Subject: Re: actual memory size
Date: Wed, 31 Jul 2002 09:15:51 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <12564.4405991354$1028132352@news.gmane.org>
References: <3D47C16C.26CE722D@cs.unt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3D47C16C.26CE722D@cs.unt.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mehran Rezaei <mehran@CS.UNT.EDU>, gcc news group <linux-gcc@VGER.KERNEL.ORG>, C news group <linux-c-programming@VGER.KERNEL.ORG>

There are a number of possibilities.
Most likely you are looking for:

cat /proc/meminfo

which tells you what the machine itself was told about mem.
You can also use:

top

which amongst other things also gives you the mem info.


Sincerely,

Dr. Karsten Jeppesen
VP of Technology
Total Impact
<kj@totalimpact.com>     Phn: (805) 987-8704     Fax: (805) 484-9469
----------------------------------------------------------------------
Satellite Safety Tip #14:
    If you see a bright streak in the sky coming at you, duck.
----------------------------------------------------------------------




> 
> Hello,
> 
> Is anyone aware of a shell command that tells you the size of physical
> memory used in your computer?
> Any help is appreciated.
> So long,
> 
> Mehran
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-gcc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

