From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Question about checksums
Date: Thu, 21 Aug 2003 16:36:45 +0000 (GMT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0308211617560.6771-100000@praktifix.dwd.de>
References: <20030821132005.GA8614@lsd.di.uminho.pt>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030821132005.GA8614@lsd.di.uminho.pt>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Cc: linux-c-programming@vger.kernel.org

On Thu, 21 Aug 2003, Luciano Miguel Ferreira Rocha wrote:

> On Thu, Aug 21, 2003 at 12:48:05PM +0000, Holger Kiehl wrote:
> > Hello
> > 
> > Lets me first start to explain what I try to do. I have a big ascii
> > configuration file (appr. 500KB), which I split up in many smaller
> > jobs each approx. 180 Bytes (average, minimum is 50 maximum 5120 Bytes).
> > For each job I would like to generate a unique number, so that I can
> > refer to these jobs by their individual numbers.
> > 
> > What is the best way to generate a checksum from each job? Also I would
> > like that the checksums are always the same, when you calculate it
> > on a different host with different CPU and OS but using the same
> > job data.
> 
> Why not just use the number of the job?
>
This is what I currently do. It however has the disadvantage that with
each change to the configuration file the number is increased and the
job numbers do not have a direct relationship with the job itself. There
is no way for me to trace back a job number with the job itself.

> Or the offset from the file of the job?
> 
The problem here is that the user can move a job from the beginning of
the configuration to the end, ie. the jobs themself can 'flow' arround
in the configuration file.

> > I think md5sum could do the job but, think it is a bit of an overkill
> > to generate a 128 Bit checksum for such small input data. Also storing
> > such huge numbers is a bit of a pain. Would a 32 or 64 Bit checksum
> > sufficient, or would I be running into problems when these are to
> > short?
> 
> CRC-32 is normally sufficient. It's designed for data corruption on
> transmission, though, but it should be OK as long as you don't expect
> people to try and break your code with equal checksums.
> 
I am not trying to make anything more secure. Will a CRC-32 be sufficient
to always generate a different sum if a single bit changes within the
maximum 5120 Bytes?

Thanks,
Holger

