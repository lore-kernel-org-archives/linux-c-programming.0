From: "Theo. Sean Schulze" <tschulze@teamfinders.org>
Subject: undefined sqrt()
Date: Thu, 24 Oct 2002 22:06:24 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021024200624.GA1057@teamfinders.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: tschulze@teamfinders.org

Hello,

This is a real newbie type question.  Usually my problems with C involve pointers, but this one is a problem with the function sqrt().  I had a math problem I needed to solve, and having forgotten my high school algebra about 25 years ago, I thought I could quickly write a C program to get an approximate answer by brute force.  This program is supposed to figure out one of the sides of a right triangle using the other side and the hypotenuse.  The hypotenuse has a fixed relationship to the side of unknown lenght.  Anyway, here is the code, such as it is:


//
// Filename: glide.c
// Version: 0.0.1     Date: 24 October, 2002
//
// Author: T. Sean Schulze
// System: i386-slackware-linux-gnu
//
// Purpose: The purpose of this script is to use brute force to find out
// how long the long side and the hypotenuse of a right triangle are 
// when the short side of the triangle is 35 feet long.  This will, of 
// course, vary depending on the angle between the two unknown sides.
//
// Limitations: Down and dirty.  Not useful for much else than this brute
// attempt.

#include <stdio.h>
#include <math.h>
#include <float.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

double a ;
double b ;
double c ;
double GLIDE ;

int
main(void) /*(int argc, char **argv)*/
{
	GLIDE = 0.012 ;
	a = 0.0 ;

	while( b < 35.0 ) 
	{
		a++ ;
		c = a * (1 + GLIDE) ;
		b = sqrt((c * c) - (a * a)) ;

	}
	
	printf("Glide = %f\n", GLIDE);
	printf("a = %f\n", a) ;
	printf("b = %f\n", b) ;
	printf("c = %f\n", c) ;

	exit(0);

}

When I try to compile it, I get these messages:

dragoon:/home/tschulze/bin # gcc -Wall -o glide glide.c
/tmp/ccXahjXY.o: In function `main':
/tmp/ccXahjXY.o(.text+0x98): undefined reference to `sqrt'
collect2: ld returned 1 exit status

Could someone please give me a hint why this doesn't work?

TIA,
Sean

-- 
Theo. Sean Schulze
tschulze@teamfinders.org
