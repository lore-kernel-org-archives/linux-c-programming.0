From: =?ISO-8859-1?Q?Beno=EEt?= Rouits <brouits@free.fr>
Subject: Re: Getting pid of exec'd process
Date: Thu, 22 Mar 2007 17:31:42 +0100
Message-ID: <1174581102.16532.2.camel@chimay>
References: <4602646F.3040906@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4602646F.3040906@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Cc: linux-c-programming@vger.kernel.org

hello Prasanta, maybe you can look at=20
http://patatra.mine.nu/cash/cash.tar.gz

it contains a shell of 160 line of code that uses fork() and execvp()
maybe the source code can help you to learn.
Hope this helps.
+ Ben

Le jeudi 22 mars 2007 =C3=A0 16:41 +0530, Prasanta Sadhukhan a =C3=A9cr=
it :
> Hi,
>=20
> Can anyone suggest as to how can I get the pid of the process which I=
=20
> have done execv()?
> ie, if I do execv(path, cmd) a new process will be launched and now h=
ow=20
> can I get the pid of this new process?
>=20
> Regard
> Prasanta
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
