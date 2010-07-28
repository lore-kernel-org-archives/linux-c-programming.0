From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: How to make every page of a process in the page table present?
Date: Wed, 28 Jul 2010 22:13:01 +0200
Message-ID: <871vane56a.fsf@erwin.mina86.com>
References: <AANLkTin8bzODztNO=qS2AAP5LULm9PSy1-c7gvN_brjw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :references:x-face:face:x-url:x-pgp-fp:x-pgp:date:in-reply-to
         :message-id:user-agent:mime-version:content-type;
        bh=Iq1tjtIQuujbcrIEHfdqgEPqf2zL61BNRmTEysqVCXk=;
        b=cCceqOardvVq0WOpVaMzB+y4Uia7xgEmfn6yiufkFUUaju/YNIvOubNUoFUa0qbf4e
         s/vIYvZrodRyuYGyBgoAv5PyeFBTMvuqCnRC9gGjmm7GDoujz0JR50MaiZBZZUJtW1zm
         p4YdTMpkvXZhqqHvlaRJ+rEQSf83JkPGjNvk8=
In-Reply-To: <AANLkTin8bzODztNO=qS2AAP5LULm9PSy1-c7gvN_brjw@mail.gmail.com>
	(Zhongshu Gu's message of "Wed, 28 Jul 2010 13:49:51 -0400")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gu, Zhongshu" <gzs715@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

"Gu, Zhongshu" <gzs715@gmail.com> writes:
> i compiled a static program using gcc on linux and run it under kvm. I
> checked every page table entry of this process in guest memory and
> found that some pages have been mapped and some ones are not. Is this
> the feature of on-demand paging?
> My question is whether there is a solution to make all the pte present
> and mapped in the page table?
> E.g. i fork a new process and load a new elf binary, how to make every
> page mapped in the page table of this new process.

Read a byte from each page?

Why do you need such a thing?

-- 
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--
