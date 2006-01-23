From: Jesse Ruffin <jesse@ajp-services.net>
Subject: Re: Help: need to prevent infinite loop
Date: Mon, 23 Jan 2006 00:57:15 -0500
Message-ID: <43D4703B.4030307@ajp-services.net>
References: <200601171006.36978.samjnaa@gmail.com>	<43CC996D.4050100@ajp-services.net> <17363.23676.751524.480464@cerise.gclements.plus.com> <43D36C6D.4080500@ajp-services.net>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43D36C6D.4080500@ajp-services.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

The Standard I found, located at
http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1124.pdf
does state in section 7.19.6.2 Sec. 9:

An input item is read from the stream, unless the specification includes
an n specifier. An input item is defined as the longest sequence of
input characters which does not exceed any specified field width and
which is, or is a prefix of, a matching input sequence (^245). The first
character, if any, after the input item remains unread. If the length of
the input item is zero, the execution of the directive fails; this
condition is a matching failure unless end-of-file, an encoding error,
or a read error prevented input from the stream, in which case it is an
input failure.

However, Footnote 245 says the following:

245) fscanf pushes back at most one character onto the input stream.
Therefore some sequences that are acceptable to strtod, strtol, etc. are
unacceptable to fscanf.

So, although it SHOULD be non-consumptive, it MAY not in all cases,
although I haven't found one where it doesn't yet.

The standard also recommended the following method for looping through
stdin:

#include <stdio.h>
/* ... */
int count; float quant; char units[21]; char items[21];
do {
	count = fscanf(stdin, "%f%20s of %20s", &quant, units, items);
	fscanf(stdin, "%*[^n]"); /* This junks all input remaining */
} while (!feof(stdin) && !ferror(stdin));
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFD1HA78GGeAXLl3osRAuWHAKCAhXqVwMiQ2lC5NA+cdd1sg9g1vACZAZPi
HN0wUvcR8Hp2aw5PFmMJnVY=
=V96c
-----END PGP SIGNATURE-----
