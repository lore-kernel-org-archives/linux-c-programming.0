From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: soft real-time scheduling
Date: Sun, 26 Sep 2004 15:08:31 +0100 (BST)
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <20040926140831.62007.qmail@web52901.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <gcc-help-return-18041-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>
Cc: gcc <gcc-help@gcc.gnu.org>

hi

 /* soft realtime scheduling variable */
   struct sched_param *p;


 /* set soft real-time scheduling */
   sched_getparam(0,p);
   p->sched_priority = 50;
   if (sched_setscheduler(0,SCHED_FIFO,p))
     fprintf(stderr,"Could not change scheduler
settings\n");

if anyone knows about this then i need some help

p is a pointer to the structure sched_param which is
defined in sched.h

this structure has a variable __sched_priority where i
have to set the priority of the process

p->sched_priority =50 this line gives a segmentation
fault. 
how t oaccess this variable (__sched_priority) of the
header file

thanks

ankit

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
