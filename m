From: Paul Jackson <pj@sgi.com>
Subject: Re: sprintf with mips
Date: Tue, 12 Feb 2008 10:31:37 -0600
Message-ID: <20080212103137.c74196c4.pj@sgi.com>
References: <20080210222559.17830@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20080210222559.17830@gmx.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Stalp <christian.stalp@gmx.de>
Cc: linux-c-programming@vger.kernel.org

Does the problem go away if you replace:
	char insertvalues[256];
with something like:
	char xx[512];
	char *insertvalues = xx+128;

If that makes the problem go away, try adding additional checking
code, that puts a distinct guard pattern on both sides of the
256 payload bytes, and checks that pattern for corruption on each
iteration of the while loop.

If the "works on x86 but not mips" is not helping you solve this,
then -ignore- that detail.  This is similar to the "worked before,
but not now, and I only changed such-and-such".  Sometimes such clues
are reality giving you a head fake.  Instead, just debug the mips case,
as if it were all you knew.  In this particular case, you could explain
the x86 vs mips difference with the hypothesis that since the memory
and stack layout are different, perhaps there is a long standing bug
on both architectures that only happens to manifest itself on the
mips architecture.  But you don't need any such explaination -- always
try ignoring such 'strange coincidences' if they are blocking you.

Does this fail sometimes on the -very- first iteration of the
"while(1)" loop, or always sometimes later.

Could some other thread be trampling insertvalues[]?

Could the following line trample insertvalues[]:
	insertinto(dbName, conn, tabellename, insertvalues);

-- 
                  I won't rest till it's the best ...
                  Programmer, Linux Scalability
                  Paul Jackson <pj@sgi.com> 1.940.382.4214
