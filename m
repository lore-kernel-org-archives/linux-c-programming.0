From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: exploitable function
Date: Wed, 26 Jun 2002 23:58:04 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020626235804.A24256@neutrino.particles.org>
References: <20020625160221.A489@nietzsche> <20020626004345.B2816@neutrino.particles.org> <20020625163329.C27404@nietzsche> <20020626164110.B1131@neutrino.particles.org> <15642.5451.365778.941333@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15642.5451.365778.941333@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Wed, Jun 26, 2002 at 08:26:03PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

On Wed, Jun 26, 2002 at 08:26:03PM +0100, Glynn Clements wrote:
  
> But note that strncpy() isn't much better, for two reasons:
 
Yes. Better use strdup(). In binutils we use xstrdup() in most of
the cases and str[n]cpy() carefully.

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
