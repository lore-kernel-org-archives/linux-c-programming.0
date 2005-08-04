From: Vadiraj <vadiraj.cs@gmail.com>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Thu, 4 Aug 2005 20:53:55 +0530
Message-ID: <6eee1c40508040823165f1df7@mail.gmail.com>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	 <6eee1c40508010514517b5b90@mail.gmail.com>
	 <6eee1c405080105164cfbbaaa@mail.gmail.com>
	 <673ac06405080402432d0feda3@mail.gmail.com>
Reply-To: Vadiraj <vadiraj.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <673ac06405080402432d0feda3@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Prabhat Hegde <pubs.hegde@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On 8/4/05, Prabhat Hegde <pubs.hegde@gmail.com> wrote:
> According to what you have said, dont you think it depnds from which
> address your affset begins.
>   Considring your last example,
>    struct temp
> > {
> >       char c;   /* 1 byte lenght */
> >       int i;      /* 4 byte length */
> >       long long d /* 8 bytes  lenght */
> >       char c1;
> > };
> 
>   Since char (1 byte ) can start anywhere withour padding,
>   Lets take x to be at address X wherein (X mod 4 = 3), then in that
> case "i" will have no padding since char (1 byte ) will make the
> starting address of the int to agree with a 4 byte boundary.
>   Now again the next long having a 8 byte boundary willl be/ may not
> be padded depanding on the starting address.
>  So what i feel is that begin the variable which has the maximum byte
> boundary requirement. Now since all nos divisible by 8 are divisible
> by 4, we will be cutting out the padding for int. Char can come in the
> last.

  The starting address is assured to be 4 byte boundary. Some
compilers provide 8 byte boundary too. They never start with 1 byte
boundary.

That is the reason why the structure gets padded even at the end. To make it 
4 bytes alligned.


>   hence what if the structure is like the below:
>    struct temp{
>        long lond d;   // x + padding if required to suffice 8 byte boundary
>        int i;             // no padding
>        char c;         // no padding
>        char c1;       // no padding
>        };

  For this example the size should come to 8+4+1+1=14 bytes. But when
you check it will be 16 bytes. Due to padding, to make it 4/8 byte
boundry.
 
Take it for granted you get either 4 byte or 8 byte boundry but never 1 byte. 

Arranging the structure as mentioned above will definitely remove
portablility issue
as for both 4 byte or 8 byte aligned compilers the size will be 16 bytes.

-- 
cheers,
Vadi
