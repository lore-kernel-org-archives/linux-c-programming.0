From: "J." <mailing-lists@xs4all.nl>
Subject: realloc array of structures
Date: Sun, 25 Apr 2004 18:16:27 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0404251808290.10045-100000@hestia>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Sunday, April 25 18:08:29

Hello, 

I am trying to put incomming data into an array of structures. For example
everytime a new line arrives, grow the array by one, and copy the line
into the newly allocated mem structure. 

Unfortunatly I am a bit lost in the pointer world. Could someone give me
some hints what to what goes wrong in the small example code below ?

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct node {
 char *str;
};

int main(void) {
 struct node **strarray = NULL;
 int i = 0, count = 0;
 char line[1024];
 
 while(fgets(line, 1024, stdin) != NULL) {
  /* grow the array with one element */
  strarray = (struct node **)realloc(strarray, (count + 1) * sizeof(struct node *));
  /* copy the line to member str of the new element (structure) */
  strarray[count++].str = strdup(line);
 }

 for(i = 0; i < count; i++)
  printf("[%d].str: %s", i, strarray[i].str);

 return 0;
}

/* any comments or suggestions are more then welcome.. Thnkx ! */
/* J. */

