From: "Sanjay Kumar, Noida" <sanjayku@noida.hcltech.com>
Subject: RE: time_t ???
Date: Fri, 14 May 2004 16:14:14 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1B3885BC15C7024C845AAC78314766C506468F96@exch-01.noida.hcltech.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: behzad chenaghlou <skh_gps@yahoo.com.au>, linux-c-programming@vger.kernel.org


actually time_t is "long" .
in linux kernel the wall time is defined  in kernel/timer.c as 
	struct timespec xtime;  
	where  timespec structure is: 
		struct timespec
		{
			time_t tv_sec;
			long tv_nsec;
		};
	here xtime.tv_sec is used to store the number of seconds that have
passed after january 1, 1970. 
	The walltime is defined relative to this.
	whereas xtime.tv_nsec gives the number of nanoseconds that have
elapsed in the last second.

regards
sanjay

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of behzad
chenaghlou
Sent: Friday, May 14, 2004 3:11 PM
To: linux-c-programming@vger.kernel.org
Subject: time_t ???


Hi everybody

What is exactly the "time_t" struct?
I mean how it retains the calender?
Where can I find a reference



best regards
behzad

Find local movie times and trailers on Yahoo! Movies.
http://au.movies.yahoo.com
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


Disclaimer: 

This message and any attachment(s) contained here are information that is
confidential,proprietary to HCL Technologies and its customers, privileged
or otherwise protected by law.The information is solely intended for the
individual or the entity it is addressed to. If you are not the intended
recipient of this message, you are not authorized to read, forward,
print,retain, copy or disseminate this message or any part of it. If you
have received this e-mail in error, please notify the sender immediately by
return e-mail and delete it from your computer.


