From: Rechberger Markus <mrechberger@gmail.com>
Subject: Re: obstack_alloc & _obstack_newchunk
Date: Wed, 23 Feb 2005 23:49:26 +0100
Message-ID: <d9def9db05022314495977f841@mail.gmail.com>
References: <NHBBKOOOHBAAJLGEOFLHEENEPJAC.moremari@aca.org.ar>
	 <Pine.LNX.4.21.0502231433360.1736-100000@hestia>
Reply-To: Rechberger Markus <mrechberger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.21.0502231433360.1736-100000@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hmm what's the advantage of using the obstack_* functions? isn't
malloc already enough? never saw it in an application actually so I'm
just curious about it..

thanks
Markus

On Wed, 23 Feb 2005 14:37:17 +0100 (CET), J. <mailing-lists@xs4all.nl> wrote:
> On Wed, 23 Feb 2005, Mariano Moreyra wrote:
> 
> > Hi J.
> >
> > You need to init your obstack before using it
> > Also, you need to declare this before calling obstack_init()
> >
> > #define obstack_chunk_alloc malloc
> > #define obstack_chunk_free free
> >
> > So, your code would look like this:
> 
> <CUT>
> ...
> </CUT>
> 
> Thank you for the complete answer.. !!
> 
> Cheers, J.
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
