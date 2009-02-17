From: ben <brouits@free.fr>
Subject: Re: strtok, bus error
Date: Tue, 17 Feb 2009 22:05:13 +0100
Message-ID: <499B2689.4070404@free.fr>
References: <125035.76273.qm@web63404.mail.re1.yahoo.com>	<499A3746.1070502@free.fr> <18843.6873.192794.250251@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18843.6873.192794.250251@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

thank you for that precise explanation.
objdump is now less cryptic to me...
- ben

Glynn Clements a =E9crit :
> ben wrote:
>> i don't know if it is a compiler feature (storage behavior into the =
DATA
>> segment), or a linux kernel feature, or if it is specified in ANSI, =
but
>> the second way leads to pointing to a _constant_ string. If someone =
can
>> enlighten...
>=20
> ANSI C says that string literals "may" be read-only. On platforms wit=
h
> memory protection they usually are read-only.
>=20
> On Linux, string literals are stored in the "rodata" segment, which i=
s
> read-only, and thus can be shared between all processes which are
> using a given executable or shared library.
>=20
> You can list the segments which make up an executable or shared
> library using "objdump -h"
> [snipped]
>=20
> The main ones are text, rodata, data, and bss.
>=20
> The text segment holds code, and is read-only and executable (CODE
> flag).
>=20
> The others hold static data: global variables, "static" local
> variables, string literals, and intialisers for automatic
> (non-"static" local) arrays.
>=20
> Read-only data (literals, initialisers, "const" variables) goes into
> the rodata segment, which is read-only.
>=20
> Mutable variables with explicit initialisers go into the data segment=
=2E
>=20
> Mutable variables without initialisers (i.e. implicitly initialised t=
o
> zero) go into the bss segment. As the entire bss segment is initially
> zero, it doesn't need to be stored in the file (this is indicated by
> the lack of the CONTENTS, LOAD, and CODE/DATA flags).
>=20
> The other segments tend to be architecture-specific.


--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
