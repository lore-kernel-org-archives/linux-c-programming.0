From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: threads and kernel
Date: Mon, 22 Oct 2007 15:31:41 +0200
Message-ID: <6a00c8d50710220631u7a9589bcjccdbca234184edaf@mail.gmail.com>
References: <471B5276.9010800@gmail.com>
	 <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
	 <471C4849.2040409@purplelabs.com>
	 <6a00c8d50710220601s6aa10d26u762215a3989bf6cd@mail.gmail.com>
	 <471CA544.5050701@purplelabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=BtksnT9ZW8Hh7WkjO3ZSa3A8mp83D/aLM5BMuicOmDg=;
        b=Nu7vP5WIPgtN0aKEQb5U2aKfWEFluHXydddwuqzK+1BRRt9XX6EbNh4mrB+980DGz3JjCxW26fnW/dMO67PPQjZeEu1urs3jde+dyBqbe97Fw/nXJ9g2o55knIfAX6afu+mvVEWt+DUXicW5n5D7/kQaUsMqgt/Osc86UJwbjks=
In-Reply-To: <471CA544.5050701@purplelabs.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Benoit Fouet <benoit.fouet@purplelabs.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Benoit,

On 10/22/07, Benoit Fouet <benoit.fouet@purplelabs.com> wrote:
> Hi Steve,
>
> Steve Graegert wrote:
> > Hi Benoit,
> >
> > On 10/22/07, Benoit Fouet <benoit.fouet@purplelabs.com> wrote:
> >
> >> Hi,
> >>
> >> Steve Graegert wrote:
> >>
> >>> As a side note: you can safely use dlopen()  to load shared libra=
ries,
> >>> whether or not they depend on libpthread.so, as long as the main
> >>> program was initially threaded.  The other way round is dangerous=
 and
> >>> mostly not allowed.
> >>>
> >>>
> >>>
> >> could you please elaborate a bit on that ? i cannot see why this i=
s
> >> dangerous.
> >>
> >
> > I was referring to making an application multithreaded at runtime.
> > Therefore you cannot use dlopen() to dynamically add libpthread.so =
to
> > a process when the main program is not __initially threaded__.  By
> > "initially threaded" I mean that the libpthread.so  library is
> > initialized at program start, either because the main program links
> > against libpthread.so directly, or because it links against some ot=
her
> > shared library that links against libpthread.so.
> >
> > Dynamically changing the process environment from "nonthreaded" to
> > "threaded" is dangerous and rarely useful (I actually doubt that th=
is
> > "feature" is useful at all).
>
> If i understand correctly what you're saying, you cannot have somethi=
ng
> like:
>
> int main(int argc, char *argv[]) {
>   /* ... */
>   foo =3D dlopen("bar.so");
>   /* use bar.so functions, clean, etc... */
> }
>
> if bar.so is multithreaded (and thus, linked to libpthread.so) and yo=
u
> don't compile your main program with -lpthread option.
> did i understand you right ?
>
> this would mean you may need to link against pthread library, just in
> case the library(ies) you dlopen might use it ?

Linking against a multi-threaded library at compile time, turns the
main program into a multi-threaded program even though no use of
threads is being made at all.

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
