From: "J." <mailing-lists@xs4all.nl>
Subject: <time.h>: gmtime keeps giving the same time ....
Date: Thu, 8 May 2003 21:47:20 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0305082139410.13103-100000@hestia>
References: <20030507154442.GQ674@gre.ac.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030507154442.GQ674@gre.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

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

