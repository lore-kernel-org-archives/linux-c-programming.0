From: "A. Murat Eren" <meren@comu.edu.tr>
Subject: Re: [Fwd: Re: Implementing a file counter (like "ls | wc")]
Date: Thu, 8 Apr 2004 00:06:00 +0000 (UTC)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200404090200.36787.meren@comu.edu.tr>
References: <4074313A.5090808@ig.com.br> <1081356842.18677.23.camel@Marx.fesnel.no-ip.org> <Pine.LNX.4.58.0404072202460.31808@praktifix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Date: Fri, 9 Apr 2004 02:00:36 +0000
In-Reply-To: <Pine.LNX.4.58.0404072202460.31808@praktifix.dwd.de>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org


 Hi,

 I've read all of the mailing thread about this subject and i'd like to ask 
some questions..

> But most important always try to avoid system calls!

 I guess eveybody is accepting that the syscalls is slowing down the process 
when invoking them from the critical parts of the code (i hope i understand 
properly).. I'm trying to write a basic shell for me (just for fun, nothing 
serious), i'm setting up my user's shell in passwd file to my basic shell's 
compiled binary, and when i'm logging in from the console, normally i'm 
falling to a prompt which is written by me.

 I'm not using the well-known programs such as 'ls', 'cd' etc.. i have my own 
envoriment variables and my own basic programs those are invoking from my 
prompt with fork and execvp. If i do not want to use the syscalls such as 
readdir, opendir what i must do?

 With readdir, i can read everything from the every type of file system which 
supported by kernel *transparently*, for example when i'm working on a disk 
partition which is formatted with ext3 file system i don't have to try to 
read the superblocks and inode's adresses from disk because VFS takes care 
all of the low level operations via readdir (and kernel's modules for that 
file system) for me, isn't it? If i want to do all of them by my self (sure, 
this is not necessary but i just want to try and learn) which is the right 
way i have to go? I thought that it would be a very simple and absolute way 
looking into the glibc for implementations of the functions like readdir, but 
nearly i'm sure that it would be impossible to undrstand (and this is another 
problem, i can't understand the source code usually :( it would be great to 
hear your advices about how i improve my vision).


 Thanks for your time from now,
 Regards.
-- 


- -- -- -- -- -- -- -- -- -- -- -- -- -- -
 A. Murat Eren
 meren@comu.edu.tr, evreniz@core.gen.tr
 http://zion.comu.edu.tr/~evreniz/
- -- -- -- -- -- -- -- -- -- -- -- -- -- -

--
 free software is a matter of liberty,
 not price. to understand the concept,
 you should think of "free speech",
 not "free beer".
-
