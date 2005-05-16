From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: data structure question
Date: Mon, 16 May 2005 16:28:06 +0100
Message-ID: <17032.48134.349409.976254@gargle.gargle.HOWL>
References: <42871714.5060007@bonbon.net>
	<17031.11321.223828.203914@gargle.gargle.HOWL>
	<4287315D.3080802@bonbon.net>
	<17031.23394.834533.766062@gargle.gargle.HOWL>
	<42881ADE.2010009@bonbon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42881ADE.2010009@bonbon.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gumbold@bonbon.net
Cc: linux-c-programming@vger.kernel.org


gumbold wrote:

> So char abc[0] actualy pointer to chat?

No, it's an array of char.

> It should be 4 byte long on x86. I can't see it with sizeof.

It's zero bytes long.

If you had:

	struct abc {
	    __u16 a;
	    __u16 b;
	    char abc[4];
	};

then sizeof(struct abc) would be 8 and the offset of abc from the
beginning of the structure would be 4.

With:

	struct abc {
	    __u16 a;
	    __u16 b;
	    char abc[0];
	};

sizeof(struct abc) would be 4 and the offset of abc from the beginning
of the structure would still be 4 (i.e. p->abc refers to the first
byte after the structure).

-- 
Glynn Clements <glynn@gclements.plus.com>
