From: Jesse Ruffin <jesse@ajp-services.net>
Subject: Re: Code critique: checking for syntax errors
Date: Sun, 22 Jan 2006 04:34:12 -0500
Message-ID: <43D35194.4050206@ajp-services.net>
References: <43D2870C.3030505@colannino.org>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43D2870C.3030505@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Overall this code is readable and consistent. The comments are well
placed and appropriately few. The structure does a good job of
implementing a stack. There are some places where your control
structures could be simplified or made a little easier to read. It's
clear that you are being explicit, and that is a very good practice.

However, there was one thing that caused compilation failure without
specifying some options, and more that caused warnings and bugs (only on
binary files though).

line 303:
| for (int count = 0; (character = fgetc(input)) != EOF; count++) {

If you can at all manage it, and most times you can, put all of your
variable declarations right at the beginning of the function. This also
implies moving your debug statements below them as they will be compiled
in sometime. Doing so will aid in portability to older, or more strict,
compilers. And try extra hard to avoid variable declarations in the loop
definition, as this is often seen as an error by compilers unless you
are using the C99 standard.

Multiple locations:
| if (ungetc(character, input) == NULL) {

ungetc() returns an EOF on error; NULL may, and often does, differ in
value. This causes the program to improperly report an unget error on
files with a NULL character in them. This happened to me when I ran the
program against an entire package I was writing; in particular, a .png
file. This isn't very bad in this case as it is not supposed to balance
png's. However, if it were meant to process binary files it would be a
serious bug.

Multiple locations:
| exit(1);

C defines two values, EXIT_SUCCESS and EXIT_FAILURE, that should be used
for the exit() value. These will pass the proper value to the host
environment. As that value may differ, you should use them to make your
code as portable as possible.

Once again, I think that this is good code overall. It's good to see
people being careful and using extra parenthesis and braces, rather than
hunting down logic bugs caused by a lack of them.

Jesse Ruffin
AJP Services
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFD01GUx26WdJ5m3EsRAhnLAJ9pZ4osq/jjNPNa7sHKrdWL53hIUACfbBVU
GRQlggDJtZfgShpOg5vKrKk=
=iIAt
-----END PGP SIGNATURE-----
