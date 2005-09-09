From: kaushal <kaushal@rocsys.com>
Subject: Re: copy program
Date: Fri, 09 Sep 2005 18:27:57 +0530
Message-ID: <1126270677.4506.96.camel@kaushal>
References: <1125987925.3348.66.camel@kaushal>
	 <17184.26166.478692.480203@cerise.gclements.plus.com>
	 <1126242561.4506.64.camel@kaushal>
	 <17185.33416.382095.755145@cerise.gclements.plus.com>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17185.33416.382095.755145@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

Hi Clements,
            Thanks a lot for sharing the intricacies.
cheers-
kaushal.
On Fri, 2005-09-09 at 13:39 +0100, Glynn Clements wrote:
> kaushal wrote:
> 
> >          Is it going to matter if it is vcd or data cd?If yes then I
> > want to copy both the kinds.
> 
> Yes.
> 
> Like audio CDs, VCDs use mode-2 sessions, which have less error
> correction than data CDs (but can store more data, e.g. a standard
> 80-minute CD-R can hold 700MB as a data CD but 800MB as a VCD or audio
> CD).
> 
> To copy mode-2 CDs, you will want software which doesn't abort on an
> I/O error (and, ideally, prevents or limits retries within the CD
> drive itself).
> 
> Try some of the links found from:
> 
> 	http://www.google.com/search?q=VCD%20%22mode%202%22
> 
> for more information.
> 

