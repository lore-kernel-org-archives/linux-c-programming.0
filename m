From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: exit(42)
Date: Mon, 27 Sep 2004 14:39:55 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040927123955.GB7486@luna.mooo.com>
References: <20040924115759.6133.qmail@web52908.mail.yahoo.com> <4154122D.3030403@hq.ntsp.nec.co.jp> <200409271446.04427.pankajd@myrealbox.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200409271446.04427.pankajd@myrealbox.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux prg <linux-c-programming@vger.kernel.org>

On Mon, Sep 27, 2004 at 02:46:03PM +0530, Pankaj wrote:
> hi,
> I guess the value is stored in a global var called "errno".
> 

If this is about the return value, it is not stored in errno. errno
stores the error value of system calls. If errno is set then the
process wasn't executed at all.

To find the return value in c, you can use waitpid and then
WEXITSTATUS(status).

> Pankaj
> On Friday 24 Sep 2004 5:55 pm, Ron Michael Khu wrote:
> > > linux-c-programming" in the body of a message to
> > > majordomo@vger.kernel.org
> > >More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> -- 
> Only one man in a thousand is a leader of men
> Remaining 999 follow women.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
