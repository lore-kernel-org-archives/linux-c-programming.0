From: =?iso-8859-1?q?will=20fitzgerald?= <linux_learning@yahoo.co.uk>
Subject: important how to stop interrupts and start them again after finishing what you wanted to do??
Date: Tue, 5 Nov 2002 17:35:55 +0000 (GMT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021105173555.88591.qmail@web13102.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-c-programming@vger.kernel.org

Hi all,

does any know how i can stop and start interrupts.

i have added a probe function to the kernel to measure
network mechanisms times in cycles, called 
probe_point().

probe_point(int probeid){

get rdtsc time and put id and time into buffer
when full use printk to write buffer to disk.

}

then in mechanisms of interest i place a call to the
probe_point()for example,

vortex_interrupt(){

probe_point(10);// entry of function
.
.function stuff
.
.probe_point(11);// exit of function
}

the problem is some times my buffer does not record
some id's or times. i think this is because another
interrupt took place and so the probe_point() exits
before it gets a chance to store the id and time.

how do i go about setting an non interrupt in the
probe_point function to make sure it finishes what its
supposed to do?

for example:

probe_point(int probeid){

do not interrupt me until i do:

get rdtsc time and put id and time into buffer
when full use printk to write buffer to disk.

now i have finshed puting an id and time into a buffer
so you can interrpt now.

}


__________________________________________________
Do You Yahoo!?
Everything you'll ever need on one web page
from News and Sport to Email and Music Charts
http://uk.my.yahoo.com
