From: Joel Pareja <jpareja@ntsp.nec.co.jp>
Subject: Re: binary tree traversal...
Date: 27 Jan 2005 11:19:13 +0800
Message-ID: <1106795952.983.26.camel@localhost.localdomain>
References: <Pine.LNX.4.21.0501262350200.30870-100000@hestia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-VBZvA12JwnTGcez2hf+x"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0501262350200.30870-100000@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--=-VBZvA12JwnTGcez2hf+x
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

It did traverse your binary tree. However, your call to printf is only
performed with the first(?) node.

I think this is how to accomplish what you want.

---- snippet+  ---

{
  ....
  treerecurse(root);   // you don't need a loop here
  ....

}

struct tnode *treerecurse(struct tnode *p) {
 if(p !=3D NULL) {
  treerecurse(p->left);

  printf("%4d %s\n", p->count, p->word);  // perform what  =20
                                          //  you desire for
                                          //  each entry
  treerecurse(p->right);
 }
}

---- snippet- ----


Hope this helps,
Joel=20

On Thu, 2005-01-27 at 07:01, J. wrote:
> Wednesday, January 26
>=20
> Hello,
>=20
> I am trying to traverse a binary tree, returning each node that is
> encounterd so that I can preform operations on that node. However it keep=
s
> looping over the same first node, it refuses to travel any further down
> the tree ... What did I overlooked ? I know the tree is loaded with data
> since a simple recursive preorder treeprint confirms that.
>=20
> An example:=20
>=20
>  while((root =3D treerecurse(root)) !=3D NULL)
>   printf("%4d %s\n", root->count, root->word);
>=20
> And the treerecurse function would look something like:
>=20
> struct tnode *treerecurse(struct tnode *p) {
>  if(p !=3D NULL) {
>   treerecurse(p->left);
>   return p;
>   treerecurse(p->right);
>  }
> }
>=20
> I guess there is something wrong in my reasoning about this...
>=20
> Thnkx..
>=20
> J.
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-program=
ming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it."=20
					    - Brian W. Kernighan

--=-VBZvA12JwnTGcez2hf+x
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQBB+F2wjwMmU1vnFI0RAteeAJ9H5Jkvcmu1dT6IlraDMGSKxBerGgCfXxNf
WZn6yAMoSmmaL36R7s+mYLQ=
=DfY5
-----END PGP SIGNATURE-----

--=-VBZvA12JwnTGcez2hf+x--

