From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Fri, 5 Aug 2005 08:32:02 +0200
Message-ID: <6a00c8d50508042332245283db@mail.gmail.com>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	 <6eee1c40508010514517b5b90@mail.gmail.com>
	 <6eee1c405080105164cfbbaaa@mail.gmail.com>
	 <673ac06405080402432d0feda3@mail.gmail.com>
	 <6eee1c40508040823165f1df7@mail.gmail.com>
	 <00c001c59974$32b0c9b0$9900a8c0@ispl091>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <00c001c59974$32b0c9b0$9900a8c0@ispl091>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amit Dang <amit_dang@intersolutions.stpn.soft.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On 8/5/05, Amit Dang <amit_dang@intersolutions.stpn.soft.net> wrote:
> Hi Vadiraj,
> The statement " Take it for granted you get either 4 byte or 8 byte boundary
> but never 1 byte." you made is it generic or just valid for the structure in
> question? If its generic then I have a question.
> Why the size of
> struct {
>    char i;
>    char j;
>    char k;
> } is 3 ? (gcc 2.96 on Linux 32-bit machine).

Because the alignment requirement for this structure is 1, it is
byte-aligned.  A structure is padded and properly aligned only if one
of its members requires more than a single byte of storage. Take a
look at this:

	struct a {
		char  a;
		int    :0;
		char  b;
	};

its size is 3, since it's byte-aligned also.  This rule does not hold
for the structure

	struct b {
		char  a;
		short s;
	}

since one member, here s, requires more than one byte of storage and
must be aligned to a 4 byte boundary (4 is the smallest possible
multiple of 2 larger than 3) resulting in sizeof(b) == 4.

> What I have understood atleast for gcc compiler Linux 32-bit machine is
> that, Maximum byte boundary is 4.

True for int, but double and long long will always be 8 byte aligned by default.

> equal to minimum of (4 or field with maximum size (within the structure)).
> i.e. for the above example maximum field size if 1 and min (4, 1) = 1, so
> structure is aligned to 1 byte.
> If I have following structure
> struct {
>    short i;
>    char j;
> } its size will be 4.

True.
 
> if i modify the above struct to
> struct {
>    int i;
>    char j;
> } its size will be 8.

Yes, exactly.

> Now modifying int to long long in the above structure will have a size of
> 12 not 16 because byte alignment min (4, 8) = 4.

No, it will have a size of 16 because the alignment requirement for
this structure is a multiple of its largest member.  long long and
double is always double word aligned.

Regards

	\Steve
