From: Eric Bambach <eric@cisu.net>
Subject: Re: binary tree traversal...
Date: Wed, 26 Jan 2005 20:07:19 -0600
Message-ID: <200501262007.19118.eric@cisu.net>
References: <Pine.LNX.4.21.0501262350200.30870-100000@hestia>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0501262350200.30870-100000@hestia>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org

On Wednesday 26 January 2005 05:01 pm, J. wrote:
> Wednesday, January 26
>
> Hello,
>
> I am trying to traverse a binary tree, returning each node that is
> encounterd so that I can preform operations on that node. However it =
keeps
> looping over the same first node, it refuses to travel any further do=
wn
> the tree ... What did I overlooked ? I know the tree is loaded with d=
ata
> since a simple recursive preorder treeprint confirms that.
>
> An example:
>
>  while((root =3D treerecurse(root)) !=3D NULL)
>   printf("%4d %s\n", root->count, root->word);
>
> And the treerecurse function would look something like:
>
> struct tnode *treerecurse(struct tnode *p) {
>  if(p !=3D NULL) {
>   treerecurse(p->left);
>   return p;
>   treerecurse(p->right);
>  }
> }
>
> I guess there is something wrong in my reasoning about this...

Yea, that definatly wont work. I think you're messing up because a recu=
rsive=20
function can only pass back the top node, or a node that meets a certai=
n=20
condition back up the calling stack, without static data, you cant call=
 a=20
recursive function and keep going where it left off so you can only ret=
urn=20
one node.

Why dont you just pass a function pointer into the recursive function s=
o it=20
looks like this:(pseudocode, my function pointer syntax is bad)

-------------(pseudo)code--------

treerecurse(root);

//Now you dont need a loop. A single line will now make your function=20
//perform on all the nodes.

//And the treerecurse function would look something like:

struct tnode *treerecurse(struct tnode *p,function *dofoo) {
=A0if(p !=3D NULL) {
  dofoo(p->data);
=A0 treerecurse(p->left);
=A0 return p;
=A0 treerecurse(p->right);
=A0}
}
---------------end (pseudo)code---------------

If its C++, then its even easier, make tnode a class and define a funct=
ion=20
dofoo and inside the recursion call tnode.dofoo();
> Thnkx..
>
> J.
>
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kerne=
l.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
----------------------------------------
--EB

> All is fine except that I can reliably "oops" it simply by trying to =
read
> from /proc/apm (e.g. cat /proc/apm).
> oops output and ksymoops-2.3.4 output is attached.
> Is there anything else I can contribute?

The latitude and longtitude of the bios writers current position, and
a ballistic missile.

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0--Alan Cox LKML-Decembe=
r 08,2000=20

----------------------------------------
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
