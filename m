From: Mateus Interciso <p.zarnick@gmail.com>
Subject: Creating a routing program - the basics
Date: Tue, 23 Oct 2007 10:44:25 +0000 (UTC)
Message-ID: <ffkja9$io8$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hello, I'm currently on university, and for my graduation paper, I'll b=
e=20
implementing a routing algorythm, by hand, in C.
The routing algorythm itself is not easy, but one of the starting parts=
=20
of it, is to find a way of discovering the MAC that it is currently=20
connected to, maybe is bether if I draw, since I'm not really that good=
=20
in english:

[PC with n NICs]-----(n cables)---->[n PCs]

I have full control of the first PC, of course, since is the one I'm=20
implementing the router, so I do know the MAC of it, but how to discove=
r=20
the MAC on the other end of the n lines, so I can start sending packets=
?
Anyone could help me imp=C4=BAementing this exact thing? I think I got =
the=20
theory right, but I have no clue how to start programing.

Thanks a lot.

Mateus

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
