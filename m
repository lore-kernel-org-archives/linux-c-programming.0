From: "William N. Zanatta" <william@veritel.com.br>
Subject: Re: writing logfile
Date: Tue, 25 Feb 2003 10:09:37 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3E5B6B11.3020001@veritel.com.br>
References: <20030225105740.A31033@genestate.com> <20030225133810.C28473@neutrino.particles.org> <20030225124937.B31033@genestate.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030225124937.B31033@genestate.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mat Harris <mat.harris@genestate.com>
Cc: Elias Athanasopoulos <elathan@phys.uoa.gr>, linux-c-programming@vger.kernel.org


   Wow it is a mess! Time to get the old book, sit down and read some 
more...

   You are opening a file through open() which returns an integer 
representation of the file descriptor and trying to write on it through 
fputs() which writes to a file descriptor represented by a FILE pointer.

   That's your answer. You are using the wrong functions.

   You may either change your code to work with integers, open(), read() 
  write() and close() or make it use FILE *, fopen(), fread() (...), 
fputs() (...) and fclose(). It is up to you and will depends on the kind 
of application you're writing.

   Each of the ways of file manipulation has advantages and/or 
disadvantages. You should seek for something about that over the net.

   ">   loghandle = open(logfile, O_CREAT);"

   Maybe I'm wrong, but I think this previous call just creates a file 
and doesn't make it available for reading/writing in any way. Is that 
right brothers???

   william

-- 
Perl combines all of the worst aspects of BASIC, C and line noise.
                 -- Keith Packard

