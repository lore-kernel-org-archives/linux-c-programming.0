From: nhorman@tuxdriver.com
Subject: Re: weird structure definition in header file
Date: Tue, 6 Sep 2005 15:23:24 -0400
Message-ID: <20050906192324.GA10879@hmsreliant.homelinux.net>
References: <Pine.LNX.4.63.0509061510210.24485@vericenter>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0509061510210.24485@vericenter>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Tue, Sep 06, 2005 at 03:13:48PM -0400, Robert P. J. Day wrote:
> 
>   i'm looking at some legacy code and, in a header file, i find the
> following (paraphrased for brevity):
> 
> typedef struct {
> 	... stuff ...
> } Widgets ;
> 
> extern Widgets Widget ;
> 
> 
>   huh?  i can see why a header file would want to define a structure
> but i'm confused why the *header* file would then refer to an external
> object of that type.  that's a new one on me -- typically, i'd expect
> a *source* file to define such a thing and other *source* files to
> contain the "extern" declaration.
> 
>   is this some subtle programming cleverness of which i am unaware?
> thanks.
> 
This is done quite frequently when a data structure needs to be referenced from
multiple locations.  They're not necessicarily consecutive like that, but its
rather a common practice to extern a instance of a type in a header file.  The
kernel source tree does this very frequently, check include/net/ipv4 for lots of
examples.

Regards
Neil

> rday
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
/***************************************************
 *Neil Horman
 *Software Engineer
 *gpg keyid: 1024D / 0x92A74FA1 - http://pgp.mit.edu
 ***************************************************/
