From: "J." <mailing-lists@xs4all.nl>
Subject: Re: strtod() and errno question.
Date: Wed, 11 Jan 2006 12:24:14 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0601111217280.995-100000@hestia>
References: <17348.29957.526334.352861@cerise.gclements.plus.com>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17348.29957.526334.352861@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, 11 Jan 2006, Glynn Clements wrote:
> J. wrote:
> 
> > I have a question regarding errno and strtod() error checking. I have a
> > function [listed below] that extracts a number from a string. In case of
> > an error, strerror() in conjunction with errno is used to display a user
> > friendly error message. However on a strtod() error; `Success' is
> > returned.
> 
> Note that strtod() only sets errno on overflow or underflow.
> 
> If you want to check for failure to convert (because no prefix of the
> string is a valid floating-point number), you need to check whether
> "nptr == str".
> 
> Glynn Clements <glynn@gclements.plus.com>

Hi, 

Thank you for all your answers. At first glance extracting a number from a
string seems rather easy, but it can be a hassle. I checked the source code 
of some other programs and I changed the function to the following. I hope
that will suffice validating user input.

Thankx again.

J.

#include <limits.h>

int extrnumber(char *str) {
 long lval = 0;
 int retv = 0;
 char *nptr = NULL;

 lval = strtol(str, &nptr, 10);
 if(str == '\0' || *nptr != '\0') {
  fprintf(stderr, "%s: Error - conversion(%s): strtol(`%c')\n", 
    PACKAGE, str, *nptr);
  exit(EXIT_FAILURE);
 }
 if((errno == ERANGE && (lval == LONG_MAX || lval == LONG_MIN)) ||
    (lval > INT_MAX || lval < INT_MIN)) {
  fprintf(stderr, "%s: Error - strtol(%s): %s\n", 
    PACKAGE, str, strerror(errno));
  exit(EXIT_FAILURE);
 }

 retv = lval;
 return retv;
}

