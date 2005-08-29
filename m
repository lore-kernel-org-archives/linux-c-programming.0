From: "Sagar Shinde" <sagar.shinde@patni.com>
Subject: Error in Makefile for multiple files
Date: Mon, 29 Aug 2005 20:38:05 +0530
Message-ID: <EGEELICONHJFEACGEOAICEPCCJAA.sagar.shinde@patni.com>
Reply-To: <sagar.shinde@patni.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1125328380-25608-219"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format...

------------=_1125328380-25608-219
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi all,

I have a module with 3 C files: smarthook.c restore.c backup.c

My Makefile code is:
-----------------------------------------------------
INCLUDEDIR = /usr/src/kernels/linux-2.6.12.1/include

CFLAGS = -D__KERNEL__ -DMODULE
CFLAGS += -I$(INCLUDEDIR)

TARGET = smarthook
OBJS = $(TARGET).o
SRC = smarthook.c backup.c restore.c

all: .depend $(TARGET).o

$(TARGET).o: $(SRC:.c=.o)
	$(LD) -r $^ -o $@

depend .depend dep:
	$(CC) $(CFLAGS) -M *.c > $@
-----------------------------------------------------

now though I am giving proper dependencies
 why am I not able to access global variables defined in one file
(smarthook.c)
 from other files, inspite of these variables being declared extern in other
files.

any suggestions?

Thanks in Advance.

Thanks n Regards,
Sagar Shinde









http://www.patni.com
World-Wide Partnerships. World-Class Solutions.
_____________________________________________________________________

This e-mail message may contain proprietary, confidential or legally
privileged information for the sole use of the person or entity to
whom this message was originally addressed. Any review, e-transmission
dissemination or other use of or taking of any action in reliance upon
this information by persons or entities other than the intended
recipient is prohibited. If you have received this e-mail in error
kindly delete  this e-mail from your records. If it appears that this
mail has been forwarded to you without proper authority, please notify
us immediately at netadmin@patni.com and delete this mail. 
_____________________________________________________________________

------------=_1125328380-25608-219--
