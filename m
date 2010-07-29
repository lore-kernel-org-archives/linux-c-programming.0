From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: How to make every page of a process in the page table present?
Date: Thu, 29 Jul 2010 11:23:29 +0100
Message-ID: <19537.22177.99459.671105@cerise.gclements.plus.com>
References: <AANLkTin8bzODztNO=qS2AAP5LULm9PSy1-c7gvN_brjw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <AANLkTin8bzODztNO=qS2AAP5LULm9PSy1-c7gvN_brjw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Gu, Zhongshu" <gzs715@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org


Gu, Zhongshu wrote:

> i compiled a static program using gcc on linux and run it under kvm. I
> checked every page table entry of this process in guest memory and
> found that some pages have been mapped and some ones are not. Is this
> the feature of on-demand paging?

Yes.

> My question is whether there is a solution to make all the pte present
> and mapped in the page table?
> E.g. i fork a new process and load a new elf binary, how to make every
> page mapped in the page table of this new process.

mlockall().

-- 
Glynn Clements <glynn@gclements.plus.com>
