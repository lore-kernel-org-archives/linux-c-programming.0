From: "J." <mailing-lists@xs4all.nl>
Subject: Re: ioctl.h
Date: Fri, 4 Mar 2005 21:54:23 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0503042139340.2159-100000@hestia>
References: <4228B3B8.7020507@valdosta.edu>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
In-Reply-To: <4228B3B8.7020507@valdosta.edu>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Fri, 4 Mar 2005, michael young wrote:

> Hi,
> how do you use the ioctl.h?
> there seems to be little info on it
> on the web or in print. If you know
> of anything on the web please let me
> know.
> 
> thank you,
> Mike

Friday, March 04 

ioctl is used for specific hardware control, it's use differs with each
purpose. Could be rewinding tapes, opening your cd-rom player or set your
serialport prefs.. Bit more info on what you want to accomplish ? 

That said.. Each GNU/Linux system should have a ioctl_list somewhere in 
the manual page section. For example:

~: man -k ioctl
ioctl_list (2)       - list of ioctl calls in Linux/i386 kernel
console ioctl (4) [console_ioctl] - ioctl's for console terminal and virtual consoles
console ioctl's (4) [console_ioctls] - ioctl's for console terminal and virtual consoles
console_ioctl (4)    - ioctl's for console terminal and virtual consoles
.... etc..

~: man 2 ioctl_list
.......... BIG LIST ....... 


There should be enough IOCTL code on the www. search C and hardware
control should return the most code I guess... 

 if((fd = open(dev, O_RDONLY|O_NONBLOCK)) == -1)
  return -1;
 if(ioctl(fd, CDROMEJECT) == -1)
  return -1;

 close(fd);
 etc......

GoodLuck.. J.

--
http://www.rdrs.net/

