From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: [Fwd: Re: Implementing a file counter (like "ls | wc")]
Date: 07 Apr 2004 21:01:47 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1081386105.20924.1.camel@Marx.fesnel.no-ip.org>
References: <4074313A.5090808@ig.com.br>
	 <1081356842.18677.23.camel@Marx.fesnel.no-ip.org>
	 <Pine.LNX.4.58.0404072202460.31808@praktifix.dwd.de>
	 <200404090200.36787.meren@comu.edu.tr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-V5iGRkM48/CAwEzZ5Rgw"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200404090200.36787.meren@comu.edu.tr>
List-Id: <linux-c-programming.vger.kernel.org>
To: jtwilliams@vt.edu
Cc: linux-c-programming@vger.kernel.org


--=-V5iGRkM48/CAwEzZ5Rgw
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I just want to say after much testing, I've gone and proved myself
wrong.  

Anyone interested in playing with the concept I've included the code. 



On Thu, 2004-04-08 at 22:00, A. Murat Eren wrote:
>  Hi,
> 
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
>  I'm not using the well-known programs such as 'ls', 'cd' etc.. i have my own 
> envoriment variables and my own basic programs those are invoking from my 
> prompt with fork and execvp. If i do not want to use the syscalls such as 
> readdir, opendir what i must do?
> 
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
> 
> 
>  Thanks for your time from now,
>  Regards.

--=-V5iGRkM48/CAwEzZ5Rgw
Content-Disposition: attachment; filename=ls.tgz
Content-Type: application/x-gzip; name=ls.tgz
Content-Transfer-Encoding: base64

H4sIAAakdEAAA+1YW0/bMBTua/IrzjrB0tJLkt4k2PawiyYe9gJoL2OqssSlHmlSxQ6sm/rfd47T
pAl06y4UNOEP2sT2l3PxcfwZQtGt7Rq23bdHgwFebXs0rF5XqDm23Rs4rjMa2jXbcYfuoAaDnUeG
SIX0EoDaF3nNw5B7M7GZt238P0UoujMmp3HgdPxd+bCxuMN+/2f1d3FwVX9nOOw5yO/3em4N7F0F
VMYjr/9THvlhGrDnYiG6cjFnojN9aRa9AU9YJLELzCqTz1iFSJ04k7LSmUZcyIC6EDyS5szjEVh4
B15y8boF/tRLmk1qfGjAd9N4c3wCTfQ5b0FTMiGPTIMo4H0WcZhK9hG3iE9559yT07xDyCT1JWTh
KhNjvEkWOETe/DjF7xdgr6mUwZUXApVftoBFwYormN+CGQ/XVMoLJjxkY7rLafwbO8K0jAsmyVY8
CbyFBfsre3YDB8mAP19YFGkL6l0m/W5dDfCJBU8syhSjiufonSeK1gD6wakw5gm6mVj1symDV2Ec
BwuVMXABUYwTqJL1ZZwsDmFPnEf1lhpH84bBvnJptR26X6K36ykGb0ExK+gzYV5APimE3OMq2nyy
S/ZoxJOlkcJU+2UwjrwZQ1q3uw6aisejiyKy/EllDZOn8VLmxbCKhAwVls4lJlykisaUCcMPY8Ho
UbKkupbAQsFUImp6qValiPeLAmZOiFY8ojxWXRK98EYGT8fHpydv31mFnY6Q41kcqKAVyVDL7OBA
PbI01Qd/i1DVXB/dXDL7OAXFemE+zgp2dOTVmBrtbH2ummgYF+aakd6gpIpjrqswZQnDt4vB3oCr
jLJqqDgps5zI8X2I40ssF+/s2SOuWPmL0DjC9BIm0ySiF2hpPvSepXF3KPTffTD9d0Z42Cv0317p
f0/r/31gi/5vlPWNB4BNJ4WK/v/ZAWCHyn9LzredCHAPVLvh7a17LfbwiMX+LBP721oPmdhvUeKK
3GO9wiB6VqpSJsKKlGXqbpT7X8qzYv2rPBt3ps93r9B/LdC4/7/3Lhl53tkes2X/t93133/9UX9A
+787cvT+fx/wwvAQ6ATgqG/XNFUj61P/FcD3wcdVHJdYWb9iujnTvcF0S/0mHdKrbgzVyC6u6YfM
iw5xEc+g2YmhPVG3Gb/UcLEBpj5/amhoaGhoaGhoaGhoaGhoaGhoaGj8Bn4Aym04vwAoAAA=

--=-V5iGRkM48/CAwEzZ5Rgw--

