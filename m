From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Integer arithmetic vs double precision arithmetic
Date: Sun, 26 Mar 2006 20:44:36 +0530
Message-ID: <200603262044.37068.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

I am trying to work out whether to use an integer or a double for my internal 
storage variable of a class meant to store a time.

Qt uses an unsigned integer with millisecond being the best precision, but I 
am wondering, why I should lose the extra digits of precision that I could 
get if I used a double.

Is there a marked increase in computing speed if integer arithmetic is used 
compared to double precision?
 
-- 

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-03-26 W12-7 UTC+0530
