From: "J." <mailing-lists@xs4all.nl>
Subject: *w[1]++ = *[k[1]++; does not work .. ?
Date: Sun, 23 Feb 2003 18:37:08 +0100 (CET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0302231825450.10716-100000@hestia>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello...

I am trying to copy a string into the first element of an array of char
pointers.

I can print char by char like this: printf("%c", *w[1]++);
but I can not copy char by char like this: *w[1]++ = *k[1]++;

I dont understand ? If I can print it, it should also copy ..

Strangly enough the compiler does not complain.

I have inserted a small illustrative example in this e-mail.

/* To illustrate the difference: This works */
#include <stdio.h>
#include <string.h>

int main(void) {
 char *w[1];
 char str[] = "jehova";

 w[1] = strdup(str);

 while(*w[1] != '\0')
  printf("%c", *w[1]++);

 printf("\n");
 return 0;
}

/* But this does not work */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
 char *w[1];
 char *k[1];
 char str[] = "jehova";

 w[1] = strdup(str);
 k[1] = calloc(strlen(str) + 1, sizeof(char));

 while(*w[1] != '\0')
  *k[1]++ = *w[1]++; 

 printf("%s\n", w[1]);
 return 0;
}

Can someone explain what I am doing wrong ?

Thankx a lot,...

J.

