From: Jesse Ruffin <jesse@ajp-services.net>
Subject: Re: Code critique: checking for syntax errors
Date: Mon, 23 Jan 2006 19:44:35 -0500
Message-ID: <43D57873.10005@ajp-services.net>
References: <43D2870C.3030505@colannino.org> <43D35194.4050206@ajp-services.net> <43D532D6.9050204@colannino.org> <43D55A90.7030501@ajp-services.net> <43D55FEB.2070909@colannino.org>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43D55FEB.2070909@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

James Colannino wrote:
|
| What's weird about that is that in order to do variable declarations
| within the definition of a for loop, I need to pass -std=c99 to GCC.
| However, I don't need to do that in order to simply declare variables
| later in the function.  That would lead me to believe that C99 is not
| required to do so.  Could it possibly be a C89 thing?  How far back is
| considered ANSI C?
|

The gcc compiler by default uses -std=gnu89, which is C89 (which is the
ANSI/ISO standard) plus extensions. One of them is this:

| ISO C99 and ISO C++ allow declarations and code to be freely mixed
| within compound statements.  As an extension, GCC also allows this in
| C89 mode.  For example, you could do:
|
|      int i;
|      /* ... */
|      i++;
|      int j = i + 2;

However, this does not extend to variables in loop declarations. C99
does allow declarations in loops, but C89 requires declarations with
constant expressions only before any evaluated expression.

If you want to see gcc do ANSI c, try:

gcc -Wall -ansi -pedantic

The pedantic is necessary to get some extra warnings about ANSI issues.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFD1Xhz8GGeAXLl3osRAsQ6AKCJcs/9ozAQvbCJ/YLd2ZHbLiA1CQCfcjxm
XWnVeMnOw5Z6OREybtXpZpE=
=3zmi
-----END PGP SIGNATURE-----
