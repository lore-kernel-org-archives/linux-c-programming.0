From: p.boehm@d-trust.net
Subject: -EFAULT during freeing a pointer to a structure
Date: Tue, 5 Oct 2004 13:19:42 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OF58350A09.A722FD1E-ONC1256F24.003B652A@bln.d-trust.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: Eric Bambach <eric@cisu.net>

On Monday 04 October 2004 02:57 pm, you wrote:

> p.boehm@d-trust.net wrote:
> > Hi,
> > in last time I played a little bit with structures. There are two types
> > of access to it and I want to know where are the differences.
> > Or better: when it makes sense to use type one and when type two ?
> >
> > struct xy {
> >      int id;
> >      char *name;
> > };
> >
> > struct abc {
> >      int id;
> >      char *name;
> >      struct xy st_name;            /* <-- type 1 ( ...via name(=address)
> > ) */ struct xy *st_ptr;            /* <-- type 2 ( ...via
> > pointer(=address) ) */ };

> The memory requirements increase for type 1 as you are declaring a structure
> inside a structure, whereas type 2 it is just a pointer. You can declare 1000
> abc strcuts and have st_ptr point to one structure(or many if you wish) while
> with 1000 abc structs, each will have its own private copy of st_name.
> Furthermore, as I hinted at you can change st_ptr at any time you wish to any
> xy structure while st_name will always point to one xy.id and one xy.name.

OK. That makes sense!
To see how it works I wrote a small prog that allocates memory for 8 of similar
structures and frees all again after allocation.
(better: use a single structure to store an array of pointers which points to
copies of an another structure. allocate needed memory and free it again.)

But there is a small problem:

If I allocate memory for entry-structure with malloc() I get an -EFAULT
     a) if I try to free the first allocated structure
     b) if I try to free the entry-structure

example output:

[0] allocated.
[1] allocated.
...
[7] allocated.
[7] freed.
[6] freed.
...
[1] freed.
Segmentation Fault


If I use otherwise '&'-operator to get the address of structure I don't get
this error. This error is normally produced if I try to access a invalid
memory-area or address. But here I try to free a cleanly allocated area!
Why it is so?

pb

Here the source of my example:

// ------------------------------------------------------------------------

/*
 * head9 - shows the (flexible) handling of structures
 *
 * RCS: @(#) $Id: head9.c,v1.0 2004/10/05 00:42 pboehm Exp $
 */

#include <stdio.h>
#include <stdlib.h>

#define MAXNUM 7

struct xy {
    int id;
    char *name;
    unsigned int usage;
};

struct abc {
    struct xy *next[MAXNUM];  /* saves MAXNUM of pointers to struct xy */
};

int init_abc(struct abc *pt, int num) {
    /*  go out if MAXNUM is reached (index=7) */
    if(num>MAXNUM) return -1;

    /* allocate memory for new structure */
    pt->next[num]=malloc(sizeof(struct xy));
    memset(pt->next[num],0,sizeof(struct xy));

    /* some sample values to save ... */
    pt->next[num]->id=num;
    pt->next[num]->name="test";
    pt->next[num]->usage=1;

    /* return pointer to new structure */
    return (int)pt->next[num];
}

int clear_abc(struct abc *pt, int num) {
    /* go out if first structure is reached (index=0) */
    if(num<0) return -1;

    /* clear saved values ... */
    pt->next[num]->id=0;
    pt->next[num]->name="";
    pt->next[num]->usage=0;

    /* free allocated memory */
    free(pt->next[num]);
    /* and declare old pointer as NULL-pointer */
    pt->next[num]=NULL;

    return 0;
}

int main(int argc, char *argv[]) {
    struct abc ptt, *ptr;
    int index=-1, ret;

    /*
     * (1) if I use this I get an -EFAULT at free(index=0)
     */

    /* (1) entry-point to our structure
     *     allocate memory-space somewhere in RAM and
     *       gives address of copy of struct abc
     *       (pointer to copy of struct abc)
     */

    //ptr=malloc(sizeof(struct abc));
    //memset(ptr,0,sizeof(struct abc));

    /*
     * (2) if I use this I don't get an -EFAULT at free(index=0)
     */

    /* (2) entry-point to our structure
     *     gives address to struct abc in programm-enviroment
     *       (pointer to struct abc)
     */

    ptr=&ptt;

    /* init MAXNUM structures (0..7)*/
    while(index++<MAXNUM) {
     ret=init_abc(ptr, index);
     printf("ptr->next[%d]=%p\n", index, ret);
    }

    /* free MAXNUM of initialized structures (7..0) */
    while(index-->0) {
     clear_abc(ptr, index);
     printf("free(ptr->next[%d]=%p)\n", index, ptr->next[index]);
    }

    /* free our entry-point ( -> only for method 1 (ptr=malloc(..))) */
    //free(ptr);         /* WHY I ALWAYS GET A -EFAULT HERE ??? */

    return 0;
}

// -----------------------------------------------------------------------

