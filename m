From: Benoit Rouits <brouits@free.fr>
Subject: Re: Testing if a file or directory exist
Date: Sun, 09 Sep 2007 12:16:53 +0200
Message-ID: <1189333013.9615.2.camel@chimay>
References: <Pine.LNX.4.64.0709090907400.18317@diagnostix.dwd.de>
	 <Pine.LNX.4.64.0709090605220.31293@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0709090605220.31293@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming@vger.kernel.org

I think, as information are not needed, even access() is better than
stat() and also uses less memory/cpu.
- ben
Le dimanche 09 septembre 2007 =C3=A0 06:07 -0400, Robert P. J. Day a =C3=
=A9crit :
> if all you want to do is check for existence, then, execution time
> notwithstanding, you should use the method which accomplishes that an=
d
> nothing more, so the obvious solution would be stat().
>=20
> it would be illogical to call open() since a side-effect would be tha=
t
> you then had an open file.  in short, if you just want to test, then
> just test.=20
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
