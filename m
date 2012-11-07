From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: How does atomic operation work on smp
Date: Wed, 7 Nov 2012 17:45:08 +0100
Message-ID: <20121107164507.GA3571@opentech.at>
References: <20121108070121.GA7492@gmail.com> <CADtGFvkoVX-CCEPRE7swRFiTeBo2wFiQx_8S5woKp_ts8XsUUA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADtGFvkoVX-CCEPRE7swRFiTeBo2wFiQx_8S5woKp_ts8XsUUA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hendrik Visage <hvjunk@gmail.com>
Cc: Jimmy Pan <dspjmt@gmail.com>, linux-newbie@vger.kernel.org, linux-c-programming@vger.kernel.org

On Wed, 07 Nov 2012, Hendrik Visage wrote:

> On Thu, Nov 8, 2012 at 9:01 AM, Jimmy Pan <dspjmt@gmail.com> wrote:
> > I understand how atomic operation work on unary core processors, I think it just disables the interrupt and dominate the cpu until it finished.

Atomic operations do not need to disable interrupts - a test-and-set operation does not disable interrupts. Locking primitives like spin-locks that allow you to get consistent access to non-atomic critical sections may disable interrupts.

It seems to me that you are identifying atomic operations with critical sections, which is not really the same thing - but maybe I missunderstood you.

> > While, how do we implement this on multi processor computers?
> > Suppose cpu A is performing an atomic operation on variable a. At the same time, cpu B is also performing the operation on a. In such the result may be overwritten.
> > Of course we can use spinlocks, but on the atomic operation's behalf, how does it gurantee to prevent such case?
> > Can anyone explain the crux of it? Thanks.
> 
> Basically you make use of machine specific instructions that will  do
> that for you.
> In other words, get the datasheets of the specific system you intent
> to code on/for (I assume here you are refering to assembler level
> codes, as higher up you make use of the relevant libraries that does
> that for you).
>

More or less any (sane) architecture will provide some very basic atoicity
capabilities. a 32bit (or 64bit on 64bit boxes) data object is guaranteed
to be consistent (that is you will never be able to get half of the old and
half of the new value if there were a concurrent read and write). Some form
of Compare and Swap (CAS) / Test and Set bit assembler instructuion will be
provided that can overcome the lowest level race that would be incured by
setting and then testing in separate steps. And finally low level
mechanisms are provided to ensure consistency over cores by load/store
fences (memory barriers). 

In the above case where you have a concurrent reader and writer of variable
"a" you do not need any lock provided the data object is only a single 32/64
bit object - if it is say a struct then you need locking to ensure consistency
of the retrieved data. The atomic instructions are then actually only needed
for the locks (but note that locks here are pure advisory locks not enforced
in any way by HW). 

so if you have a writer updating a variable and a reader reading it concurently
then the reader is guaranteed to always read a consistent 32bit (or 64bit) 
entity - but it is not guaranteed of course that you actually read all 
intermediate values (that is completness is not guaranteed). If the variable
is more than a primitive data object then you need to protect it by associating
a lock with the data object (always lock data not code...)


thx!
hofrat
