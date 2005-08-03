From: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Wed, 3 Aug 2005 09:34:53 +0530
Message-ID: <043401c597e0$90db3240$9900a8c0@ispl091>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091> <6eee1c40508010514517b5b90@mail.gmail.com> <6eee1c405080105164cfbbaaa@mail.gmail.com> <17134.43470.280296.644313@cerise.gclements.plus.com> <6eee1c40508020421ceab653@mail.gmail.com> <039a01c59757$1a1d8ba0$9900a8c0@ispl091> <17135.41396.309256.176762@cerise.gclements.plus.com> <6eee1c4050802101269ac862b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj <vadiraj.cs@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Reading byte wise won't help any way. Its both reading and writing.
Structure in that case should be written field wise. Moreover in this case
we need to take care of size of different types, floating point format, etc.
Its tough!!
----- Original Message ----- 
From: "Vadiraj" <vadiraj.cs@gmail.com>
To: "Glynn Clements" <glynn@gclements.plus.com>
Cc: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>;
"linux-c-programming" <linux-c-programming@vger.kernel.org>
Sent: Tuesday, August 02, 2005 10:42 PM
Subject: Re: Any pointer to Byte Alignment & Structure Padding?


> On 8/2/05, Glynn Clements <glynn@gclements.plus.com> wrote:
> >
> > Amit Dang wrote:
> >
> > >     Thanks for the reply. So any idea about how structure should be
defined
> > > in case it is to be used by a text file editor which works on both
linux &
> > > solaris.
> >
> > However you like.
> >
> > You shouldn't be trying to read blocks of data from a file directly
> > into a C "struct" in memory. That technique is fine for "internal"
> > files which only need to be read by one version of the software on one
> > particular platform, but it's the wrong approach for "interchange"
> > files which can be transferred between different systems or different
> > versions of the software.
> >
> > For interchange formats, rather than making assumptions about the
> > size, offset and byte order of structure fields, you should either
> > write your own decoding and encoding routines or use a standard data
> > encoding (e.g. XDR, ASN.1 etc).
>
>  May be you could align your structure such a way that compiler does
> not have to do any padding. In that case you would not face any
> problem across different platforms.
>
> for the same example arranging it this way would give 16 bytes on all
> 32 bit compilers..
>
> struct temp
> {
>    long long l;
>     int i;
>    char c;
>    char c1;
> }; /* this example would still gets padded at the end. If you could
> avoid this too,
> you are safe */
>
>  Best way that I would prefer would be read byte wise and form the
> structure peacefully instead of direct struct read.

