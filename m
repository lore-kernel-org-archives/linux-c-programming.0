From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: copy program
Date: Fri, 9 Sep 2005 13:39:36 +0100
Message-ID: <17185.33416.382095.755145@cerise.gclements.plus.com>
References: <1125987925.3348.66.camel@kaushal>
	<17184.26166.478692.480203@cerise.gclements.plus.com>
	<1126242561.4506.64.camel@kaushal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1126242561.4506.64.camel@kaushal>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaushal@rocsys.com
Cc: linux-c-programming@vger.kernel.org


kaushal wrote:

>          Is it going to matter if it is vcd or data cd?If yes then I
> want to copy both the kinds.

Yes.

Like audio CDs, VCDs use mode-2 sessions, which have less error
correction than data CDs (but can store more data, e.g. a standard
80-minute CD-R can hold 700MB as a data CD but 800MB as a VCD or audio
CD).

To copy mode-2 CDs, you will want software which doesn't abort on an
I/O error (and, ideally, prevents or limits retries within the CD
drive itself).

Try some of the links found from:

	http://www.google.com/search?q=VCD%20%22mode%202%22

for more information.

-- 
Glynn Clements <glynn@gclements.plus.com>
