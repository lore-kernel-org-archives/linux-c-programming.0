From: "J." <mailing-lists@xs4all.nl>
Subject: gcc: Floating point exception
Date: Sun, 20 Feb 2005 21:58:54 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0502202150070.2008-100000@hestia>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Sunday, February 20 21:50:07

Hello,

When I compile the following 5lines of code with `gcc -Wall -pedantic', I
get no warnings or any errors. However when I run the compiled
program I get the error: Floating point exception .

Anyone knows what I should fix ? I already tryd the different
storage types float, etc.. But then gcc complains  warning: long int
format, int arg... etc... ?

I am using gcc version: 2.95.4

#include <stdio.h>

int main(void) {
 int red = 0; 
 int green = 128; 
 int blue = 0;

 printf("%d %d %d\n", (100 / (256 / red)), 
   (100 / (256 / green)), (100 / (256 / blue)));

 return 0;
}

Thnkx.. J.

