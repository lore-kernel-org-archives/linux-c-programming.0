From: John Richard Moser <nigelenki@comcast.net>
Subject: Viability of a New Allocator
Date: Thu, 24 Jun 2004 02:34:06 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40DA75DE.4020106@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org, linux-gcc@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I've been trying to circulate a new idea for a new allocator for some
time now, to replace the current glibc allocator.  It would leave behind
the heap in favor of complex mmap()ing to create what is best described
as a virtual virtual heap-- a completely noncontiguous virtual heap that
acts as a contiguous virtual heap that acts as a real heap.  For our
purposes, we will call a real heap a "real heap," and a virtual virtual
heap "the heap" or just "heap."

The advantages of this are many, mainly that unused pages can be
returned to the system and that memory fragmentation would be reduced in
severity.  The disadvantages are that the code would be more complex.

Any unused, allocated area of memory that touches or crosses a page
boundary is infinite in size under this scheme, and so can be expanded
and utilized, reducing the impact of heap fragmentation.

I believe that this would not only give less memory usage; but also
increase the speed of allocations.  Allocations could be done by
checking the largest finite size unused segment of existing allocations,
and if it's smaller than what you need, using an infinite size fragment.
~   Seaching out an unused, allocated segment to fit an allocation call
would be a shorter operation, because all page-aligned and page-crossing
unused fragments are of inifinite size; and so if a finite size fragment
exists that fits what is needed, it will be found in a smaller, possibly
much smaller list.

The idea was first developed on a bug posted to the Red Hat Sources
Bugzilla; and later refined in a blog, and posted in a Red Hat Linux
Bugzilla bug, and also to libc-alpha.  Those links are as follows:

http://sources.redhat.com/bugzilla/show_bug.cgi?id=167
http://bluefoxicy.blogspot.com/2004_05_01_bluefoxicy_archive.html#108507154064758877
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=123965
http://sources.redhat.com/ml/libc-alpha/2004-05/msg00216.html

I have no idea how to implement this, although from what I gather it is
feasible.  I believe but can not guarantee that it will give the returns
I expect.  Is anyone interested in this at all?  I don't have the skill
to code it, but if someone could find someone to code it or at least
confirm that it should behave as expected, I'd be grateful.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA2nXahDd4aOud5P8RAuFpAJ9wldF6eEe12w0QUS9jHmmTK6DoaQCdEjDl
aT3XERefzLEHZ57jtgPU2FA=
=gZ2e
-----END PGP SIGNATURE-----
