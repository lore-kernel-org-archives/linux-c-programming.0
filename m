From: "Pedro de Medeiros" <pedrovmm+lists@gmail.com>
Subject: Using both wchar_t and GCC __attribute__((format(...)))
Date: Mon, 2 Jul 2007 16:52:05 -0300
Message-ID: <38511efb0707021252r2b995821x9880f11165500184@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        b=EOn6Rml/AWhS+qAyRfc+ew/V/3vtAs5vJtSU3GxYCJb9X7p6mTy7xwZ53ZPhN1AT9bSTtUCKTsCS6rXeoipoRW0QjCwEm9jdf7ULAdKXWMloOpse9fIpyKwgJoH41DadQASwA1fOWy44Eg61cb4JMa13LP2VAmCn1cWd8ctZe7Q=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello,

I am trying to convert some functions in my library from (char *) to
(wchar_t *), and it has been a bit of a nightmare. I want to use GCC er=
ror
detection for printf-style functions, but that doesn't seem to work whe=
n
functions use wchar_t *. For instance:

void trace(conn_t *, wchar_t *, ...)
        __attribute__ ((format(printf, 2, 3)));

And GCC aborts with:

"error: format string argument not a string type"

Then I tried something like:

void trace(conn_t *, wchar_t *, ...)
        __attribute__ ((format(wprintf, 2, 3)));

But GCC tells me that:

"warning: 'wprintf' is an unrecognized format function type"

Which I assume will disable GCC printf-style error checking.

How do I solve this other than disabling this feature completely?
Any help would be greatly appreciated.

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
