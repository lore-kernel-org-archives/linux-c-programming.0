From: Eric Bambach <eric@cisu.net>
Subject: Re: different access to structs
Date: Mon, 4 Oct 2004 10:00:50 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200410041000.50040.eric@cisu.net>
References: <OF3FF607B8.2DEFEA3E-ONC1256F23.0035E913@bln.d-trust.de> <cjr9n9$3g1$1@sea.gmane.org>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <cjr9n9$3g1$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Suciu Flavius <suciuflavius@tiscali.de>
Cc: linux-c-programming@vger.kernel.org

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

The memory requirements increase for type 1 as you are declaring a structure 
inside a structure, whereas type 2 it is just a pointer. You can declare 1000 
abc strcuts and have st_ptr point to one structure(or many if you wish) while 
with 1000 abc structs, each will have its own private copy of st_name. 
Furthermore, as I hinted at you can change st_ptr at any time you wish to any 
xy structure while st_name will always point to one xy.id and one xy.name. 

HTH.

In fact, can someone now explain to me why his program didn't crash from an 
uninitialized pointer (struct xy *) st_ptr in abc? Is this a special case of 
scructs, because that pointer looks pretty dangling to me....


> > void init_abc(struct abc *pt) {          /* pt points to ptr ... */
> >      pt->id=0;
> >      pt->name="test";
> >
> >      pt->st_name.id=0;             /* <-- type 1 (access via name of
> > variable) */ pt->st_name.name="test";
> >
> >      pt->st_ptr->id=0;             /* <-- type 2 (access via pointer) */
> >      pt->st_ptr->name="test";
> > }
> >
> > void main(void) {
> >      struct abc ptr;               /* name of struct = ptr */
> >
> >      init_abc(&ptr);               /* call init_abc(<address of ptr>) */
> > }
> >
> > thanks in advance!
> > pb
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-c-programming" in the body of a message to
> > majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 

-EB
