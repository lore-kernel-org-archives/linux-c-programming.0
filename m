From: "Bakki Srinivas" <bakki_srinivas@mindtree.com>
Subject: RE: filesystem in the kernel
Date: Thu, 25 Nov 2004 17:46:24 +0530
Message-ID: <5959EA4638D8734599AB75EAAFBB6FEFA471EC@mtv01ex04.mindtree.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_13A87_01C4D316.AEAB0000"
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: sumit kalra <i_am_sumit_kalra@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_13A87_01C4D316.AEAB0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks.

Regards
Srinivas

-----Original Message-----
From: sumit kalra [mailto:i_am_sumit_kalra@yahoo.com]
Sent: Thursday, November 25, 2004 5:45 PM
To: Bakki Srinivas
Cc: linux-c-programming@vger.kernel.org
Subject: Re: filesystem in the kernel


Hi,

ext2_fs_type is declared using the macro
DECLARE_FSTYPE_DEV. This macro eventually
expands to declaring ext2_fs_type as an instance of
struct file_system_type and initializes its members.

Look at this macros in include/linux/fs.h

Regards,
Sumit

-------------------------------------=20

 --- Bakki Srinivas <bakki_srinivas@mindtree.com>
wrote:=20
> hi,
>     when a filesystem is registered with the kernel
> eg.
> register_filesystem(&ext2_fs_type);
>   where is the structure ext2_fs_type declared ?
>=20
> Thanks with Regards
> Srinivas Bakki
> >
-------------------------------------------------------------------------=
----
------------------------------------------------
> Disclaimer
>
-------------------------------------------------------------------------=
----
------------------------------------------------
>=20
> "This message(including attachment if any)is
> confidential and may be privileged.Before opening
> attachments please check them
> for viruses and defects.MindTree Consulting Private
> Limited (MindTree)will not be responsible for any
> viruses or defects or
> any forwarded attachments emanating either from
> within MindTree or outside.If you have received this
> message by mistake please notify the sender by
> return  e-mail and delete this message from your
> system. Any unauthorized use or dissemination of
> this message in whole or in part is strictly
> prohibited.  Please note that e-mails are
> susceptible to change and MindTree shall not be
> liable for any improper, untimely or incomplete
> transmission."
>=20
>
-------------------------------------------------------------------------=
----
------------------------------------------------=20


	=09
___________________________________________________________=20
Moving house? Beach bar in Thailand? New Wardrobe? Win =A310k with =
Yahoo! Mail
to make your dream a reality.=20
Get Yahoo! Mail www.yahoo.co.uk/10k

------=_NextPart_000_13A87_01C4D316.AEAB0000
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
------=_NextPart_000_13A87_01C4D316.AEAB0000--
