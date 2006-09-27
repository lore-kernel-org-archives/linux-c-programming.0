From: "Kelly Burkhart" <kelly@kkcsm.net>
Subject: Re: Struct padding (was blank subject)
Date: Wed, 27 Sep 2006 09:19:35 -0500
Message-ID: <fa1e4ce70609270719l6bdf5902h7606bcfee5958d90@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 9/26/06, Kirkwood, David A <DAVID.A.KIRKWOOD@saic.com> wrote:
> I have an application that works perfectly in a 32 bit environment, but
> does not in a 64 bit environment. I believe
>
> The problem has to do with a structure defined as
>
>             Struct  x {
>
>                         Short aaa
>                         Short bbb
>                         Char something[12]
>                         Long lll
>                         Long mmm
>             }
>
> Sorry about the capitalization.... I'm condemned to using exchange /
> outlook.
>
> After the program starts, I look at the  short variables above and they
> are initialized to hex 2020 (both) which are spaces if they were
> characters. Since this structure is initialized with a pointer to is (
> and its components ) I wonder if in the 64 bit environment I have to
> manually pad out the size(s) to even 64 bit boumderies?

How are you initializing the structure?

You usually shouldn't depend on the layout of structures.  There are
cases in which it is necessary, but it is usually better to avoid.  If
you're trying to write the memory region of this structure to a file
on a 32-bit machine and read it on a 64-bit machine it  would be
better to write marshal/unmarshal functions to transform the structure
to/from a platform independent representation.
