From: David Wuertele <dave-gnus@bfnet.com>
Subject: Re: Why does linking a.so with b.so require execs to be linked both
 -la and -lb?
Date: Tue, 12 Aug 2003 09:42:28 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <m3r83qzv2j.fsf@bfnet.com>
References: <m3k79jj4av.fsf@bfnet.com> <tmml01xphg.ln2@thune.mrc-home.org>
 <m3vft320sv.fsf@bfnet.com>
 <16184.61520.502240.104624@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Thanks Glynn, for the excellent explanation!

Glynn> So, what you are asking is why Linux requires the indirect
Glynn> dependencies to be present at link time, right?

Exactly.

Glynn> One consequence of this difference is that Linux allows an
Glynn> executable to export symbols to a library. Thus you can create
Glynn> a library with unresolved references (i.e. symbols not provided
Glynn> by either the library or any of it's explicit dependencies). So
Glynn> long as that symbol actually gets provided at run-time (e.g. by
Glynn> the executable itself), everything works.

Does this "flexibility" have practical applications?

Glynn> In any case: if you need libB.so to actually run the
Glynn> executable, why does it matter if you need it in order to link
Glynn> the program?

Encapsulation and portability.  We're writing a toolkit that isolates
the programmer from the underlying implementation.  Requiring the
programmer to explicitly link to the underlying library requires that
the programmer know what that underlying library is.  Also, it
prevents us from changing the underlying library.  These goals don't
seem that unreasonable to us, and they are very important for our
application.

Dave

