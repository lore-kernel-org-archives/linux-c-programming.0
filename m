From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: File handling
Date: Mon, 29 Apr 2002 23:57:34 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15565.53214.231318.243934@cerise.nosuchdomain.co.uk>
References: <20020429154610.B24899@cs.pdx.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020429154610.B24899@cs.pdx.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marius Nita <marius@cs.pdx.edu>
Cc: linux-c-programming@vger.kernel.org


Marius Nita wrote:

> I have a large text file (45Mb) which needs to be searched through in a decent
> amount of time (4-5 seconds.) So far I have some Perl and shell scripts that
> search it, but either they are way too slow, or if I try to tweak them to make
> them faster, I usually run into low memory problems.
> 
> So I was thinking that if I write the program in C I would get better results.
> Do you have any suggestions about a way to approach this, pointers about
> libraries, etc?
> 
> PS: The search is very simple. It just tries to match the exact keywords, case
> insensitive, so that's not an issue. It's file reading performance that I'm
> worried about.

The issue isn't really the search, it's what you want to do once
you've found a match. Performing a regexp search should only impose a
minor overhead.

If you just need to extract text near the match point, sed should be
adequate, and is likely to be faster than perl.

If you need to perform more involved operations on the data around the
match, then it might be worth using C. In which case, the fastest way
to read the file is to use mmap() to map it into memory.

The standard interface for performing regexp searches in C is the
functions listed in the regcomp(3) manpage.

-- 
Glynn Clements <glynn.clements@virgin.net>
