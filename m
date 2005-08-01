From: wwp <subscript@free.fr>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Mon, 1 Aug 2005 16:11:25 +0200
Message-ID: <20050801161125.716db5ff@localhost.localdomain>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	<6eee1c40508010514517b5b90@mail.gmail.com>
	<015a01c59694$80662070$9900a8c0@ispl091>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <015a01c59694$80662070$9900a8c0@ispl091>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello Amit,


On Mon, 1 Aug 2005 17:57:48 +0530 "Amit Dang"
<amit_dang@intersolutions.stpn.soft.net> wrote:

> Hi Vadiraj,
>     Thanks for the explaination but when i try following structure
> struct temp
>  {
>         char c;   /* 1 byte lenght */
>         int i;      /* 4 byte length */
>         char c1; /* 1 byte length */
>         long long d /* 8 bytes  lenght */
>  };
> on a linux machine x86 32-bit with gcc 2.96. It gives its size = 20 bytes
> not 24 bytes (as explained by you)

See below (this applies to both members sorting examples from Vadiraj):

struct           padded  offset
member     size  size    range
-------------------------------
c          1     4       0-3
i          4     4       4-7
c1         1     4       8-11
d          8     8       12-19

So, 20 bytes. Isn't it right?


Regards,

> ----- Original Message ----- 
> From: "Vadiraj" <vadiraj.cs@gmail.com>
> To: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
> Sent: Monday, August 01, 2005 5:44 PM
> Subject: Re: Any pointer to Byte Alignment & Structure Padding?
> 
> 
> > On 8/1/05, Amit Dang <amit_dang@intersolutions.stpn.soft.net> wrote:
> > > Hi,
> > >    Can any body provide some light on Byte Alignment & Structure Padding
> > > for gcc linux x86 32-bit?
> >
> >  The system expects the address of a variable to be multiple of
> > its size. Meaning for 32 bit x86 int being 4 bytes. The address
> > location of a int variable is expected to be at multiple of 4.
> > ex 0 4 8 12 16. if  its double then its expected it to be multiple of 8.
> > 0 8 16 ...
> >
> >  In case of structure allignment... this is achieved by padding.
> > if this is the structure
> > struct temp
> > {
> >        char c;   /* 1 byte lenght */
> >        int i;      /* 4 byte length */
> >        char c1; /* 1 byte length */
> >        long long d /* 8 bytes  lenght */
> > };
> >
> >  c starts at offset x( x is assured 4 byte alligned by gcc), i should
> > start at x+4 as it has to be multiple of 4 3 bytes of padding will be
> > done by gcc.
> > c1 starts at x+9, no padding is required char is 1 byte.
> > d starts at x+16,7 bytes of padding to get multiple of 8.
> >
> > It would differ if you re arrange the struct like this.
> > struct temp
> > {
> >        char c;   /* 1 byte lenght */
> >        int i;      /* 4 byte length */
> >        long long d /* 8 bytes  lenght */
> >        char c1;
> > };
> >
> > for same base offset...i will be from x+4 d would start from x+8,
> > there would be no padding for d  and c1 at x+16.
> >
> > I hope it helps.
> > -- 
> > cheers,
> > Vadi
> 
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
wwp

