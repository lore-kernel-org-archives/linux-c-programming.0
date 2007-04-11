From: =?ISO-8859-1?Q?Beno=EEt?= Rouits <brouits@free.fr>
Subject: Re: fgets and ssh [resolved]
Date: Wed, 11 Apr 2007 17:23:47 +0200
Message-ID: <1176305028.7094.6.camel@chimay>
References: <1176293837.12452.10.camel@chimay>
	 <200704111001.28012.kratzers@pa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200704111001.28012.kratzers@pa.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: kratzers@pa.net
Cc: linux-c-programming@vger.kernel.org

Thank you very much Stephen, now it works with "-c command"
and so "scp" can also work.

Le mercredi 11 avril 2007 =C3=A0 10:01 -0400, Stephen Kratzer a =C3=A9c=
rit :
> When ssh is executed in the form 'ssh user@host command', the login
> shell of=20
> the user will be called like so: 'shell -c command'. That is, command=
s
> are=20
> not fed into the shell interactively on stdin, they're provided as
> arguments=20
> following a -c option flag.=20
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
