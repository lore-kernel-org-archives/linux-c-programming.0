From: John Richard Moser <nigelenki@comcast.net>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Thu, 01 Jul 2004 03:12:45 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40E3B96D.4080507@comcast.net>
References: <40E09FC4.50800@ig.com.br>	<16608.44836.384260.844173@cerise.nosuchdomain.co.uk>	<20040629143238.GD6335@luna.mooo.com>	<16609.43579.336662.194984@cerise.nosuchdomain.co.uk>	<20040630013316.GF9412@luna.mooo.com>	<40E32513.1090502@comcast.net> <16611.16213.876963.610967@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16611.16213.876963.610967@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: Micha Feigin <michf@post.tau.ac.il>, linux-c-programming <linux-c-programming@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Glynn Clements wrote:
| John Richard Moser wrote:
|
|
|>|>It doesn't matter. A #include directive simply inserts the contents of
|>|>the header file directly into the source code which is fed to the
|>|>compiler. The compiler doesn't care which file a given piece of code
|>|>comes from.
|>|>
|>|
|>| It is a problem since a header can be included more then once, and
|>
|>Umm.
|>
|>#import "foo.h"
|>
|>This includes only one time.  I'd only use this with Objective-C though.
|>
|>For C, and in general, you should use:
|>
|>#ifndef __FOO_H__
|>#define __FOO_H__
|>
|>....
|>
|>#endif /*__FOO_H__*/
|
|
| That only prevents against the header being included multiple times
| within a given compilation unit, which isn't the issue which was being
| discussed. The issue was that, if an lvalue is defined (as opposed to
| declared) in a header file, it will exist in every object file whose
| source code included the header.
|

yeah, externally linked rather than staticly linked.  If you declare
them static, they won't be associated with an object symbol, thus it's
like they don't exist in relation to linking multiple objects together.

It goes like this:

int foo; /*We can say 'extern int foo' somewhere and access this from
another compilation unit*/
static int bar; /*This we can't.*/

| The key point is that C++ appears to treat initialised "static const"
| members as compile-time constants, not as lvalues. Thus, they don't
| exist in any object file, and so the problem of them existing in
| multiple object files doesn't arise.

Actually, they're the same as regular consts; they just don't get an
exported symbol, so they're invisible to the other compilation units.
They STILL get a position in the data segment!

|
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA47lshDd4aOud5P8RAumVAJ9CmfPM1lUlOvDQjT3Dz8CG9ayg4QCZAekl
e5/IVRksVVq0HldmWYFDcv8=
=6vVS
-----END PGP SIGNATURE-----
