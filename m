From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: writing logfile
Date: Tue, 25 Feb 2003 13:38:10 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030225133810.C28473@neutrino.particles.org>
References: <20030225105740.A31033@genestate.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030225105740.A31033@genestate.com>; from mat.harris@genestate.com on Tue, Feb 25, 2003 at 10:57:40AM +0000
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mat Harris <mat.harris@genestate.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, Feb 25, 2003 at 10:57:40AM +0000, Mat Harris wrote:
> in log.h and are used for opening, writing to, and closing a logfile. I have
> attached log.h.

You don't.

> My questions are: How do I tell fopen to create if not there or append if
> it is? I seem to get an error either way. 

This is explained in details in fopen(3).

> And: Why does the fputs cause a segfault? Is there a better way of doing it?
> I know I do not understand types and casting very well so I may have it
> totally wrong.

fputs() is not designed to segfault; you most probably use it wrong. You
have to show parts of your code to get at least a hint.

Elias

-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
