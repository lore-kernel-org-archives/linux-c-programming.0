From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: Problem with "chars"
Date: Wed, 17 Jul 2002 17:19:02 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020717171902.I1163@neutrino.particles.org>
References: <20020717040816.A54117@nietzsche.metrotel.net.co> <20020717133041.GA13442@zerotao.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020717133041.GA13442@zerotao.org>; from jshiffer@zerotao.org on Wed, Jul 17, 2002 at 09:30:41AM -0400
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jason L. Shiffer" <jshiffer@zerotao.org>
Cc: linux-c-programming@vger.kernel.org, xlp <xlp@emtel.net.co>

On Wed, Jul 17, 2002 at 09:30:41AM -0400, Jason L. Shiffer wrote:
> On Wed, Jul 17, 2002 at 04:08:16AM -0500, xlp wrote:
> > I dont understand what's the way I should handle 'chars' on C. 
> > I need to code a C function that returns a char, I want to do this:
> > char foo();
> > main(){
> > 	char bar*;
> > 	bar=foo();
> > }
> 
> Firstly if you are just going to return a char ie. some value between
> -128 & 127, then the above definition is incorrect:
> char bar*;   defines a char pointer most commenly known as a string;

This defines nothing. It produces a syntax error.

Both, you mean "char *bar;". 

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
