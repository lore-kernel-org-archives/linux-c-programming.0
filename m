From: ben <brouits@free.fr>
Subject: Re: strtok, bus error
Date: Tue, 17 Feb 2009 05:04:22 +0100
Message-ID: <499A3746.1070502@free.fr>
References: <125035.76273.qm@web63404.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <125035.76273.qm@web63404.mail.re1.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

=46undu a =E9crit :
> i'm trying to do pretty simple replacement using strtok.
> but it looks like i have missed some subtle difference between the tw=
o following=20
>  =20
>   char src[]  =3D "hello world #";
>   char *other =3D "hello world #";

i don't know if it is a compiler feature (storage behavior into the DAT=
A
segment), or a linux kernel feature, or if it is specified in ANSI, but
the second way leads to pointing to a _constant_ string. If someone can
enlighten...

> because if i use "char * other" with strtok it fails with bus error b=
ut i use src it works, don't understand what's the difference.
> any insight would be appreciated, TIA!
strtok manpage says it has to _write_ into the string pointed to by its
first parameter. this is not allowed if the pointer points to a constan=
t
string.

then,
you have to point into a string that have been created at runtime.

char* src;
src =3D malloc (12);
strncpy (src, "hello#world", 11);
=2E..
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
