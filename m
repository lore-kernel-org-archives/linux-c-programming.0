From: "Ranga Reddy M - CTD ,Chennai." <rangareddym@ctd.hcltech.com>
Subject: RE: <time.h>: gmtime keeps giving the same time ....
Date: Fri, 9 May 2003 08:26:57 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <EF836A380096D511AD9000B0D021B52701317B4A@narmada.techmas.hcltech.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J." <mailing-lists@xs4all.nl>, linux-c-programming@vger.kernel.org


Hi,

Here you are comparing the gmtime() output to The "date" command.

see the man pages of gmtime().This will give you the time in UTC format.
use localtime(). Gives same as your "date" output.

I have modified your code .Know it gives the 
The code below.

#include <stdio.h>
#include <time.h>

int main(void) {
 struct tm *tm_ptr;
 time_t the_time;

 (void)time(&the_time);
 tm_ptr = localtime(&the_time);

 printf("tm_ptr->tm_hour = %d\n", tm_ptr->tm_hour);

 return 0;
}


Cheers
--------
Ranga Reddy M


-----Original Message-----
From: J. [mailto:mailing-lists@xs4all.nl]
Sent: Friday, May 09, 2003 1:17 AM
To: linux-c-programming@vger.kernel.org
Subject: <time.h>: gmtime keeps giving the same time ....


Hello,

Output from the date `command` in my terminal:
Thu May  8 21:42:28 CEST 2003

Output from my `problem'_program.c
19

#include <stdio.h>
#include <time.h>

int main(void) {
 struct tm *tm_ptr;
 time_t the_time;

 (void)time(&the_time);
 tm_ptr = gmtime(&the_time);

 printf("tm_ptr->tm_hour = %d\n", tm_ptr->tm_hour);

 return 0;
}

No matter what I do, this C - code keeps giving me as output 19.

Is my system messed up or my head ?

Any thoughts are more than welcome

Thnkx....

J.

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
