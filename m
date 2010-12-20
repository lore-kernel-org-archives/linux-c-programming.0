From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: union to get parts of integer
Date: Mon, 20 Dec 2010 16:40:14 +0100
Message-ID: <8762uotpup.fsf@erwin.mina86.com>
References: <AANLkTikAB_-kO_cmD5VQRtztx=4V9NDcmU4uWBDE=ON8@mail.gmail.com>
	<87aak0tsf3.fsf@erwin.mina86.com> <20101220153008.GH16355@comcast.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :references:x-face:face:x-url:x-pgp-fp:x-pgp:date:in-reply-to
         :message-id:user-agent:mime-version:content-type;
        bh=anrVlZKMbf1tD+qK5DjjSaM69M3SyNtI9VZPKHcup9k=;
        b=Flq3aalZ51jXw2bbDzzvyX5N3bvXruqfXkM6AgikoeFgmtzq3tZR3QknGQmJG4LndU
         C+f7bC80N9GFWMLgPezVBLLHfmclYcQyd5X/PSpylt2DIP1SYRmB9TCnMBeN4epf02Xc
         vhYykEUNLAD3bhrDV55TosOgBGYKmQFT93sxk=
In-Reply-To: <20101220153008.GH16355@comcast.net> (Tim Walberg's message of
	"Mon, 20 Dec 2010 09:30:08 -0600")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Walberg <twalberg@comcast.net>
Cc: ratheesh k <ratheesh.ksz@gmail.com>, linux-c-programming@vger.kernel.org

Tim Walberg <twalberg@comcast.net> writes:
> It's likely that either the union or direct pointer expressions yield
> more efficient code, as they can probably be compiled to direct byte-width
> load/store instructions, rather than shifts and logical ands... However,
> if the code's not in a critical path for performance, it probably won't
> matter. And on some architectures, there may not be byte-width operations,
> I guess...

It's not the issue of performance.  It's an issue of whether you want
each separate byte as saved in memory (which should rarely be the case)
or if you want specific part of the value.

> On 12/20/2010 15:44 +0100, Michal Nazarewicz wrote:
>>>	
>>>	((char *)&i)[0].
>>>	
>>>	However, are you sure that you need this?  Don't you need "(i & 255)",
>>>	"((i >> 8) & 255)", etc. instead?
>>>	
>>>	-- 
>>>	Best regards,                                         _     _
>>>	 .o. | Liege of Serenly Enlightened Majesty of      o' \,=./ `o
>>>	 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
>>>	 ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--

-- 
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--
