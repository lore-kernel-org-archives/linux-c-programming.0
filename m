From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: makecontext(3)
Date: Tue, 29 Jul 2003 12:39:16 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030729113916.GA3501@lsd.di.uminho.pt>
References: <la1xwao4i1.wl@mac.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <la1xwao4i1.wl@mac.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kkonaka@mac.com
Cc: linux-c-programming@vger.kernel.org

On Mon, Jul 28, 2003 at 03:06:30PM -0400, kkonaka@mac.com wrote:
> on the surface(?) calls to makecontext() appear to have to be 
> preceded by getcontext() to completely initialize its arg: ucontext_t
> struct (that is, if I comment out getcontext() calls from a
> program like the below, it causes SEGV). why is it the case?
> kenji

Hello,

From the manual page:
       The makecontext() function modifies  the  context  pointed  to  by  ucp
       (which was obtained from a call to getcontext()).  Before calling make-
       context(), one should allocate a new stack for this context,  assigning
       to   ucp->uc_stack,  and  define  a  successor  context,  assigning  to
       ucp->uc_link. 

I assume that the getcontext() is needed to get values for registers
(cs, ds, es, gs, ...).

Regards,
Luciano Rocha
