From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Start of the time slice
Date: Mon, 5 Jul 2004 11:39:01 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16617.12229.734613.647925@cerise.nosuchdomain.co.uk>
References: <7F11C0CADA50AF4690BF42F715ABFBF86468B1@battaexch22.mol.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <7F11C0CADA50AF4690BF42F715ABFBF86468B1@battaexch22.mol.hu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-2?Q?Nagy_Imre_=28Vecs=E9s=29?= <ImreNagy@MOL.hu>
Cc: linux-c-programming@vger.kernel.org


Nagy Imre (Vecs=1B-B=E9s) wrote:=1B-A

> Excuse me, my English is limited, but I try to formulate clearly.
>=20
> I would like to konw how many unexpired time is in my process. The no=
rmal
> time slice (10ms) is enough for me, but I want to get run my function=
 right
> at the start of time slice.=20

Try calling sched_yield(), or nanosleep() with a delay of 1ns.

--=20
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
