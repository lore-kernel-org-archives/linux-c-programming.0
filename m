From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: UDP data
Date: Thu, 10 Feb 2011 15:41:20 +0000
Message-ID: <19796.1824.862218.276072@cerise.gclements.plus.com>
References: <AANLkTimck7ar6JPzSnNZo_baTz1usHLeUFxkL8GaqriV@mail.gmail.com>
	<AANLkTi=VisvB732h_jzXcDj5_t7b96QAvJuXYiuOvEj8@mail.gmail.com>
	<op.vqb09uit3l0zgt@mnazarewicz.zrh.corp.google.com>
	<1297309262.2205.14.camel@godart>
	<AANLkTik991ekzViW3e_amoNiO=4LB30snwbvDrwu61Nz@mail.gmail.com>
	<1297314869.2205.48.camel@godart>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1297314869.2205.48.camel@godart>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randi <nightdecoder@gmail.com>
Cc: Chris Donovan <alienresidents@gmail.com>, linux-c-programming@vger.kernel.org


Randi wrote:

> > Yes the checksum is for the header and data.
> > Keep in mind that the checksum value is optional in ipv4, but required in ipv6.
> 
> Chris, optional means it can be enable or not, how to enable it and get
> the header to verify the checksum.

Checksums are enabled by default. You can disable checksums when
sending using the SO_NO_CHECK option. On receipt, the kernel will
verify the checksum if it's present, and discard the packet if there
is an error.

-- 
Glynn Clements <glynn@gclements.plus.com>
