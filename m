From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: is it a buf or what?
Date: Sat, 8 Jun 2002 19:40:46 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020608194046.E12928@neutrino.particles.org>
References: <Pine.LNX.4.33.0206081601090.19134-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0206081601090.19134-100000@soochak.ncst.ernet.in>; from khalid@ncst.ernet.in on Sat, Jun 08, 2002 at 04:03:35PM +0530
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>

On Sat, Jun 08, 2002 at 04:03:35PM +0530, Mohammed Khalid Ansari wrote:

> As you can see, I haven't allocated the space for the pointer ptr. When I 
> ran the program, instead of giving me the segmentation fault, it just ran 
> printing "khalid". Is it a bug of gcc or the kernel.

You are just lucky. If you run your program with efence or another mem
debugging tool, you'll get a segfault for sure.

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
