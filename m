From: Tabris <tabris@tabris.net>
Subject: Re: Multithreaded /sbin.init? Is it possible?
Date: Mon, 15 Sep 2003 12:49:27 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200309151249.29525.tabris@tabris.net>
References: <200309141240.55800.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200309141240.55800.eric@cisu.net>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: eric@cisu.net, linux-newbie@vger.kernel.org, linux-c-programming@vger.kernel.org
Cc: rei_0000@arklinux.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sunday 14 September 2003 01:40 pm, Eric wrote:
> Hello,
> 	I have an interesting theory. I have beginning programming expereice
> and would like the input of those that have more expereince than me.
> Please don't flame if this is a waste of time. Rather I would like an
> open discussion on the why's and why nots of this.
> 	Wouldn't the Linux Boot process be speeded up if the init program was
> multithreaded? I know a little about threads.. and I think there might
> be some complication of PPID assignment coming from the threads which
> would probably terminate instead of having a PPID of 1 which is init
> and will never terminate. (i think?). Should init scripts have a parent
> PID of 1? Does this even matter?
> 	If I am correct, whenever a programs parent dies, its parent becomes
> init anyways. So when the thread finishes execution of the script, then
> its parent would become init just as if it had started sequentially and
> directly from init.
> 	The script links in /etc/rc.d/x.d/ would be grouped according to their
> S and K numbers. That is, if you have 5 scripts that are S5, each would
> be given to a thread to execute and there would be 5 threads. The init
> process would wait for each thread to clean up before proceeding to the
> next group. I know this would happen in an undefined order, but if you
> want, for example, DHCPD to start after network then you would assing
> S5network and S6dhcpd. There would still be a defined order for
> differently numbered scripts, just the bootup process wouldnt have to
> wait for each script to terminate sequentially. Each group would only
> take as long and the slowest script instead of the sum of the execution
> time of the scripts. The init would start with the S1 scripts and maybe
> fork 3 times, wait for each to finish...., then fork maybe twice for
> the S2 group if there are two scripts, wait for them to
> finish...etc....
> 	Is this even possible?
> ----------------------
> Eric Bambach
> Eric (at) CISU (dot) net
> ----------------------
Fwiw, there is a project ongoing with this very concept in arklinux, and 
it HAS shown some improvements in boot speed. I don't know exactly how 
much, but the goal is to boot (get to a login screen) in under 30 seconds 
on a desktop type system.

cc:d to the current project maintainer.

- --
tabris
- -- 
Space tells matter how to move and matter tells space how to curve.
		-- Wheeler
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/Ze2YtTgrITXtL+8RAiKdAJ9+3AnkmMdbRiWIwUIP6EYxzAymVACbBAkQ
KWUtU3Gu9+cjcc5jg668pAs=
=gRe5
-----END PGP SIGNATURE-----

