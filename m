From: p.boehm@d-trust.net
Subject: Antwort: Re: -EFAULT during freeing a pointer to a structure
Date: Fri, 8 Oct 2004 11:03:55 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OFFFC2B2B9.78606041-ONC1256F27.002EEFD1@bln.d-trust.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suciu Flavius <suciuflavius@tiscali.de>
Cc: linux-c-programming@vger.kernel.org


Hi,
while allocating memory I didn't have an -EFAULT. So it couldn't be an vector limit
problem. It's while freeing! (see 'NOTE:' for special cases)

My problem-decription from mail at Sep 05:

>If I allocate memory for entry-structure with malloc() I get an -EFAULT
>    a) if I try to free the first allocated structure
>    b) if I try to free the entry-structure
>
>example output:
>
>[0] allocated.
>[1] allocated.
>...
>[7] allocated.
>[7] freed.
>[6] freed.
>...
>[1] freed.
>Segmentation Fault

>If I use otherwise '&'-operator to get the address of structure I don't get
>this error. This error is normally produced if I try to access a invalid
>memory-area or address. But here I try to free a cleanly allocated area!
>Why it is so?

I've solved that by taking an even value for MAXNUM. But I doesn't understand
why the error could happened.

NOTE: There are two errors:
     1) using &-operator for ptr there is no seg.fault
          #define MAXNUM 7
          struct abc ptt, *ptr;
          ptr=&ptt;
          [-] free(ptr);
     2) using multiple of 4 in MAXNUM there is no seg.fault
          #define MAXNUM 8
          struct abc *ptr;
          ptr=malloc(sizeof(struct abc));

Take this short example:
(it's written from mind, hope there are no spelling mistakes)
# --------------------------------------------------------- #

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXNUM 7

struct xy {
     int x;
     char *y;
};

struct abc {
     struct xy *next[MAXNUM];
};

void init_abc(struct abc *pt, int index) {
     pt->next[index]=malloc(sizeof(struct xy));
     memset(pt->next[index],0,sizeof(struct xy));
}

void free_abc(struct abc *pt, int index) {
     free(pt->next[index]);
     pt->next[index]=NULL;
}

int main(int argc, char *argv[]) {
     struct abc *ptr;
     int index=-1;

     ptr=malloc(sizeof(struct abc));
     memset(ptr, 0, sizeof((struct abc));

     while(index++<MAXNUM) {
          init_abc(ptr,index);
          printf("ptr->next[index] = %p\n", ptr->next[index]);
     }
     while(index-->0) {
          free_abc(ptr,index);
          printf("ptr->next[index] = %p\n", ptr->next[index]);
     }

     free(ptr);
     return 0;
}

# ---------------------------------------------------------------------- #

Thanks in advance.
pb

