From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: reading elf section data
Date: Mon, 12 Nov 2007 13:07:14 +0100
Message-ID: <6a00c8d50711120407t7c0f39b9g3fb3b45fc630ef31@mail.gmail.com>
References: <473856E2.5050707@gmail.com>
	 <18232.12586.211596.82841@cerise.gclements.plus.com>
	 <6a00c8d50711120329g161f6029ta6724d41c291a049@mail.gmail.com>
	 <47389D7E.5070508@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=+WbJQuNjg82qS4l5tXYgVL2RyXedjxu87kGaU3P/q2I=;
        b=anQwpg44U0jPANdaGkM8jPJRpGoW+iXwVbkx+2DhyxNA5oVqcCQiZmsMypgyYTsx13x4P/3t67LOb0dQkxKpgFPkZ9kstl3KtnDm86qHQjSpk8qQJftqZWfDfW83h7bwEzE0SzSaZNOmR8gn7iuuGLtyiMqUvSxPD0F183oBE+o=
In-Reply-To: <47389D7E.5070508@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: zaphod001@gmail.com
Cc: linux-c-programming@vger.kernel.org

On Nov 12, 2007 7:37 PM, Gery <zaphod001@gmail.com> wrote:
>
> Steve Graegert wrote:
> > On Nov 12, 2007 11:55 AM, Glynn Clements <glynn@gclements.plus.com>=
 wrote:
> >> Gery wrote:
> >>
> >>> How to read in human format data from elf section?
> >> Can you be more specific? What kind of data? What format?
> >
> > I stopped replying to messages like those from the OP.  Demanding h=
elp
> > without providing a minimum of information is just annoying, but
> > doing so without any etiquette is simply rude.
> >
> >       \Steve
> >
> > --
> >
> > Steve Gr=E4gert
> > DigitalEther.de
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-c-p=
rogramming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> Just for my understanding :)
> What is OP?
> What is it wrong w/ my etiquette?
> PLease, help me to fix my mistakes.
>

Hi Gery,

Let's start with a greeting, you'll be welcome and you're done with
50% of the "etiquette".
The OP stands for "original poster" and refers to the thread starter.
=46inally I like to conclude a post with a closing formula or just a
signature including your name.  That's the second part of the
"etiquette".

What I mean by rude is that questions like "How to read ELF data?"
motivates no one to answer as we have to ask for clarification first.
If you'd have asked "How do I read custom ELF sections added by GCC
using C?" everyone knows exactly what you want just by being a bit
more accurate.

Regarding your original question: try readelf first.  It'll probably
do the trick.

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
