From: "Earl R. Lapus" <elapus@ntsp.nec.co.jp>
Subject: error in system call
Date: Fri, 14 Jun 2002 13:51:23 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <LFEIJFMKHCJIHBFOGINPGELPCBAA.elapus@ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-prog <linux-c-programming@vger.kernel.org>

Mohammed Khalid Ansari wrote:

Hi,

I have seen many source code and almost all code conatain something like
this , if the system call fails, then print the error message and quit (eg
fork error, malloc error etc.)

####

if ((pid = fork()) < 0)
{
	perror ("fork error");
	exit (1);
}
####

That means, if the kernel can not fork or malloc the memory then the 
program will simply quit. Can it be not dangerous. Suppose this sort of 
programs in real time working fine as daemons but after some days, it 
happens that the kernel is not able to allocate the memory or fork, the 
program will simply quit. Is it not dangerous?

Instead can we not write the code in a better way like the following....

while ( (pid = fork()) < 0 );

in this case it will keep on trying to fork till it succeeds. Is that a 
true piece of code?

regards...
======================================================

::I think:: there is a limit to the number 
of child processes for each process.
if this limit is reached then the fork() call
would return an error. Therefore the code:

while ( (pid = fork()) < 0 );

would result to an infinite loop if 
such limit is reached.

>>I COULD BE WRONG WITH THIS<<

=========================
 ...what i want and what i need
 IS and WILL always be FREE...
=========================
