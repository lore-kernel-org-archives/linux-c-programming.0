From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Tue, 2 Aug 2005 17:39:16 +0100
Message-ID: <17135.41396.309256.176762@cerise.gclements.plus.com>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	<6eee1c40508010514517b5b90@mail.gmail.com>
	<6eee1c405080105164cfbbaaa@mail.gmail.com>
	<17134.43470.280296.644313@cerise.gclements.plus.com>
	<6eee1c40508020421ceab653@mail.gmail.com>
	<039a01c59757$1a1d8ba0$9900a8c0@ispl091>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <039a01c59757$1a1d8ba0$9900a8c0@ispl091>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amit Dang <amit_dang@intersolutions.stpn.soft.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Amit Dang wrote:

>     Thanks for the reply. So any idea about how structure should be defined
> in case it is to be used by a text file editor which works on both linux &
> solaris.

However you like.

You shouldn't be trying to read blocks of data from a file directly
into a C "struct" in memory. That technique is fine for "internal"
files which only need to be read by one version of the software on one
particular platform, but it's the wrong approach for "interchange"
files which can be transferred between different systems or different
versions of the software.

For interchange formats, rather than making assumptions about the
size, offset and byte order of structure fields, you should either
write your own decoding and encoding routines or use a standard data
encoding (e.g. XDR, ASN.1 etc).

-- 
Glynn Clements <glynn@gclements.plus.com>
