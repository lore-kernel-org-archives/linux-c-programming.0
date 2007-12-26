From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: setuid funciton
Date: Wed, 26 Dec 2007 03:28:08 +0000
Message-ID: <18289.51784.890436.560301@cerise.gclements.plus.com>
References: <861350659.20071225211241@enderunix.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <861350659.20071225211241@enderunix.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?Q2loYW4gS8O2bWXDp2/En2x1?= <cihan@enderunix.org>
Cc: linux-c-programming@vger.kernel.org


Cihan K=C3=B6me=C3=A7o=C4=9Flu wrote:

> Hello everybody
>=20
> I have written simple code about usage of setuid. this program file
> set-user-id bit is on and this process after exec when I execute this
> program, effective user id and saved-user-id bit will be
> program-file's user id. this correct?
>=20
> But the last output when I set uid to 80(www) ,effective user id
> wasn't 80. Why not? saved set user id is still 80? What is the
> problem?
>=20
>=20
> I compiled below code with gcc and I set-user-id bit and change own
> file with this command

[snip]

It works for me; I get:

Real UID	=3D 1001
Effective UID	=3D 80
Real UID	=3D 1001
Effective UID	=3D 1001
Real UID	=3D 1001
Effective UID	=3D 80

This is with a 2.6.17.13 kernel, compiled from stock sources (no
vendor patches).

If you are using a kernel with additional security features (e.g.=20
SELinux, AppArmor etc), it may impose additional restrictions on
setuid(). You could try using setreuid() to swap the real and
effective UIDs, rather than relying upon the saved UID.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
