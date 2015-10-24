From: Phil Sutter <phil@nwl.cc>
Subject: Re: Does __attribute__((__packed__)) aplies to types or variables?
Date: Sat, 24 Oct 2015 02:52:32 +0200
Message-ID: <20151024005130.8643C214AA@mail.nwl.cc>
References: <CAF3SDA6FP6=uqs-37_iTH0Qf2hS5Eh5ONVUVcZqEtc3AQ69cfA@mail.gmail.com>
 <CAK7N6vrh05XDwa_nBTmid8QZUU8wgFhm0w=R+aMA9tOugL46Mg@mail.gmail.com>
 <CAF3SDA7pObzwzk-AzdO38-c45VggTJJpwdNzujAuyMV=eSCc=w@mail.gmail.com>
 <CAF3SDA4G2YGNOOOSeQE7JPow62M1NX34SiMv=5KykFb-oO1Exg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAF3SDA4G2YGNOOOSeQE7JPow62M1NX34SiMv=5KykFb-oO1Exg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel." <danielhilst@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, Oct 22, 2015 at 02:18:47PM -0200, Daniel. wrote:
> I mean that packed attribute is applied only when allocation is
> implied or can I apply packed
> attribute to struct definitions where no variables are declared?

Yes, it applies to the type.

> struct __attribute__((__packed__)) foo { ... };
> struct foo bar; <--- is this packed?

Compare sizeof(struct foo) with sizeof(bar) to find out yourself.

Cheers, Phil
