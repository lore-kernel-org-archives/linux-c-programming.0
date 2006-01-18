From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Help: need to prevent infinite loop
Date: Wed, 18 Jan 2006 21:54:36 +0530
Message-ID: <200601182154.36474.samjnaa@gmail.com>
References: <200601171006.36978.samjnaa@gmail.com> <43CC996D.4050100@ajp-services.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43CC996D.4050100@ajp-services.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Tuesday, 17 January 2006 12:44 samaye, Jesse Ruffin alekhiit:

> This inelegant, but satisfactory, method fixes the problem:
> 		fgets(buf,12,stdin);

Thanks for your reply and sorry for the delay in mine.

The suggestion to use fgets reminded me of this gcc-generated warning with 
gets:

samjnaa@linux:~/bin/learning> gcc -Wall -o gets gets.c
/tmp/ccA8bxgm.o: In function `main':
gets.c:(.text+0x25): warning: the `gets' function is dangerous and should not 
be used.

Though I did not get such a warning with fgets, I wonder why this function is 
considered dangerous. Could the same problem perhaps apply to fgets too and 
gcc doesn't inform me of it?

-- 

Penguin #395953 resides at http://samvit.org
subsisting on SUSE Linux 10.0 with KDE 3.5
