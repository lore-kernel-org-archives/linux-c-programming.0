From: Phil Sutter <phil@nwl.cc>
Subject: Re: How to check if char pointer is a constant!?
Date: Fri, 8 Jul 2016 14:59:31 +0200
Message-ID: <20160708125931.GQ620@orbyte.nwl.cc>
References: <CAF3SDA6G32Kub4rK5BSmx7TkWoXnGWW2ESyHnM_+3t-naVPDww@mail.gmail.com>
 <20160707202621.GP620@orbyte.nwl.cc>
 <CAF3SDA5-L--FOXe-AzaRf7QE0Qx+XAuLeWNnFN-96smSEYJ7GA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAF3SDA5-L--FOXe-AzaRf7QE0Qx+XAuLeWNnFN-96smSEYJ7GA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel." <danielhilst@gmail.com>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On Fri, Jul 08, 2016 at 09:33:03AM -0300, Daniel. wrote:
> Hi all thanks for the reply.
> 
> I think I wasn't clear. Here is a working example: http://codepad.org/0SUG6IcQ
> 
> The function get_pair_from_string() should I) remove trailing spcaes, II) return
> the address for key and value using it's last parameters. The problem is that
> since I modify the first parameter calling with strings constants generates a
> segmentation fault. This is because strings constans aren't modifiable. I wan't
> to have better hints when this happen than just "SEGSEGV". I think that the
> -Wwrite-strings is what I was looking for :D, thanks Phil!!!

Glad I could help.

> John, I'll be in production, but not at this time. Luckly, that
> function is file scoped
> so I don't have to bother that much. Still I like to avoid the crypt
> "SEGSEGV" error
> message as much as possible. Usually I assert for NULL pointers and give a nice
> error message but this case is trickier. I'll take Phil advice and use
> -Wwrite-strings

Calling 'SIGSEGV' an error message is a slight underestimation. Actually
your program simply crashes. The gcc warning to activate will just help
to keep your code sane, not improve run-time behaviour.

If you want to modify strings no matter whether they are constant or
not, strdup() them into a local variable and work with that. Especially
since it's just for parsing as your example shows. Just keep in mind
that you will have to free the duplicated string at some point,
otherwise you will have a memory leak (which at some point will lead to
an equally cryptic message as your segfault did).

Cheers, Phil
