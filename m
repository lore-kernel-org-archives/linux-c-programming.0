From: Progga <abulfazl@juniv.edu>
Subject: mktemp()
Date: Sat, 5 Jun 2004 09:30:54 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040605093054.A613@Imrashi.net.bd>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org



 Is mktemp() a deprecated function ?  The compiler ( actually the linker ) is 
repeatedly shouting -

 "warning: mktemp() possibly used unsafely; consider using mkstemp()"


 The manpage of mktemp(3) states -

-------
A common problem that results in a core dump is that the programmer
passes in a read-only string to mktemp(), mkstemp(), mkstemps() or
mkdtemp().
------

 - and I have taken care of this.


 The manpage also says -

------
BUGS
     This family of functions produces filenames which can be guessed, though
     the risk is minimized when large numbers of `Xs' are used to increase the
     number of possible temporary filenames.  This makes the race in mktemp(),
     between testing for a file's existence (in the mktemp() function call)
     and opening it for use (later in the user application) particularly dan-
     gerous from a security perspective.  Whenever it is possible, mkstemp()
     should be used instead, since it does not have the race condition.  If
     mkstemp() cannot be used, the filename created by mktemp() should be cre-
     ated using the O_EXCL flag to open(2) and the return status of the call
     should be tested for failure.  This will ensure that the program does not
     continue blindly in the event that an attacker has already created the
     file with the intention of manipulating or reading its contents.
------

 I haven't used open() and hence there's no O_EXCL.  Is it causing the warning ?
I also can't understand how an attacker can dupe the process into writing in
his intended file since mktemp() is supposed to return those names only that are
currently UNUSED.



 Khoda Hafez
 Progga



