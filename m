From: Suciu Flavius <suciuflavius@tiscali.de>
Subject: Re: different access to structs
Date: Mon, 04 Oct 2004 12:57:29 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <cjr9n9$3g1$1@sea.gmane.org>
References: <OF3FF607B8.2DEFEA3E-ONC1256F23.0035E913@bln.d-trust.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OF3FF607B8.2DEFEA3E-ONC1256F23.0035E913@bln.d-trust.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

first: NEVER but NEVER void main !!!!!!!!
main is always INT main() or simple main()
void main() is a classic Micro$oft programming poluation, the second is 
the hungarian notation :D

Basicly you will use the pointer method when a group of variables share 
  the same readonly values.
Also you can use it to hide some struct internals :)
The second one, when every variable have his own values and you can 
group together for a more logical design..

Example:
you program a RTS game, One of your entity in the world is a peasant.
All peasants have the same speed, cost the same value of gold, have the 
same armor and attack, etc..
In this case, why we should retain for every peasant this attributes?
Why not just a struct Attr and every peasant struct will have a field
struct Attr *attributes ?
Image how much space do you waste if instead of a pointer (4 bytes for 
example) you are replicating a struct (100 bytes let's say)

For the second case, every peasant have his own health meter, current 
assigned job, etc..
In this case, we can define a struct OwnAttr and this struct must be a 
member in our peasant struct :)


Hope this help.

Regards, and don't forget, never VOID main ! ;)




p.boehm@d-trust.net wrote:
> Hi,
> in last time I played a little bit with structures. There are two types of access to it and I want
> to know where are the differences.
> Or better: when it makes sense to use type one and when type two ?
> 
> struct xy {
>      int id;
>      char *name;
> };
> 
> struct abc {
>      int id;
>      char *name;
>      struct xy st_name;            /* <-- type 1 ( ...via name(=address) ) */
>      struct xy *st_ptr;            /* <-- type 2 ( ...via pointer(=address) ) */
> };
> 
> void init_abc(struct abc *pt) {          /* pt points to ptr ... */
>      pt->id=0;
>      pt->name="test";
> 
>      pt->st_name.id=0;             /* <-- type 1 (access via name of variable) */
>      pt->st_name.name="test";
> 
>      pt->st_ptr->id=0;             /* <-- type 2 (access via pointer) */
>      pt->st_ptr->name="test";
> }
> 
> void main(void) {
>      struct abc ptr;               /* name of struct = ptr */
> 
>      init_abc(&ptr);               /* call init_abc(<address of ptr>) */
> }
> 
> thanks in advance!
> pb
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

