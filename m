From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Fri, 5 Aug 2005 13:31:58 +0200
Message-ID: <6a00c8d50508050431240c18d2@mail.gmail.com>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	 <673ac06405080402432d0feda3@mail.gmail.com>
	 <6eee1c40508040823165f1df7@mail.gmail.com>
	 <00c001c59974$32b0c9b0$9900a8c0@ispl091>
	 <6a00c8d50508042332245283db@mail.gmail.com>
	 <013901c59989$ed3d6440$9900a8c0@ispl091>
	 <6a00c8d505080500092364df97@mail.gmail.com>
	 <17139.19285.978591.275528@cerise.gclements.plus.com>
	 <6a00c8d50508050315501d900c@mail.gmail.com>
	 <17139.25287.122744.44612@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17139.25287.122744.44612@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Amit Dang <amit_dang@intersolutions.stpn.soft.net>, linux-c-programming <linux-c-programming@vger.kernel.org>

On 8/5/05, Glynn Clements <glynn@gclements.plus.com> wrote:
> 
> Steve Graegert wrote:
> 
> > > long long is likely to be 8-byte aligned on 64-bit systems and 4-byte
> > > aligned on 32-bit systems.
> >
> > Agree.  Interestingly, Microsofts VCC (was quite curious, so I did a
> > quick test) aligns long long on an 8-byte boundary resulting in a size
> > of 16 for the structure given above. (Yes it's a 32-bit machine.)
> > Don't know the reason for that, since the ABI for i386 does not
> > mention this case explicitly.
> 
> > > Aligment is determined by the granularity of RAM access. E.g. 32-bit
> > > systems tend to have RAM organised as 32-bit words; reading a 32-bit
> > > value which issn't aligned requires reading two adjacent words,
> > > shifting and OR-ing them together to obtain the desired value.
> >
> > Yes, sure, but why would Microsoft's C compiler generate code that
> > results in a fully despensable read operation for the padded word?  (I
> > know this is a Linux programming list, but the question seems related
> > to the overall topic of data alignment in memory.)
> 
> Maybe for binary compatibility with 64-bit systems? There used to be a
> version of NT for Alpha. Also, compared to gcc, MSVC was quite late at
> adopting C99 features, so x86/64 may have been taken into account when
> "long long" was added.

Good point.  Didn't think of that.

> Microsoft tends to pay as much attention to the ABI as the API,
> whereas Unix systems tend to be far less concerned about the ABI. I
> suspect that this is partly because Windows is far less cross-platform
> than Unix, so maintaining a common ABI is a lot less work, and partly
> because of the preference for binary formats on Windows compared to
> textual formats on Unix.

Can't comment on Microsoft's efforts concerning ABI considerations
but, as you indicated, the different peculiarities of ABIs among Unix
systems is definitely a weakness.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
