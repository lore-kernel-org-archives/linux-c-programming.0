From: Michael Taylor <michael.taylor@ec.gc.ca>
Subject: Re: getline()
Date: Mon, 25 Aug 2003 09:43:43 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F4A047F.5030402@ec.gc.ca>
References: <20030824203653.A574@Imrashi.net.bd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Progga <abulfazl@juniv.edu>
Cc: linux-c-programming@vger.kernel.org

Progga wrote:
>  Is there any 'C' lib which contains the getline() function ? I have found
> a code similar to this:

Getline is part of the GNU readline package, and is included in GNU libc, the
standard libc used on GNU/Linux systems (as a GNU extension -- #define
_GNU_SOURCE). Readline is include I believe in FreeBSD's libc, and available as
a package for NetBSD. See: <http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html>

readline 4.3: <ftp://ftp.cwru.edu/pub/bash/readline-4.3.tar.gz>

-- 
Michael Taylor

