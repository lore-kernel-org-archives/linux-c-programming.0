From: Shriramana Sharma <samjnaa@gmail.com>
Subject: A safe scanf function
Date: Sun, 26 Feb 2006 13:47:20 +0530
Message-ID: <200602261347.20494.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

If I am not wrong, a safe alternate for scanf could be (relatively) easily 
written which simply uses getline and sscanf -- thereby replacing the 
original scanf function.

Why has not anyone written such a function and included it into the GNU C 
library? Myself, I may write such a function for a specific case in my 
program, but to modify the original library function I lack the know-how.

I request one of the guru-s here to do this most helpful task.

Thank you.

-- 

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-02-26 W08-7 UTC+0530
