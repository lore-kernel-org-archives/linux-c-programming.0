From: Jon Masters <jonmasters@gmail.com>
Subject: Re: exit(42)
Date: Mon, 27 Sep 2004 14:54:35 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <35fb2e5904092706547163c3fd@mail.gmail.com>
References: <20040924115759.6133.qmail@web52908.mail.yahoo.com>
	 <4154122D.3030403@hq.ntsp.nec.co.jp>
	 <200409271446.04427.pankajd@myrealbox.com>
	 <20040927123955.GB7486@luna.mooo.com>
Reply-To: jonathan@jonmasters.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040927123955.GB7486@luna.mooo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>

On Mon, 27 Sep 2004 14:39:55 +0200, Micha Feigin <michf@post.tau.ac.il> wrote:
> On Mon, Sep 27, 2004 at 02:46:03PM +0530, Pankaj wrote:
> > hi,
> > I guess the value is stored in a global var called "errno".

> If this is about the return value, it is not stored in errno.

Indeed. It's stored in exit_code within the process task_struct, along
with other useful data about the terminated process and is the reason
that process descriptors remain around.

When you call wait4 or one of the wait functions, then this gets cleaned up.

Cheers,

Jon.
