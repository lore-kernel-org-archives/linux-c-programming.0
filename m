From: Vadiraj <vadiraj.cs@gmail.com>
Subject: Any pointer to Byte Alignment & Structure Padding?
Date: Mon, 1 Aug 2005 17:46:46 +0530
Message-ID: <6eee1c405080105164cfbbaaa@mail.gmail.com>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	 <6eee1c40508010514517b5b90@mail.gmail.com>
Reply-To: Vadiraj <vadiraj.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6eee1c40508010514517b5b90@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On 8/1/05, Amit Dang <amit_dang@intersolutions.stpn.soft.net> wrote:
> Hi,
>    Can any body provide some light on Byte Alignment & Structure Padding
> for gcc linux x86 32-bit?

 The system expects the address of a variable to be multiple of
its size. Meaning for 32 bit x86 int being 4 bytes. The address
location of a int variable is expected to be at multiple of 4.
ex 0 4 8 12 16. if  its double then its expected it to be multiple of 8.
0 8 16 ...

 In case of structure allignment... this is achieved by padding.
if this is the structure
struct temp
{
      char c;   /* 1 byte lenght */
      int i;      /* 4 byte length */
      char c1; /* 1 byte length */
      long long d /* 8 bytes  lenght */
};

 c starts at offset x( x is assured 4 byte alligned by gcc), i should
start at x+4 as it has to be multiple of 4 3 bytes of padding will be
done by gcc.
c1 starts at x+9, no padding is required char is 1 byte.
d starts at x+16,7 bytes of padding to get multiple of 8.

It would differ if you re arrange the struct like this.
struct temp
{
      char c;   /* 1 byte lenght */
      int i;      /* 4 byte length */
      long long d /* 8 bytes  lenght */
      char c1;
};

for same base offset...i will be from x+4 d would start from x+8,
there would be no padding for d  and c1 at x+16.

I hope it helps.
--
cheers,
Vadi
