From: John Richard Moser <nigelenki@comcast.net>
Subject: Objective-C Objects and Locking
Date: Tue, 06 Jul 2004 15:17:46 -0400
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <40EAFADA.3040807@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-gcc-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org, linux-gcc@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I'm writing up my own objective-c framework, something to use in place
of OpenStep/Cocoa/etc.  So, I'm in complete control of what happens with
my base object, SVObject (which ironically inherits from Object :).

I'm attempting to implement a swizzling subsystem which allows any
SVObject inheriting object to dynamicly handle swizzle requests safely
and effectively.  Because I want to work in a threaded environment, I
need to lock properly.

What I'm thinking is to use a mutex lock around all members that may not
run during a swizzle and deflect in-swizzle calls to the new swizzle
master.  The current logic I'm pondering is:

- -(void) someMemberThatIsAffected {
~  if ([my_swizzle_lock tryReadLock]) { /*Can we lock?*/
~    /*
~     * We couldn't lock, so we wait for the swizzle lock to become
~     * unlocked, then send the message to whatever swizzled us.
~     */
~    [my_swizzle_lock readLock];
~    [my_swizzle_master someMemberThatIsAffected];
~  }
~  else { /*Or we just complete*/
~    ...
~  }
~  [my_swizzle_lock unlock];
}

A swizzle would -writeLock my_swizzle_lock, so this would detect the lock.

Here's the issue I have:  Looking at this logic, if the entire swizzle
is done between the actual message passing call and the -tryReadLock,
which is quite plausible in an SMP situation, this will fail to detect.
~ Also, the new object may want to pass messages down to this object, so
I can't just feed all messages upwards.

I don't want to abandon the idea of supplying simplistic swizzling;
however, I would have to detect in-progress swizzles reliably.  I can't
think of anything to atomicize, and don't know how to make chunks of
code atomic anyway.

Any thoughts?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA6vrZhDd4aOud5P8RAqioAKCOswm5y2OM0ShzROOXvR5R2BEC6QCfW6hQ
Sf/+aJXpdPUkBDsmq3zcJig=
=PyRP
-----END PGP SIGNATURE-----
