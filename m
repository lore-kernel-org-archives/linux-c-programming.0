From: Steve Graegert <graegerts@gmail.com>
Subject: Re: copy program
Date: Thu, 8 Sep 2005 07:30:07 +0200
Message-ID: <6a00c8d5050907223067060086@mail.gmail.com>
References: <1125987925.3348.66.camel@kaushal> <dfod1u$ubv$1@sea.gmane.org>
Reply-To: graegerts@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfod1u$ubv$1@sea.gmane.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 9/8/05, _z33 <timid.Gentoo@gmail.com> wrote:
> kaushal wrote:
> Earlier I have
> > posted a question about a problem in copying CDs in linux.Whenever I try
> > to copy a CD from linux it fails giving the seek error message.But
> > without mounting the cd if I play it using mplayer command, it plays.
> >               (mplayer vcd:// )
> >  while I copy the same CD in windows on the same machine it
> > succeeds .
> 
> I still face the same problem in Linux while copying something from a
> CD. It succeeds in windoze , but fails in Linux :(

I have made similar observations mostly with free operating systems. 
My assumption is that some device drivers for Windows offer far better
error correction and other software services than those found on Linux
(or any other open source OS).  This is not necessarily a bad thing,
since the device drivers do what they are supposed to do; and they do
it well.  I know that some drives have buggy firmware which is fixed,
or worked around at least, by device drivers.  Most often, these bugs
are not documented, impeding driver writers for noncommercial OS to
provide the same level of reliability found on other systems.  A
situation unlikely to be changed in the near future.  Interestingly, I
was able to make improvements by updating the firmware of one of the
Toshiba DVD drives resulting in much less errors under NetBSD and
OpenSolaris (no, this drive has never seen Linux, but I bet the result
is the same).


Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
