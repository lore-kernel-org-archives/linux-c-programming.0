From: RAM_LOCK <Kaushik.Sarkar@netapp.com>
Subject: how compiler decide the range of real numbers in C...
Date: Thu, 30 Jul 2009 10:33:25 -0700 (PDT)
Message-ID: <24743191.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Say 16 bit compiler (for ex Turbo C) uses 2's compliment to find the range of
signed integer.
Say for 16 bit n=16. Now applying 2's compliment equation : -2^(n-1)  to
2^(n-1) -1
so for n=16 : The range is -32768 to 32767

This is ok. The question arises when it tell about real constant's range.
For 16 bit compiler the range of real constant is : -3.4e38 to 3.4e38

How they arrived to this real constant range?

Can any one share the mathematical calculation behind it?

thnx,
RAM_LOCK


-- 
View this message in context: http://www.nabble.com/how-compiler-decide-the-range-of-real-numbers-in-C...-tp24743191p24743191.html
Sent from the linux-c-programming mailing list archive at Nabble.com.

