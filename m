From: Andrew Edmondson <inbox@andy.co.uk>
Subject: Running make seems to be crashing my computer.
Date: Thu, 2 May 2002 22:17:48 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <02050222174801.01065@localhost.localdomain>
Reply-To: inbox@andy.co.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Does anyone know of anything dangerous running make 3.79.1 at all? After I 
try to make some software I'm writing my PC crashes and re-boots. It's not 
the software that's the problem since I am not able to run it yet, I'm 
integrating some new changes.

Is there anything within a Makefile that could cause problems? It's 
definately running make that's the problem because I am not running anything 
else that I don't run for hours at a time during normal use. 

At the re-boot I had the message:

74 Segmentation fault
	initlog -c "fsck -T -a $fsckoptions /"

And while checking the filesystems:

bash: error loading shared libraries; Version GLIBC_2.0 not defined in file 
libc.so.6 with linktime reference.



Does anyone have any ideas?



Andrew
-- 

for x in *; do echo go on\!; sleep 1;done; echo Have a cup of tea\!
