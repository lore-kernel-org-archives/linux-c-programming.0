From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: problem in open sys call
Date: Wed, 21 Apr 2004 10:08:20 +0000 (GMT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0404211000250.1595@praktifix.dwd.de>
References: <33120BB62E0A7643AE75E2B03CA0EDA08E3A18@mail7.monmouth.army.mil>
 <40863A69.9090409@sancharnet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40863A69.9090409@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gracecott@sancharnet.in
Cc: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>, linux-c-programming@vger.kernel.org

On Wed, 21 Apr 2004, joy wrote:

> Huber, George K RDECOM CERDEC STCD SRI wrote:
> 
> >Hi,
> >
> >Try this:
> >
> >      if((fd=open(opcode, O_RDONLY))==-1)
> >      {
> >        printf("Open failed, error code: %d\n%s\n", errno, strerror(errno)
> >      }
> >      >you may need to add errno.h and string.h to the list of includes. This
> will
> >give you the error code and desctiption of why open is failing.
> >
> >
> thanks a lot, george but I think Glynn hit the nail on the head. the
> code was working fine before I added the opcode variable in main
> and totlly neglected to see it while gdb'ing.
> 
But George and others also made a good point. With programming it is always
good practice to write good error messages and always try to be more
verbose. Believe me this can save you a lot of time! I even go so far
to always print out __FILE__ and __LINE__, so I know exacly where the
error has happened.

Holger
