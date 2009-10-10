From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Reading UTF16 input from STDIN using fgetws()
Date: Sat, 10 Oct 2009 10:01:21 +0100
Message-ID: <19152.19809.85689.989297@cerise.gclements.plus.com>
References: <25822791.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <25822791.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: SriKrishna Erra <erra_krishna@yahoo.co.in>
Cc: linux-c-programming@vger.kernel.org


SriKrishna Erra wrote:

> As deault LC_CTYPE value is "utf-8" on linux (also on all unix flavours),
> fgetws() is treating the input as utf-8 and trying to convert to a wide
> character string.

The default locale for all categories is "C" (alias "POSIX"), which
uses the ASCII encoding. To use any other locale, you must use
setlocale(LC_CTYPE, ...) or setlocale(LC_ALL, ...).

If you call setlocale(LC_CTYPE, "") (i.e. an empty locale string), the
LC_CTYPE category will be initialised based upon the environment
variables LC_ALL, LC_CTYPE, or LANG. If none of those are variables
are defined, it will remain in the "C" locale.

Your Linux distribution may configure these variables to refer to a
UTF-8 locale, but that's a different issue.

> My input contains UTF16 strings and it has "0xfeff" BOM as first character.
> As fgetws() treating the input is in utf-8, 0xfe(first byte of BOM) will be
> an invalid sequence in utf-8 and also 0xff (second byte of BOM) is an EOF.
> So fgetws() is returning nothing.
> 
> If i use fopen() then there will be no issues because i will pass the input
> ecnoding as parameter to fopen() like  fopen("filename","r,ccs=UTF16-LE");
> 
> With this fgetws() will treat the input as UTF16 and will convert the input
> from UTF16 to a wide character string.
> 
> So no issues with fopen().
> 
> But my requirement is input from STDIN.
> 
> Please let me know how to set the encoding "ccs=UTF-16LE" to STDIN so that
> fgetws() will consider the STDIN input in UTF16 form.
> 
> I have also tried fdopen() but no use. 
> fdopen(int fd,mode);

fdopen() returns a new FILE*. I don't know whether it's safe to assign
this to stdin, though.

> There is a requirement that the mode parameter vaues in fdopen() should be
> the same as of the one used in fopen().

No, it says that the mode must be compatible with the underlying
descriptor, i.e. that you can't use fdopen(fd, "w") if the file was
opened in O_RDONLY mode.

> But we are not at all using fopen() and the default encoding of STDIN is
> utf-8. 
> So when fdopen(fd,"ccs=utf-16le"); is used, it returns nothing as there is a
> mismatch in encodings i.e defualt of STDIN is utf-8 and fdopen is passing
> utf-16LE.

fdopen() returns a new FILE* which has nothing to do with stdin, even
if you use 0 for the fd. The underlying descriptor doesn't have an
encoding associated with it.

Have you tried using the FILE* returned from fdopen()?

> So please let me know how to change the encoding of STDIN i.e how to set
> encoding "ccs=UTF-16LE" to STDIN 

Have you tried:

	freopen("/dev/stdin", "r,ccs=UTF16-LE", stdin);

?

freopen() is the "standard" way to associate a new file with an
existing FILE*.

-- 
Glynn Clements <glynn@gclements.plus.com>
