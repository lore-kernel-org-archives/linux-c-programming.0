From: Rajesh Radhakrishnan <rajeshrk@mascon.co.in>
Subject: Re: Adapting VAT for TAO on Linux.
Date: Sat, 18 May 2002 13:52:39 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <33D492BAFECCD4118A2F001083FC3AB5820E71@GRMAIL>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

I am trying to adapt Visual Audio Tool for the TAO( the ACE ORB) framework.
I had tried to communicate the authors of VAT at Berkeley Labs,
unfortunately they are no longer there.

I am trying to run VAT on RH7.2 and I have the following problem


		I loaded the gsm files above the vat directory and the
"configure" produced a "Makefile". However when i run the "make" i have the
following message ....


				In file included from inet.c:33
				config.h:87:conflicting types for
'gethostid'
				/usr/include/unistd.h:805:previous
declaration of "gethostid"
				In file included from inet.c:34
				inet.h:98:redefinition of 'struct msghdr'
				make : *** [inet.o] Error 1

Can somebody give some info on modifying the RTP specific components of VAT
and how to adapt them to the TAO framework. I have a copy of the book
"Pattern Oriented Software Architecture" by Doug Schmidt et.al which deals
with the handles of TAO.

Any help will be greatly appreciated.
TIA,
Raj


 
****************************************************************************
This e-mail and any files transmitted with it are for the sole use of the
intended recipient(s) and may contain confidential and privileged
information. If you are not the intended recipient, please contact the
sender by reply e-mail and destroy all copies of the original message. Any
unauthorised review, use, disclosure, dissemination, forwarding, printing or
copying of this email or any action taken in reliance on this e-mail is
strictly prohibited and may be unlawful.
Visit us @ http://www.masconit.com
****************************************************************************



