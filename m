From: "Bakki Srinivas" <bakki_srinivas@mindtree.com>
Subject: RE: deletion in singly linked list
Date: Tue, 23 Nov 2004 15:05:37 +0530
Message-ID: <5959EA4638D8734599AB75EAAFBB6FEFA471DD@mtv01ex04.mindtree.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_47F83_01C4D16D.E97E8580"
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Cc: mikael-aronsson <mikael-aronsson@telia.com>, Justinas <jugu3479@uosis.mif.vu.lt>, Linux C Programming <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_47F83_01C4D16D.E97E8580
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Until and unless u free the memory obtained by malloc,the address space =
is
still in the process address space.

Srinivas

-----Original Message-----
From: Jagadeesh Bhaskar P [mailto:jbhaskar@hclinsys.com]
Sent: Tuesday, November 23, 2004 3:00 PM
To: Bakki Srinivas
Cc: mikael-aronsson; Justinas; Linux C Programming
Subject: RE: deletion in singly linked list


Sorry about my last reply. There is a small, subtle problem.Say the
nodes as A, B, C itself. Now if we make B=3DC, still the address to =
which
A->next will b pointing will be the address of B itself. Now wont that
make a seg fault????

On Tue, 2004-11-23 at 14:30, Bakki Srinivas wrote:
> how is this---=20
> copy the content of the next item and place it in the current pointed
> item,check if the next item pointed by the next item is NULL if it is =
then
> delete the next item else move the pointer till it reaches NULL =
finally
> delete the last one.
>=20
> Srinivas
>=20
> -----Original Message-----
> From: mikael-aronsson [mailto:mikael-aronsson@telia.com]
> Sent: Tuesday, November 23, 2004 2:25 PM
> To: Justinas; Jagadeesh Bhaskar P
> Cc: Linux C Programming
> Subject: Re: deletion in singly linked list
>=20
>=20
> That will break the list, the previous item has to be updated so you =
will
> need to get the first item of the list and walk through the list until =
you
> find the item in front of the one you want to delete and change the =
"next"
> pointer in that item to point to the one in the "next" pointer in the =
item
> you are deleting.
>=20
> Then you can delete the item you started with.
> There is no other way to do it without a double linked list.
>=20
> Mikael
>=20
> ----- Original Message -----=20
> From: "Justinas" <jugu3479@uosis.mif.vu.lt>
> To: "Jagadeesh Bhaskar P" <jbhaskar@hclinsys.com>
> Cc: "Linux C Programming" <linux-c-programming@vger.kernel.org>
> Sent: Tuesday, November 23, 2004 9:42 AM
> Subject: Re: deletion in singly linked list
>=20
>=20
> > Hello,
> >
> > i think You can. For instance n is a pointer to curent node and =
n->next
is
> pointer to next node. lets say we like this tmp =3D n, and n =3D =
n->next. After
> that free(tmp).
> >
> > On Tue, 23 Nov 2004 13:54:10 +0530
> > Jagadeesh Bhaskar P <jbhaskar@hclinsys.com> wrote:
> >
> > > I am having the address of a single node of a singly linked list. =
All I
> > > know about that node is that it is not the head of the list. Now =
say, I
> > > want to delete this node. I can infer its next node, but not its
> > > predicissor. Is there any way to delete that node, without =
breaking the
> > > whole linked list down!!
> > >
> > > --=20
> > > Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
> > >
> > > -
> > > To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > >
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>


------=_NextPart_000_47F83_01C4D16D.E97E8580
Content-Type: text/plain;
	name="disclaimer.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="disclaimer.txt"

-------------------------------------------------------------------------=
----------------------------------------------------
Disclaimer
-------------------------------------------------------------------------=
----------------------------------------------------

"This message(including attachment if any)is confidential and may be =
privileged.Before opening attachments please check them
for viruses and defects.MindTree Consulting Private Limited =
(MindTree)will not be responsible for any viruses or defects or
any forwarded attachments emanating either from within MindTree or =
outside.If you have received this message by mistake please notify the =
sender by return  e-mail and delete this message from your system. Any =
unauthorized use or dissemination of this message in whole or in part is =
strictly prohibited.  Please note that e-mails are susceptible to change =
and MindTree shall not be liable for any improper, untimely or =
incomplete transmission."

-------------------------------------------------------------------------=
----------------------------------------------------
------=_NextPart_000_47F83_01C4D16D.E97E8580--
