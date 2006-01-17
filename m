From: Jesse Ruffin <jesse@ajp-services.net>
Subject: Re: Help: need to prevent infinite loop
Date: Tue, 17 Jan 2006 02:14:53 -0500
Message-ID: <43CC996D.4050100@ajp-services.net>
References: <200601171006.36978.samjnaa@gmail.com>
Reply-To: jesse@ajp-services.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200601171006.36978.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

The problem is a general one that will affect many non digit characters.

scanf() on my computer returns 0, an early match error. But what you
probably don't expect, and I can't find in the info or man pages, is
that glibc scanf seems to unget() the input that it has read.

This means that that arrow gets put back in the stream, your program
loops, reads the same character again, and has the same matching errors
etc. etc. on into infinity.

What is you need to do is clear the stream between iterations.
This inelegant, but satisfactory, method fixes the problem:

#include "stdio.h"
int repeatinput;
int jday, jmon, jyear;
enum boolean { FALSE, TRUE };

/* Just large enough for YYYY-MM-DD + \n + \0 */
char buf[12];

void main(void)
{
	do
	{
		repeatinput = FALSE;
		printf("Date as YYYY-MM-DD     : ");

		/* Unequivocally get a whole line */
		fgets(buf,12,stdin);

		/* Scan the buffer instead */
		if (sscanf(buf, "%d-%d-%d", &jyear, &jmon, &jday) < 1)
			repeatinput = TRUE;
		if (jyear < 1800 || jyear > 2399)
			repeatinput = TRUE;
		if (repeatinput)
			printf ("Please enter a valid date.\n");
	}
	while (repeatinput);
	printf ("Thanks for entering a valid date.\n");
}
