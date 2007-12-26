From: =?utf-8?B?Q2loYW4gS8O2bWXDp2/En2x1?= <cihan@enderunix.org>
Subject: Re[2]: setuid funciton
Date: Thu, 27 Dec 2007 01:48:20 +0200
Message-ID: <563266144.20071227014821@enderunix.org>
References: <861350659.20071225211241@enderunix.org> <18289.51784.890436.560301@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18289.51784.890436.560301@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

=0D
I understand. Thanks for your answer
I try this code under Freebsd 6.2
and dont give me this output

Wednesday, December 26, 2007, 5:28:08 AM, you wrote:

> Cihan K=C3=B6me=C3=A7o=C4=BElu wrote:

>> Hello everybody
>>=20
>> I have written simple code about usage of setuid. this program file
>> set-user-id bit is on and this process after exec when I execute thi=
s
>> program, effective user id and saved-user-id bit will be
>> program-file's user id. this correct?
>>=20
>> But the last output when I set uid to 80(www) ,effective user id
>> wasn't 80. Why not? saved set user id is still 80? What is the
>> problem?
>>=20
>>=20
>> I compiled below code with gcc and I set-user-id bit and change own
>> file with this command

> [snip]

> It works for me; I get:

> Real UID        =3D 1001
> Effective UID   =3D 80
> Real UID        =3D 1001
> Effective UID   =3D 1001
> Real UID        =3D 1001
> Effective UID   =3D 80

> This is with a 2.6.17.13 kernel, compiled from stock sources (no
> vendor patches).

> If you are using a kernel with additional security features (e.g.=20
> SELinux, AppArmor etc), it may impose additional restrictions on
> setuid(). You could try using setreuid() to swap the real and
> effective UIDs, rather than relying upon the saved UID.




--=20
Cihan K=F6me=E7o=F0lu,
EnderUNIX SDT                           mailto:cihan@enderunix.org

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
