From: Martin Olsson <mnemo@minimum.se>
Subject: Re: mktemp()
Date: Sun, 06 Jun 2004 11:50:11 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40C2E8D3.8060102@minimum.se>
References: <20040605093054.A613@Imrashi.net.bd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040605093054.A613@Imrashi.net.bd>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org


Imagine two processes using first mktemp() and later on open(). The 
first one checks if there a file called "abc112233" and there is no such 
file, now the second process does the same check and there is still no 
such file. Both processes now thinks its okay to use that filename.

Now two things can happen:

A) Process one writes its data to the file and closes it, followed by 
process two writing its data to the same file (overwriting it). Here the 
data written by process one is lost.

B) Process one writes and while its writing the second process tries to 
write and gets an error. Here process two doesnt get its data written.


In a server with many threads these collisions actually *do* happen in 
reality even if they seem a little obscure at first.



mvh.
/m

Progga wrote:

> 
>  Is mktemp() a deprecated function ?  The compiler ( actually the linker ) is 
> repeatedly shouting -
> 
>  "warning: mktemp() possibly used unsafely; consider using mkstemp()"
> 
> 
>  The manpage of mktemp(3) states -
> 
> -------
> A common problem that results in a core dump is that the programmer
> passes in a read-only string to mktemp(), mkstemp(), mkstemps() or
> mkdtemp().
> ------
> 
>  - and I have taken care of this.
> 
> 
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
>  I haven't used open() and hence there's no O_EXCL.  Is it causing the warning ?
> I also can't understand how an attacker can dupe the process into writing in
> his intended file since mktemp() is supposed to return those names only that are
> currently UNUSED.
> 
> 
> 
>  Khoda Hafez
>  Progga
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
