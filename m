From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: error in system call
Date: Fri, 14 Jun 2002 10:36:57 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0206141026520.19927-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux c programming mailing list <linux-c-programming@vger.kernel.org>


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

-- 

**************************************************************************

Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
Assistant Manager II                          (off) : 0091-022-2024641
National Centre for Software Technology   Fax       : 0091-022-2049573 
8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in 	
Mumbai 400021.

Homepage : http://soochak.ncst.ernet.in/~khalid			  	  

**************************************************************************

