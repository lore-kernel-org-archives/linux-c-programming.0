From: Thomas Steudten <alpha@steudten.com>
Subject: Re: cpp: memory exhausted
Date: Tue, 25 Nov 2003 23:38:16 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3FC3D9D8.4030904@steudten.com>
References: <000501c3b363$abe79140$caba0ba4@uwe.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000501c3b363$abe79140$caba0ba4@uwe.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Matthew Studley <matthew.studley@uwe.ac.uk>
Cc: linux-c-programming@vger.kernel.org

Hi

Check the ulimit -Sa (Soft) values with the values from ulimit -Ha=20
(Hardvalues) and increment the -v value for virtual memory usage.
I think there=B4s the problem. Maybe you should add more swap space.


> But now I get the message:
>=20
> cpp: memory exhausted
>=20
> I have rebooted, physically switched off and on - still the same prob=
lem!

--=20
Tom

LINUX user since kernel 0.99.x 1994.
RPM Alpha packages at http://alpha.steudten.com/packages
Want to know what S.u.S.E 1995 cdrom-set contains?


-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
