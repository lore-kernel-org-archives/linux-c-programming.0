From: Jad Saklawi <Jad@Saklawi.info>
Subject: Re: realloc array of structures
Date: Sun, 25 Apr 2004 20:28:48 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1082914128.408bf55066a5a@webmail.namezero.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org

Quoting "J." <mailing-lists@xs4all.nl>:

> Sunday, April 25 18:08:29
> 
> Hello, 
> 
> I am trying to put incomming data into an array of structures. For example
> everytime a new line arrives, grow the array by one, and copy the line
> into the newly allocated mem structure. 
> 
> Unfortunatly I am a bit lost in the pointer world. Could someone give me
> some hints what to what goes wrong in the small example code below ?

Here is a fixed version of your code :
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
    strarray = (struct node **)realloc(strarray, (count + 1) * sizeof(struct
node *));
    strarray[count] = (struct node *)malloc(sizeof(struct node));
    /* copy the line to member str of the new element (structure) */
    strarray[count]->str =  strdup(line);
    count++;
  }

  for(i = 0; i < count; i++)
    printf("[%d].str: %s", i, strarray[i]->str);

  return 0;
}

  You needed to allocate memory for each struct, and you should use -> when
using struct pointers instead of .

Greets,
Jad Saklawi
