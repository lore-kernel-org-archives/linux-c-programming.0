From: Reinaldo Nolasco Sanches <r_linux@yahoo.com>
Subject: Alignment of variables in gcc
Date: Sat, 23 Nov 2002 15:42:07 -0800 (PST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021123234207.35576.qmail@web14402.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-c-programming@vger.kernel.org


Sorry for this question here... but anybody have any good doc with explain =
this ???

i.e
In a struct is I put=20

typedef struct myStruct {
  char variable1;
  int variable2;
} myStruct;

The sizeof() myStruct is 8, I read some documents and see with this not a b=
ug, this occurs because
"Alignment requeriments"...

Anybody can explais this or have any documents for a newbie... I need of a =
great explanation with
images and text :)

Sorry for my bad english too...

Thanks in Advance... and not hate me.



=3D=3D=3D=3D=3D
"When you know Slackware, you know Linux... when you know Red Hat, all you =
know is Red hat"

- I haven't lost my mind -- it's backed up on tape somewhere.
- Power doesn't corrupt people, people corrupt power.

- r_linux@yahoo.com -- http://slackware.linuxbr.org
- UIN: 42853394 - irc.brasnet.org(#slackware)

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus =96 Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-programmi=
ng" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
