From: "J." <mailing-lists@xs4all.nl>
Subject: Re: realloc array of structures, solved!
Date: Sun, 25 Apr 2004 19:11:35 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0404251906450.10171-100000@hestia>
References: <Pine.WNT.4.58.0404252206330.1664@umas>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.WNT.4.58.0404252206330.1664@umas>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Sunday, April 25 19:06:45

Thanks [Uma] for the quick reply, I can see now what I did wrong and
very important; why my code wasn't working.

Thnkx again..

J.

> On Sun, 25 Apr 2004, Uma Shankar Kayarohanam wrote:
> > #include <stdio.h>
> > #include <string.h>
> > #include <stdlib.h>
> >
> > struct node {
> >  char *str;
> > };
> >
> > int main(void) {
> >  struct node **strarray = NULL;
> 
> struct node *strarray = NULL;
> 
> >  int i = 0, count = 0;
> >  char line[1024];
> >
> >  while(fgets(line, 1024, stdin) != NULL) {
> >   /* grow the array with one element */
> >   strarray = (struct node **)realloc(strarray, (count + 1) * sizeof(struct node *));
> 
> strarray = (struct node *)realloc(strarray, (count + 1) * sizeof(struct node *));
> 
> >   /* copy the line to member str of the new element (structure) */
> >   strarray[count++].str = strdup(line);
> >  }
> >
> >  for(i = 0; i < count; i++)
> >   printf("[%d].str: %s", i, strarray[i].str);
> >
> >  return 0;
> > }

