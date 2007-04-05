From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: efficiency in passing a value to a function
Date: Thu, 5 Apr 2007 15:02:07 +0200
Message-ID: <6a00c8d50704050602j1c7a7543le5ebeb3b19994977@mail.gmail.com>
References: <4613DCB8.8030007@gmail.com>
	 <6a00c8d50704041138l278f34d2t9c97ba551f7ad5c3@mail.gmail.com>
	 <17940.58896.512698.269693@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=raHufAmWQwJ8wcCsMuDL2MnELG2nWHP6+Vsc3ZdDiEGJERT44hKpUxmn/uo/yFTfJx2AZEktCt8eEhS5bXUJR9Ol8p4XFuXVaBGAAV+YtWACJIPdsEnOd0RyJfFXsBmCbCYWCn41U60gXxcQ97BXXTR2A/F5CKXmj8PS4fORxRI=
In-Reply-To: <17940.58896.512698.269693@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Shriramana Sharma <jamadagni@gmail.com>, linux-c-programming@vger.kernel.org

On 4/5/07, Glynn Clements <glynn@gclements.plus.com> wrote:
>
> Steve Graegert wrote:
>
> > > I think passing as const & would be more efficient since passing =
by
> > > value would involve copying the value whereas passing by const & =
would
> > > skip this step. Am I right? Or is there something else?
> >
> > I have seen many programs making use const reference parameters in
> > order to inform the compiler that the parameter is read-only, and
> > hence should be better optimized.
> >
> > Unfortunately, this intent is at odds with the C++ language
> > definition. The const keyword says that the storage may not be
> > modified through the given name. What it does not say is that the
> > storage cannot be modified through some other name.
> >
> > With the exception of variables directly declared const, which mean=
s
> > you can only initialize them, const is basically ineffective a
> > improving run-time performance. It does, however, catch errors in t=
he
> > programming process.
>
> Using a const qualifier still allows the compiler to optimise the
> caller. E.g. if it computes a complex expression involving a variable=
,
> passes a pointer/reference to that variable to a function, then
> subsequently uses the result of the expression, it doesn't have to
> re-compute the expression if the pointer/reference has a const
> qualifier.
>
> In any case, I suspect that the OP was talking primarily about passin=
g
> references rather than values, rather than about const qualifiers
> per se.

This might indeed be true.

If a programmer has chosen to pass a reference rather than a value,
even if no reference is actually required, intentions to improve
run-time performance come into mind.  It is much more intuitive to
pass primitives by value and use references only where appropriate,
since performance gains due to the use of the const qualifier are very
small and negligible in most cases.

	\Steve

--

Steve Gr=E4gert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
Internet  http://eth0.graegert.com, http://blog.graegert.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
