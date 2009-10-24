From: Siddu <siddu.sjce@gmail.com>
Subject: getch() in linux
Date: Sat, 24 Oct 2009 15:04:30 +0530
Message-ID: <9b0a5b990910240234k35e91ba8kf1fd0917bf68d21d@mail.gmail.com>
References: <9b0a5b990910240207x766817c5t45b87c84349873e9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=peHeHf6vaFZq+21J0CTLqdOKLaf7lNx5e6Y6cDk7uOY=;
        b=Fau2I04ORDznkt16zI6cchf1Vg0//q4iRJUf85fbEpsj3N1DFdVZmW7eLABsvf8azr
         lth+Czgt+6z0teMztUy0BbgMHmnedB/wl3HOYHmA2pczbbMqAnsKANbfR6ytpAJGINm4
         uuSt/bHOw0K652Lc2v13ft6U/CvoocLFxxCd8=
In-Reply-To: <9b0a5b990910240207x766817c5t45b87c84349873e9@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming@vger.kernel.org

Hi all,

Please help me understand whats the use of getch() in linux

the man page says this ! but couldnt comprehend much out of it

=C2=A0The getch, wgetch, mvgetch and mvwgetch, routines read a characte=
r
from the window.=C2=A0 In no-delay mode, if no input is waiting,
=C2=A0the value ERR is returned.=C2=A0 In delay mode, the program waits=
 until
the system passes text through to the=C2=A0 program.=C2=A0=C2=A0 Depend=
ing
=C2=A0on=C2=A0 the setting of cbreak, this is after one character (cbre=
ak mode),
or after the first newline (nocbreak mode).=C2=A0 In half-de=E2=80=90
=C2=A0lay mode, the program waits until a character is typed or the
specified timeout has been reached.

what is delay mode they are talking about?

and can some one give me a simple example for it ?

do i ave to know abt ncurses to understand it ?


--
Regards,
~Sid~
I have never met a man so ignorant that i couldn't learn something from=
 him




--
Regards,
~Sid~
I have never met a man so ignorant that i couldn't learn something from=
 him
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
