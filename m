From: John Richard Moser <nigelenki@comcast.net>
Subject: Re: Garbage Collection and Swap
Date: Fri, 09 Jul 2004 23:10:55 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40EF5E3F.90401@comcast.net>
References: <40EF3BCD.7080808@comcast.net> <20040710023245.GE21066@holomorphy.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040710023245.GE21066@holomorphy.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: William Lee Irwin III <wli@holomorphy.com>
Cc: linux-kernel@vger.kernel.org, linux-c-programming <linux-c-programming@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



William Lee Irwin III wrote:
| On Fri, Jul 09, 2004 at 08:43:57PM -0400, John Richard Moser wrote:
|
|>Read that.  It's in all caps, so you should read it.  It has meaning.
|>How about, everything is using Bohem GC.  Bohem wanders around in the
|>heap concurrently.  So all of your applications are wandering around
|>through their vm space everywhere, continuously.
|>You get low on ram.  Let's say an app is using 500M of ram (Mozilla).
|>What's going to happen?  Obvious.  It's going to yank shit out of swap.
|>If we all linked against a GC, what kinds of swap hell do you think we'd
|>encounter?
|
|
| Ones almost as bad as the Hell of trolls going nuts over hypothetical
| problems no one is stupid enough to cause in practice anyway.
|
|

I'm actually trying to get the boehm one up, but it keeps setting PaX
off for some odd reason.  I'd intended to have some test data right
about now. . . . >/  Firefox, gimp, hell vim can't run with boehm
LD_PRELOAD to redirect malloc().  Nano can.  A simple tester can.
fortune can't.  BASH doesn't seem to like it.

It's only hypothetical until I prove or disprove it; and I'm not afraid
to do either.

| -- wli
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA7145hDd4aOud5P8RAkTCAJ9onJMZS5bFzu8ppfvyWg8vOE5SzQCeL5SR
NZPBU5gMs/ZSl0iXuJmvnYQ=
=UVWv
-----END PGP SIGNATURE-----
