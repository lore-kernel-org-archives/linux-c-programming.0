From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: problem in open sys call
Date: Tue, 20 Apr 2004 21:06:06 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16517.33454.650019.399163@cerise.nosuchdomain.co.uk>
References: <40856C8C.9090003@sancharnet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40856C8C.9090003@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gracecott@sancharnet.in
Cc: linux-c-programming@vger.kernel.org


joy wrote:

> I have a small prblem i the open call. it fails every time and I dont 
> know why.

> const char opcode[]="opcode.sheet";

> 	char buff[8192],temp[10],bin=0,opcode[3];
==>	                               ^^^^^^

> 	if((fd=open(opcode, O_RDONLY))==-1)
> 		printf("oops");

In the open() call, the variable "opcode" refers to the local variable
of that name, which will be uninitialised, and not the global variable
which actually contains your filename.

Running your program under strace or a debugger would show that the
filename which is passed to open() isn't what you are expecting.

-- 
Glynn Clements <glynn.clements@virgin.net>
