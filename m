From: Hemant Mohan <hemantm@pune.tcs.co.in>
Subject: strtok_r crashing
Date: Thu, 14 Nov 2002 18:16:04 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OF8E547BE6.AC22B859-ON65256C71.0045BBB6@pune.tcs.co.in>
Reply-To: hemantm@pune.tcs.co.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

I am trying to parse a string using strtok_r (I need reentrant code) as
follows:

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main()
{
  char *str = NULL;
  char *temp = NULL;
  char **ptr = NULL;   // Note that this is a char**
  int x = 0;
  int y = 0;

  str = malloc (10*sizeof(char));
  sprintf ( str,"%s", "320x240");
  temp = strtok_r ( str, "Xx", ptr );
  x = atoi(temp);
  temp = strtok_r ( NULL, "Xx", ptr);
  y = atoi(temp);
  printf("x = %d\t y= %d\n", x, y);

 return 0;
}


This code receives a SIGSEGV in strtok_r.

However, if I change the declaration of ptr from char** to char* and change 
the third arguement of strtok_r to  &ptr it works.
That is
char* ptr = NULL;
temp = strtok_r ( str, "Xx" &ptr);

Can anyone please help me know the difference between these two calls
as I think both calls are similar.

Thanks,
Hemant Mohan

-------------------------------------------------------
