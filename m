From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Why does linking a.so with b.so require execs to be linked both
 -la and -lb?
Date: Tue, 12 Aug 2003 18:54:05 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16185.10685.979954.655332@cerise.nosuchdomain.co.uk>
References: <m3k79jj4av.fsf@bfnet.com>
	<tmml01xphg.ln2@thune.mrc-home.org>
	<m3vft320sv.fsf@bfnet.com>
	<16184.61520.502240.104624@cerise.nosuchdomain.co.uk>
	<m3r83qzv2j.fsf@bfnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <m3r83qzv2j.fsf@bfnet.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Wuertele <dave-gnus@bfnet.com>
Cc: linux-c-programming@vger.kernel.org


David Wuertele wrote:

> Glynn> One consequence of this difference is that Linux allows an
> Glynn> executable to export symbols to a library. Thus you can create
> Glynn> a library with unresolved references (i.e. symbols not provided
> Glynn> by either the library or any of it's explicit dependencies). So
> Glynn> long as that symbol actually gets provided at run-time (e.g. by
> Glynn> the executable itself), everything works.
> 
> Does this "flexibility" have practical applications?

I have encountered uses of this in the past, but I can't recall any
specifics. Ultimately, you can always achieve the same effect by
having the application register callbacks with the library.

> Glynn> In any case: if you need libB.so to actually run the
> Glynn> executable, why does it matter if you need it in order to link
> Glynn> the program?
> 
> Encapsulation and portability.  We're writing a toolkit that isolates
> the programmer from the underlying implementation.  Requiring the
> programmer to explicitly link to the underlying library requires that
> the programmer know what that underlying library is.  Also, it
> prevents us from changing the underlying library.  These goals don't
> seem that unreasonable to us, and they are very important for our
> application.

The programmer doesn't *explicitly* link to the library; an
application will typically only link against the "topmost" library
(libA in your example), and the resulting executable will only have a
direct dependency (one which is actually stored in the executable)
upon that library.

In order for the link step to succeed, the library which is explicitly
referenced has to exist. If that library has any dependencies, they
must also exist at link time, but the information won't be encoded
into the executable (ldd will show the transitive dependencies, but
they aren't stored in the executable; if you hide the direct
dependencies, the transitive dependencies will disappear from the ldd
output).

E.g. if an application links with -lgtk, libgtk must exist; if the
implementation uses libX11, that must also exist, and so on. However,
the executable will only contain a dependency upon libgtk, not upon
libX11. You could transfer the executable to a system where the libgtk
implementation uses the framebuffer API instead of X11, and it should
still work.

Sometimes shared libraries are built without dependency information. 
In that case, the executable has to explicitly link against the
dependencies, otherwise you would end up with unresolved symbols at
run-time. However, omitting dependency information could be considered
a bug (for your purposes, it would definitely be a bug).

Finally, if you want to be able to build executables which use libA,
but are unable or unwilling to supply a specific libB, you could
supply a "stub" library (one which provides functions which do
nothing). Obviously, such a library would have no dependencies.

-- 
Glynn Clements <glynn.clements@virgin.net>
