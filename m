From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: A Simple question
Date: Fri, 27 Jun 2003 10:32:17 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16124.3873.506175.376552@cerise.nosuchdomain.co.uk>
References: <1056704191.3efc06bf38045@webmail.namezero.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1056704191.3efc06bf38045@webmail.namezero.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jad Saklawi <Jad@Saklawi.info>
Cc: linux-c-programming@vger.kernel.org


Jad Saklawi wrote:

>   I am new to UNIX programing, i know how to write make files 
> any how i would like to write dynamic make files depending on the libraries 
> the user has, iv seen in many programs using the "./configure" and would like 
> to ask if any one has a tutorial on how to write Makefile.in files for my 
> programs so that they could be dynamically configured by ./configure 

I don't know about a tutorial, but autoconf (the tool which generates
configure scripts) has documentation in Info format ("info autoconf",
or "C-h C-i autoconf" in XEmacs).

-- 
Glynn Clements <glynn.clements@virgin.net>
