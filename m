From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: [Fwd: Re: Implementing a file counter (like "ls | wc")]
Date: Thu, 8 Apr 2004 05:39:23 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16500.55163.50294.74986@cerise.nosuchdomain.co.uk>
References: <4074313A.5090808@ig.com.br>
	<1081356842.18677.23.camel@Marx.fesnel.no-ip.org>
	<Pine.LNX.4.58.0404072202460.31808@praktifix.dwd.de>
	<200404090200.36787.meren@comu.edu.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200404090200.36787.meren@comu.edu.tr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "A. Murat Eren" <meren@comu.edu.tr>
Cc: Holger Kiehl <Holger.Kiehl@dwd.de>, linux-c-programming@vger.kernel.org


A. Murat Eren wrote:

>  I've read all of the mailing thread about this subject and i'd like to ask 
> some questions..
> 
> > But most important always try to avoid system calls!
> 
>  I guess eveybody is accepting that the syscalls is slowing down the process 
> when invoking them from the critical parts of the code (i hope i understand 
> properly).. I'm trying to write a basic shell for me (just for fun, nothing 
> serious), i'm setting up my user's shell in passwd file to my basic shell's 
> compiled binary, and when i'm logging in from the console, normally i'm 
> falling to a prompt which is written by me.
> 
>  I'm not using the well-known programs such as 'ls', 'cd' etc.

"cd" isn't a program; it's a built-in shell command. It has to be; a
process can't change the current directory of another process, so a
"cd" program just wouldn't work.

>. i have my own 
> envoriment variables and my own basic programs those are invoking from my 
> prompt with fork and execvp. If i do not want to use the syscalls such as 
> readdir, opendir what i must do?

In most of the situations where you use syscalls, you can't avoid
using them; the point is not to use them excessively.

E.g. if you're reading a file (or any other descriptor), calling
read() a few times and reading a large amount of data each time is
more efficient than calling read() lots of times and reading a small
amount of data each time.

Or, for an "ls" replacement, only call stat() (or lstat()) if you
actually need the additional data (e.g. for "ls -l", "ls -F" etc)
rather than always calling it "just in case".

>  With readdir, i can read everything from the every type of file system which 
> supported by kernel *transparently*, for example when i'm working on a disk 
> partition which is formatted with ext3 file system i don't have to try to 
> read the superblocks and inode's adresses from disk because VFS takes care 
> all of the low level operations via readdir (and kernel's modules for that 
> file system) for me, isn't it? If i want to do all of them by my self (sure, 
> this is not necessary but i just want to try and learn) which is the right 
> way i have to go? I thought that it would be a very simple and absolute way 
> looking into the glibc for implementations of the functions like readdir, but 
> nearly i'm sure that it would be impossible to undrstand (and this is another 
> problem, i can't understand the source code usually :( it would be great to 
> hear your advices about how i improve my vision).

There is seldom any point in bypassing libc. For a syscall, the libc
function will usually consist of the syscall itself, plus setting
errno if the syscall returns an error status, so there wouldn't be
anything to gain from making the syscall directly.

BTW, on Linux, glibc's readdir() function isn't implemented using the
readdir syscall but using the getdents syscall instead. The latter
reads multiple directory entries per call, so is more efficient.

You can't realistically bypass the syscalls themselves; not only would
trying to read files by accessing the device directly require
sufficient privilege, it would also be error-prone, as a user-space
process can't hold kernel locks and can't prevent itself being
preempted at an inconvenient point.

-- 
Glynn Clements <glynn.clements@virgin.net>
