From: Vadiraj <vadiraj.cs@gmail.com>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Tue, 2 Aug 2005 16:51:21 +0530
Message-ID: <6eee1c40508020421ceab653@mail.gmail.com>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	 <6eee1c40508010514517b5b90@mail.gmail.com>
	 <6eee1c405080105164cfbbaaa@mail.gmail.com>
	 <17134.43470.280296.644313@cerise.gclements.plus.com>
Reply-To: Vadiraj <vadiraj.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17134.43470.280296.644313@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On 8/2/05, Glynn Clements <glynn@gclements.plus.com> wrote:
> 
> Vadiraj wrote:
> 
> > >    Can any body provide some light on Byte Alignment & Structure Padding
> > > for gcc linux x86 32-bit?
> >
> >  The system expects the address of a variable to be multiple of
> > its size. Meaning for 32 bit x86 int being 4 bytes. The address
> > location of a int variable is expected to be at multiple of 4.
> > ex 0 4 8 12 16. if  its double then its expected it to be multiple of 8.
> > 0 8 16 ...
> 
> Incorrect; 8-byte quantities (double and long long) are only 4-byte
> aligned, not 8-byte aligned.

 Depends on compiler and architecture. With GCC 3.3.3 on cygwin I get
24 bytes for the same structe and also in Solaris system too.
meaning 8 byte alligned. 

True that Gcc 2.9 on linux is 4 byte alligned.


-- 
cheers,
Vadi
