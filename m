From: "Singh, Umesh K (MED)" <Umesh.Singh@geind.ge.com>
Subject: RE: error in system call
Date: Fri, 14 Jun 2002 10:37:41 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1C82B8CC4567D51197A600508B62C130065BD0DB@ban04xbindge.geind.ge.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux c programming mailing list <linux-c-programming@vger.kernel.org>
Cc: Mohammed Khalid Ansari <khalid@ncst.ernet.in>

simply depends upon the requirement.
-us

-----Original Message-----
From: Mohammed Khalid Ansari [mailto:khalid@ncst.ernet.in]
Sent: Friday, June 14, 2002 10:37 AM
To: linux c programming mailing list
Subject: error in system call



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

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


"THIS E-MAIL MESSAGE ALONG WITH ANY ATTACHMENTS IS INTENDED ONLY FOR THE
ADDRESSEE and may contain confidential and privileged information.
If the reader of this message is not the intended recipient,
you are notified that any dissemination, distribution or copy of this 
communication is strictly Prohibited. 
If you have received this message by error, please notify us 
immediately, return the original mail to the sender and delete the 
message from your system."

