From: "J." <mailing-lists@xs4all.nl>
Subject: convert time to UTC, strptime() returns -1 ?
Date: Wed, 1 Oct 2003 21:40:44 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0310012128140.21094-100000@hestia>
References: <3F69538E00004185@mail-bcm01.alestra.net.mx>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F69538E00004185@mail-bcm01.alestra.net.mx>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello,

I am affraid, I got lost a little in all the time functions that are
arround.

I want to convert a time string to an UTC value. Unfortunatly my program,
and me of course are failing at this. :(

I convert the string with strftime() to a `time struct'. 
An then convert that value with strptime(), which returns -1.

The source code.

#include <stdio.h>
#include <time.h>

int main(void) {
 struct tm timestruct;
 
/* the time string to be converted to an UTC value */
 char tstr[] = "Sun Sep 28 00:00:04 2003";
 char utc[16];

 printf("string     = %s\n", tstr);
 
 /* Convert / read the time into the time structure */
 if(strptime(tstr, "%a %b %d %T %Ey", &timestruct) == 0)
  return;
 else {
  printf("strptime() = ");
  
 /* print the time structure, works fine */
 printf("%02d %02d %02d:%02d:%02d %2d\n", timestruct.tm_mon,
  timestruct.tm_mday, timestruct.tm_hour, timestruct.tm_min, 
  timestruct.tm_sec, timestruct.tm_year);

  /* 
   * convert the time structure to an UTC time value 
   * And here the program FAILS. strftime() returns -1 
   */
  strftime(utc, sizeof(utc), "%s", &timestruct);
  printf("strftime() = %s\n", utc);
 }

 return 0;
}

The output is:
string     = Sun Sep 28 00:00:04 2003
strptime() = 08 28 00:00:04 2003
strftime() = -1

If the algo or anything else is bad, or if you have tips, hints or
solutions of some kind. I would be very greatfull!

Thnkx, J.

--
LonkyWong

