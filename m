From: "J." <mailing-lists@xs4all.nl>
Subject: strtod() and errno question.
Date: Tue, 10 Jan 2006 22:42:46 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0601102235490.1799-100000@hestia>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Tuesday, January 10 22:35:50

Hi people,

I have a question regarding errno and strtod() error checking. I have a
function [listed below] that extracts a number from a string. In case of
an error, strerror() in conjunction with errno is used to display a user
friendly error message. However on a strtod() error; `Success' is
returned.

Error - strtod(ca4)`c': Success

Since I am a bit confused by the strtod() manual page, what would be the 
correct way to handle this ?

Thankx !

J.

int extrnumber(char *str) {
 int retv = 0;
 char *nptr = NULL;

 retv = strtod(str, &nptr);
 if(retv == 0 && nptr != NULL) {
  fprintf(stderr, "%s: Error - strtod(%s)`%c': %s\n", PACKAGE, 
    str, *nptr, strerror(errno));
  exit(EXIT_FAILURE);
 }

 return retv;
}

