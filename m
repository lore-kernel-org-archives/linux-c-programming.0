From: "Bakki Srinivas" <bakki_srinivas@mindtree.com>
Subject: RE: deletion in singly linked list
Date: Tue, 23 Nov 2004 16:01:47 +0530
Message-ID: <5959EA4638D8734599AB75EAAFBB6FEFA471E1@mtv01ex04.mindtree.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_49264_01C4D175.BC8750E0"
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Bakki Srinivas <bakki_srinivas@mindtree.com>, Glynn Clements <glynn@gclements.plus.com>, Linux C Programming <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_49264_01C4D175.BC8750E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ya we cant delete the last item this way.very true
Srinivas

-----Original Message-----
From: Bakki Srinivas=20
Sent: Tuesday, November 23, 2004 3:53 PM
To: 'Glynn Clements'; Linux C Programming
Subject: RE: deletion in singly linked list


prior to copyin we need to check for NULL.

-----Original Message-----
From: Glynn Clements [mailto:glynn@gclements.plus.com]
Sent: Tuesday, November 23, 2004 3:30 PM
To: Linux C Programming
Subject: RE: deletion in singly linked list



Bakki Srinivas wrote:

> copy the content of the next item and place it in the current pointed
> item,check if the next item pointed by the next item is NULL if it is =
then
> delete the next item else move the pointer till it reaches NULL =
finally
> delete the last one.

That fails if there is no next item, i.e. you're deleting the last
element from the list.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

------=_NextPart_000_49264_01C4D175.BC8750E0
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
------=_NextPart_000_49264_01C4D175.BC8750E0--
