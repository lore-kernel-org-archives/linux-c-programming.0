From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: Question about checksums
Date: Thu, 21 Aug 2003 14:20:05 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030821132005.GA8614@lsd.di.uminho.pt>
References: <Pine.LNX.4.44.0308211247260.14102-100000@praktifix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0308211247260.14102-100000@praktifix.dwd.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org

On Thu, Aug 21, 2003 at 12:48:05PM +0000, Holger Kiehl wrote:
> Hello
> 
> Lets me first start to explain what I try to do. I have a big ascii
> configuration file (appr. 500KB), which I split up in many smaller
> jobs each approx. 180 Bytes (average, minimum is 50 maximum 5120 Bytes).
> For each job I would like to generate a unique number, so that I can
> refer to these jobs by their individual numbers.
> 
> What is the best way to generate a checksum from each job? Also I would
> like that the checksums are always the same, when you calculate it
> on a different host with different CPU and OS but using the same
> job data.

Why not just use the number of the job? Or the offset from the file of
the job?

> I think md5sum could do the job but, think it is a bit of an overkill
> to generate a 128 Bit checksum for such small input data. Also storing
> such huge numbers is a bit of a pain. Would a 32 or 64 Bit checksum
> sufficient, or would I be running into problems when these are to
> short?

CRC-32 is normally sufficient. It's designed for data corruption on
transmission, though, but it should be OK as long as you don't expect
people to try and break your code with equal checksums.

Regards,
Luciano Rocha
