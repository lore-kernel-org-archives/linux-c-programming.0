From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Help: need to prevent infinite loop
Date: Tue, 17 Jan 2006 10:06:36 +0530
Message-ID: <200601171006.36978.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello. I have the following code:

#include "stdio.h"
int repeatinput;
int jday, jmon, jyear;
enum boolean { FALSE, TRUE };
void main(void)
{
	do
	{
		repeatinput = FALSE;
		printf("Date as YYYY-MM-DD     : ");
		if (scanf("%d-%d-%d", &jyear, &jmon, &jday) < 1) repeatinput = TRUE;
		if (jyear < 1800 || jyear > 2399) repeatinput = TRUE;
		if (repeatinput) printf ("Please enter a valid date.\n");
	}
	while (repeatinput);
	printf ("Thanks for entering a valid date.\n");
}

If I compile it with gcc and execute it, and press an arrow key at the input 
prompt and press enter, I get an infinite loop giving the date prompt and 
saying "Please enter a valid date".

Wonder what's wrong with the code? Should not, at the second execution of the 
loop, it wait for me to enter a correct input?

Thanks for your feedback.

-- 

Penguin #395953 resides at http://samvit.org
subsisting on SUSE Linux 10.0 with KDE 3.5
