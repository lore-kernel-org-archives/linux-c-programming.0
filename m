From: John Richard Moser <nigelenki@comcast.net>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Wed, 30 Jun 2004 16:39:47 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40E32513.1090502@comcast.net>
References: <40E09FC4.50800@ig.com.br> <16608.44836.384260.844173@cerise.nosuchdomain.co.uk> <20040629143238.GD6335@luna.mooo.com>	 <16609.43579.336662.194984@cerise.nosuchdomain.co.uk> <20040630013316.GF9412@luna.mooo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040630013316.GF9412@luna.mooo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Micha Feigin <michf@post.tau.ac.il>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Micha Feigin wrote:
| On Tue, Jun 29, 2004 at 06:43:23PM +0100, Glynn Clements wrote:
|
|>It doesn't matter. A #include directive simply inserts the contents of
|>the header file directly into the source code which is fed to the
|>compiler. The compiler doesn't care which file a given piece of code
|>comes from.
|>
|
| It is a problem since a header can be included more then once, and

Umm.

#import "foo.h"

This includes only one time.  I'd only use this with Objective-C though.

For C, and in general, you should use:

#ifndef __FOO_H__
#define __FOO_H__

....

#endif /*__FOO_H__*/
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA4yUShDd4aOud5P8RAkoxAJ9mYFKq+MYzPsX+LGbg/iTDA+UFqQCfYnMv
2Tn7bkzzlPu66jmrOamHJW8=
=nfHE
-----END PGP SIGNATURE-----
