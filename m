From: "Pedro de Medeiros" <pedrovmm+lists@gmail.com>
Subject: Re: various meanings of static
Date: Sun, 24 Jun 2007 18:08:20 -0300
Message-ID: <38511efb0706241408m42241137n254944e32902262c@mail.gmail.com>
References: <467CB8EC.8080209@gmail.com>
	 <84bd26ef0706230555x35fdceber20d5788370b602ee@mail.gmail.com>
	 <18045.17976.961868.834988@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        b=Q/jhuYz9lvGfLSDo4UtlqRzMBiG34QTul5ljFxDS0ZR1h/IPIf006WZibOZWoM2zxTldfKGbwow1LKgDQZczUfdSqx4ophaqsEAQII+QuPmBog5xV2bkSltUqaAQXGb3t8y5aj80Anh3EsZsGWaQ3SM2aY+rzZd+TQEBhQlhaNA=
In-Reply-To: <18045.17976.961868.834988@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On 6/23/07, Glynn Clements <glynn@gclements.plus.com> wrote:
>
> Dar=EDo Mariani wrote:
>
> > > I am thinking of using # define-s to use these four words:
> > >
> > > local, sticky, classwide, nothis
> > >
> > > instead of static in my C++ programs to make them more meaningful=
=2E I
> > > believe that the above four are mutually distinct purposes of the=
 single
> > > static keyword and whether a future C++ standard disambiguates th=
ese
> > > purposes or not (where I prefer it would) I can even now use thes=
e new
> > > clearer keywords.
> >
> > IMHO, I think it's not a good idea to add your own keywords to your
> > code. This will make it harder for anyone else to read it.
>
> It also makes it harder for software (other than the compiler) to rea=
d
> it.
>
> It isn't enough that the compiler can understand the code. It also
> needs to be understood by text editors, lint, indent, etc. Such
> programs invariably use syntax which doesn't exactly match the
> definition of the language.
>
> The C preprocessor makes that almost inevitable. Remember, source
> files are what goes *in* to the preprocessor, while the syntax of C
> (the structured grammar written in BNF in the appendix of any decent =
C
> textbook) describes what comes *out* of the preprocessor.
>
> In practice, most programs (other than the compiler) which attempt to
> parse C (e.g. text editors which perform syntax highlighting,
> indentation, etc) simply ignore preprocessor directives and assume
> that any names are simply variable/function/field/tag names, not macr=
o
> names.
>
> If you cause this assumption to fail, someone will get bitten.


The problem is that some people already consider a good practice to
create their own 'decorators' when they use GCC extensions, but they
need to turn them off when the compiler doesn't support such features.
Consider this, for instance:

#ifdef __GNUC__
#define format(si, ftc) __attribute__ ((format(printf(si, ftc)))
#define internal __attribute__ ((visibility("hidden")))
#define public __attribute__ ((visibility("default")))
#define useful __attribute__ ((warn_unused_result))
#else
#define format(si, ftc)
#define internal
#define public
#define useful
#endif

Some of those 'decorators' are valuable assets when detecting code
mistakes, maintaining library encapsulation and whatnot. Not using
#defines is not an option, since other compilers may not support those
GCC extensions. Should we discard them because some highlighting
editors don't know what to do with them?


Cheers,
Pedro.

--=20
Pedro de Medeiros - Ci=EAncia da Computa=E7=E3o - Universidade de Bras=ED=
lia
Home Page: http://www.nonseq.net - Linux User No.: 234250
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
