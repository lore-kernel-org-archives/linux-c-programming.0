From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: mktemp()
Date: Sat, 5 Jun 2004 05:55:26 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16577.21054.198004.325948@cerise.nosuchdomain.co.uk>
References: <20040605093054.A613@Imrashi.net.bd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040605093054.A613@Imrashi.net.bd>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Progga <abulfazl@juniv.edu>
Cc: linux-c-programming@vger.kernel.org


Progga wrote:

> Is mktemp() a deprecated function ?

That's a matter of opinion. It's a potential security risk, and safer
alternatives are available.

> The compiler ( actually the linker ) is 
> repeatedly shouting -
> 
>  "warning: mktemp() possibly used unsafely; consider using mkstemp()"

By "unsafe", it's referring to the potential security issues, i.e. a
race condition.

>  The manpage of mktemp(3) states -
> 
> -------
> A common problem that results in a core dump is that the programmer
> passes in a read-only string to mktemp(), mkstemp(), mkstemps() or
> mkdtemp().
> ------

That isn't why it's complaining.

>  The manpage also says -
> 
> ------
> BUGS
>      This family of functions produces filenames which can be guessed, though
>      the risk is minimized when large numbers of `Xs' are used to increase the
>      number of possible temporary filenames.  This makes the race in mktemp(),
>      between testing for a file's existence (in the mktemp() function call)
>      and opening it for use (later in the user application) particularly dan-
>      gerous from a security perspective.  Whenever it is possible, mkstemp()
>      should be used instead, since it does not have the race condition.  If
>      mkstemp() cannot be used, the filename created by mktemp() should be cre-
>      ated using the O_EXCL flag to open(2) and the return status of the call
>      should be tested for failure.  This will ensure that the program does not
>      continue blindly in the event that an attacker has already created the
>      file with the intention of manipulating or reading its contents.
> ------
> 
> I haven't used open() and hence there's no O_EXCL.  Is it causing the warning ?
> I also can't understand how an attacker can dupe the process into writing in
> his intended file since mktemp() is supposed to return those names only that are
> currently UNUSED.

The risk is that, if you don't use O_EXCL, an attacker could create a
symlink between the point that mktemp() returns and the point that you
call open/fopen/etc, causing you to overwrite the target of the
symlink.

-- 
Glynn Clements <glynn.clements@virgin.net>
