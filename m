From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: exploitable function
Date: Wed, 26 Jun 2002 16:41:10 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020626164110.B1131@neutrino.particles.org>
References: <20020625160221.A489@nietzsche> <20020626004345.B2816@neutrino.particles.org> <20020625163329.C27404@nietzsche>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020625163329.C27404@nietzsche>; from xlp@emtel.net.co on Tue, Jun 25, 2002 at 04:33:29PM -0500
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xlp <xlp@emtel.net.co>
Cc: linux-c-programming@vger.kernel.org

On Tue, Jun 25, 2002 at 04:33:29PM -0500, xlp wrote:

> anyway, it should no use strcmp, it should use strncmp ?

strcmp() compares, it doesn't copy stuff. It's quite safe.
> 
> by the way, where can i find a exploitable function and try to code epxloit proof for education and practice?

strcpy() is the number-one danger.

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
