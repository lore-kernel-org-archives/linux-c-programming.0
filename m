From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 17 Jul 2002 20:55:59 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020717205559.J1163@neutrino.particles.org>
References: <20020717093316.A56041@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020717093316.A56041@nietzsche.metrotel.net.co>; from xlp@emtel.net.co on Wed, Jul 17, 2002 at 09:33:16AM -0500
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xlp <xlp@emtel.net.co>
Cc: linux-c-programming@vger.kernel.org, jason@txt.com

On Wed, Jul 17, 2002 at 09:33:16AM -0500, xlp wrote:
> char *foo()
> {
> 	char *retbar;
> 	retbar = (char *)malloc(20);

Although it's tend to be an aesthitic issue, it is a *good* habit to not
cast malloc().  

Elias

--
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
