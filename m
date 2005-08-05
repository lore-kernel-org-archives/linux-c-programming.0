From: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Fri, 5 Aug 2005 16:23:35 +0530
Message-ID: <030b01c599ab$fb845be0$9900a8c0@ispl091>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091> <6eee1c40508010514517b5b90@mail.gmail.com> <6eee1c405080105164cfbbaaa@mail.gmail.com> <673ac06405080402432d0feda3@mail.gmail.com> <6eee1c40508040823165f1df7@mail.gmail.com> <00c001c59974$32b0c9b0$9900a8c0@ispl091> <6a00c8d50508042332245283db@mail.gmail.com> <013901c59989$ed3d6440$9900a8c0@ispl091> <6a00c8d505080500092364df97@mail.gmail.com> <17139.19285.978591.275528@cerise.gclements.plus.com> <6a00c8d50508050315501d900c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

This should not happen until compiler option /Zp is explicitly set to 8.
Quoted from msdn
" ANSI 3.5.2.1   The padding and alignment of members of structures and
whether a bit field can straddle a storage-unit boundary
Structure members are stored sequentially in the order in which they are
declared: the first member has the lowest memory address and the last member
the highest.
Every data object has an alignment-requirement. The alignment-requirement
for all data except structures, unions, and arrays is either the size of the
object or the current packing size (specified with either /Zp or the pack
pragma, whichever is less). For structures, unions, and arrays, the
alignment-requirement is the largest alignment-requirement of its members.
Every object is allocated an offset so that
offset % alignment-requirement == 0
Adjacent bit fields are packed into the same 1-, 2-, or 4-byte allocation
unit if the integral types are the same size and if the next bit field fits
into the current allocation unit without crossing the boundary imposed by
the common alignment requirements of the bit fields. "
Source Url:
http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vccelng/htm/impdf_34.asp

Regards,
Amit Dang
----- Original Message ----- 
From: "Steve Graegert" <graegerts@gmail.com>
To: "Glynn Clements" <glynn@gclements.plus.com>
Cc: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>;
"linux-c-programming" <linux-c-programming@vger.kernel.org>
Sent: Friday, August 05, 2005 3:45 PM
Subject: Re: Any pointer to Byte Alignment & Structure Padding?


> On 8/5/05, Glynn Clements <glynn@gclements.plus.com> wrote:
> >
> > Steve Graegert wrote:
> >
> > > >    Thanks for your prompt response and the valuable information. But
I
> > > > tried following on Linux 32-bit gcc 2.96
> > > > struct temp {
> > > >    long long i;
> > > >    char c;
> > > > } and sizeof(struct temp) gave 12 not 16.
> > >
> > > Hmm, I have no access to a 32-bit machine right now, but I am running
> > > GCC 3.4.2 on SPARC and sizeof(temp) gives 16 as expected.
> >
> > long long is likely to be 8-byte aligned on 64-bit systems and 4-byte
> > aligned on 32-bit systems.
>
> Agree.  Interestingly, Microsofts VCC (was quite curious, so I did a
> quick test) aligns long long on an 8-byte boundary resulting in a size
> of 16 for the structure given above. (Yes it's a 32-bit machine.)
> Don't know the reason for that, since the ABI for i386 does not
> mention this case explicitly.
>
> > > One thing a could think of is that on 32-bit machines it makes no
> > > sense to pad to 16 bytes since the natural word size (size of internal
> > > registers) is 4 bytes resulting in an unnecessary read operation to
> > > fetch the rest of the structure that is useless anyway.
> >
> > Aligment is determined by the granularity of RAM access. E.g. 32-bit
> > systems tend to have RAM organised as 32-bit words; reading a 32-bit
> > value which issn't aligned requires reading two adjacent words,
> > shifting and OR-ing them together to obtain the desired value.
>
> Yes, sure, but why would Microsoft's C compiler generate code that
> results in a fully despensable read operation for the padded word?  (I
> know this is a Linux programming list, but the question seems related
> to the overall topic of data alignment in memory.)
>
> Regards
>
> \Steve
>
> --
>
> Steve Graegert <graegerts@gmail.com>
> Software Consultancy {C/C++ && Java && .NET}
> Mobile: +49 (176)  21248869
> Office: +49 (9131) 7126409
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

