From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: *w[1]++ = *[k[1]++; does not work .. ?
Date: Sun, 23 Feb 2003 21:30:34 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030223213034.B21636@neutrino.particles.org>
References: <Pine.LNX.4.21.0302231825450.10716-100000@hestia>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0302231825450.10716-100000@hestia>; from mailing-lists@xs4all.nl on Sun, Feb 23, 2003 at 06:37:08PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org

On Sun, Feb 23, 2003 at 06:37:08PM +0100, J. wrote:
> I can print char by char like this: printf("%c", *w[1]++);
> but I can not copy char by char like this: *w[1]++ = *k[1]++;

It works.

>  while(*w[1] != '\0')
>   *k[1]++ = *w[1]++; 

You move the pointer while doing the copy, so after the loop it points to
the terminated null character.

You should keep the original address of k[1] before the loop and use it 
instead. I.e.:

	char *s;
	...
	s = k[1];

	while (...) { ... }
	
	printf ("%s\n", s);

You can do the copy more efficiantly using other ways. Check how strcpy()
works (it exists in K&R, glibc or even inside the kernel).

Elias

-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
