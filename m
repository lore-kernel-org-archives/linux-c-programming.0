From: "J." <mailing-lists@xs4all.nl>
Subject: RE: dynamic allocation of array of structures
Date: Sat, 22 Mar 2003 21:48:12 +0100 (CET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0303222141500.5852-100000@hestia>
References: <20030322202720.267284000B9@mwinf0501.wanadoo.fr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030322202720.267284000B9@mwinf0501.wanadoo.fr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sat, 22 Mar 2003, Anthony Nguyen wrote:

> typedef struct Apeople { 
> char *name;
>  int telnr;
> } Tpeople;
> 
> ...
> 
> Tpeople *toto;
> 
> toto = (Tpeople *)(malloc (sizeof Tpeople) * <the number of elements you
> want to allocate>);
> 
> But I think that you were searching a "proper way" to implement it, isn't it
> :?
> 
> A.N.

Lol :) euh ... to be honest .. actually yes ..

Of course before I decided to send a message to this list I have tried
something like you described above, but it doesn't work quitte as I
expected or better said, like I want it to work.

Maybe some of you could give a hunch what goes wrong. 
(Code compiles without Complaining)

#include <stdio.h>
#include <stdlib.h>

typedef struct {
 char initial;
 int roomnr;
} record;

int main(void) {
 int i = 0;
 record *ptr;

 if((ptr = (record *)malloc(10 * sizeof(record))) == NULL) {
  fprintf(stderr, "Error: failed malloc\n");
  return 1;
 }

 for(i = 0; i < 10; i++, ptr++) {
  ptr->initial = 'A' + i;
  ptr->roomnr = i;
 }

 for(i = 0; i < 10; i++, ptr++) {
  printf("ptr->initial = %c, ", ptr->initial);
  printf("ptr->roomnr = %d\n", ptr->roomnr);
 }

 return 0;
}

Thnkx.. J.

