From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Question about checksums
Date: Thu, 21 Aug 2003 12:48:05 +0000 (GMT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0308211247260.14102-100000@praktifix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

Lets me first start to explain what I try to do. I have a big ascii
configuration file (appr. 500KB), which I split up in many smaller
jobs each approx. 180 Bytes (average, minimum is 50 maximum 5120 Bytes).
For each job I would like to generate a unique number, so that I can
refer to these jobs by their individual numbers.

What is the best way to generate a checksum from each job? Also I would
like that the checksums are always the same, when you calculate it
on a different host with different CPU and OS but using the same
job data.

I think md5sum could do the job but, think it is a bit of an overkill
to generate a 128 Bit checksum for such small input data. Also storing
such huge numbers is a bit of a pain. Would a 32 or 64 Bit checksum
sufficient, or would I be running into problems when these are to
short?

Regards,
Holger

