From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: various meanings of static
Date: Sat, 23 Jun 2007 17:11:36 +0100
Message-ID: <18045.17976.961868.834988@cerise.gclements.plus.com>
References: <467CB8EC.8080209@gmail.com>
	<84bd26ef0706230555x35fdceber20d5788370b602ee@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <84bd26ef0706230555x35fdceber20d5788370b602ee@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>


Dar=EDo Mariani wrote:

> > I am thinking of using # define-s to use these four words:
> >
> > local, sticky, classwide, nothis
> >
> > instead of static in my C++ programs to make them more meaningful. =
I
> > believe that the above four are mutually distinct purposes of the s=
ingle
> > static keyword and whether a future C++ standard disambiguates thes=
e
> > purposes or not (where I prefer it would) I can even now use these =
new
> > clearer keywords.
>=20
> IMHO, I think it's not a good idea to add your own keywords to your
> code. This will make it harder for anyone else to read it.

It also makes it harder for software (other than the compiler) to read
it.

It isn't enough that the compiler can understand the code. It also
needs to be understood by text editors, lint, indent, etc. Such
programs invariably use syntax which doesn't exactly match the
definition of the language.

The C preprocessor makes that almost inevitable. Remember, source
files are what goes *in* to the preprocessor, while the syntax of C
(the structured grammar written in BNF in the appendix of any decent C
textbook) describes what comes *out* of the preprocessor.

In practice, most programs (other than the compiler) which attempt to
parse C (e.g. text editors which perform syntax highlighting,
indentation, etc) simply ignore preprocessor directives and assume
that any names are simply variable/function/field/tag names, not macro
names.

If you cause this assumption to fail, someone will get bitten.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
