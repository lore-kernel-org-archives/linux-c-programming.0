From: "A. Murat Eren" <meren@comu.edu.tr>
Subject: Re: [Fwd: Re: Implementing a file counter (like "ls | wc")]
Date: Thu, 8 Apr 2004 11:05:13 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200404081105.13485.meren@comu.edu.tr>
References: <4074313A.5090808@ig.com.br> <200404090200.36787.meren@comu.edu.tr> <16500.55163.50294.74986@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16500.55163.50294.74986@cerise.nosuchdomain.co.uk>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


 Hi,

> "cd" isn't a program; it's a built-in shell command. It has to be; a
> process can't change the current directory of another process, so a
> "cd" program just wouldn't work.

 Sorry about that, yes cd is a built-in function of shell. btw, i'm not using 
it to change any program's working dir. i'm filling up my shell's current 
working dir environment variable with calling it to able to use commands like 
clone of ls without any extra parameter. So for example when i invoke my 
listing program to see what is in my current working directory, it already 
knows that i'm in /usr/src from the CWD envoriment var.

> In most of the situations where you use syscalls, you can't avoid
> using them; the point is not to use them excessively.
> 
> E.g. if you're reading a file (or any other descriptor), calling
> read() a few times and reading a large amount of data each time is
> more efficient than calling read() lots of times and reading a small
> amount of data each time.
> 
> Or, for an "ls" replacement, only call stat() (or lstat()) if you
> actually need the additional data (e.g. for "ls -l", "ls -F" etc)
> rather than always calling it "just in case".

 Thank you, i've got the point completely.
 
> There is seldom any point in bypassing libc. For a syscall, the libc
> function will usually consist of the syscall itself, plus setting
> errno if the syscall returns an error status, so there wouldn't be
> anything to gain from making the syscall directly.

 Thank you very much for your advices and time :)


 Regards.
-- 


- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
 A. Murat Eren
 meren@comu.edu.tr, evreniz@core.gen.tr
 http://zion.comu.edu.tr/~evreniz/
 0x88FD9FC7, 
 910A FCB3 2AAB 4CA5 E4D9 EFFA 6555 A33A 88FD 9FC7
- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

--
 free software is a matter of liberty,
 not price. to understand the concept,
 you should think of "free speech",
 not "free beer".
-
