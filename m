From: Kurt Wall <kwall@kurtwerks.com>
Subject: Re: mcrypt ?
Date: Wed, 22 May 2002 09:08:51 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020522090851.A3571@marta>
References: <012101c200c6$94f7fd40$0cfea8c0@ezdsp.com> <15594.22897.778388.25242@cerise.nosuchdomain.co.uk> <003901c2018d$388b6070$0cfea8c0@ezdsp.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <003901c2018d$388b6070$0cfea8c0@ezdsp.com>; from mistral@stev.org on Wed, May 22, 2002 at 01:35:56PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: James Stevenson <mistral@stev.org>

Scribbling feverishly on May 22, James Stevenson managed to emit:
> 
> > > is there such a function in a linux c libary
> > > for the md5 crypt the same as crypt() but
> > > for the more modern shadow passwords
> > >
> > > if so.
> > > which libary ?
> >
> > The "crypt" add-on for glibc 2.x supports MD5 password hashes, as well
> > as DES. The details are in the "libc" Info file (search for "crypt").
> 
> unfortunatly i think my info file is out of date. though i do have glibc 2.x
> i dont suppose you have an exmaple of how it is used to generate md5
> password
> hashes instead of des or any idea of how to get it to work like that.

When using crypt, one of the functions of the SALT parameter 
is to select the encryption algorithm. If SALT consists of "$1$" followed
by up to 8 characters and optionally ending with "$", the MD5-based
algorithm is used. If SALT consists of two initial alpha-numeric
characters, followed by 11 more, crypt selects the DES-based algorithm.

Kurt
-- 
"I used to think I was indecisive, but now I'm not so sure."
