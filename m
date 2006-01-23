From: Jesse Ruffin <jesse@ajp-services.net>
Subject: Re: Code critique: checking for syntax errors
Date: Mon, 23 Jan 2006 17:37:04 -0500
Message-ID: <43D55A90.7030501@ajp-services.net>
References: <43D2870C.3030505@colannino.org> <43D35194.4050206@ajp-services.net> <43D532D6.9050204@colannino.org>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43D532D6.9050204@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

James Colannino wrote:
| Do stricter and older compilers complain if variables aren't declared at
| the beginning of the function?
| Actually, I was banking on the C99 standard (I guess perhaps it would
| have been wise for me to say so when I posted the code.)

If you are using a C99 compiler it won't, but older C specifications do
not allow variable definition anywhere but the beginning or between the
function declaration and definition (K&R style). Although C99 is gaining
a lot of ground, I believe that there still are some compilers that
don't support it at all, and many that don't by default.

| I can understand EXIT_FAILURE, but why do all the C books tell you to
| return 0 instead of EXIT_SUCCESS?  I always thought that both return()
| and exit() did the same basic thing, so I'm confused as to why a book
| teaching how to write portable code would say to simply use 0 (that's
| with return() and not exit().)  I have implemented exit(EXIT_FAILURE)
| instead of exit(1).

The man page for exit has this to say about EXIT_*:

| The  use of EXIT_SUCCESS and EXIT_FAILURE is slightly more portable (to
| non-Unix environments) than that of 0 and some non-zero value like 1 or
| -1. In particular, VMS uses a different convention.

and the info pages on exit vs. return:

| A process terminates normally when its program signals it is done by
| calling `exit'.  Returning from `main' is equivalent to calling `exit',
| and the value that `main' returns is used as the argument to `exit'.

Hope that helps a bit.
Also, #defines are almost always better than hard coded values. If
nothing else they're more readable, and often centralize changes.

Jesse Ruffin
AJP Services
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFD1VqQ8GGeAXLl3osRApXRAJ9k1BzmmmB5prkONd2YDTn064lHewCfcZ5m
S9uAmyjy7LXnYpDmp92H04o=
=l0AT
-----END PGP SIGNATURE-----
