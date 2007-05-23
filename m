From: Shriramana Sharma <samjnaa@gmail.com>
Subject: warning about anonymous type
Date: Wed, 23 May 2007 19:47:47 +0530
Message-ID: <46544D0B.30904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

I need to have a single global variable containing some members. I read=
=20
that using a singleton class is not recommended and really I don't have=
=20
a need for a class. So I just tested g++ -c on a code fragment:

---------------------------
struct {
	int a, b, c ;
} mystruct ;

class {
	int a, b, c ;
} myclass ;
---------------------------

g++ -c gives me the warnings:

singleton.cpp:7: warning: non-local variable =91<anonymous struct>=20
mystruct=92 uses anonymous type
singleton.cpp:13: warning: non-local variable =91<anonymous class>=20
myclass=92 uses anonymous type

However, testing the struct declaration in C does not give any warnings=
=2E=20
OK, C++ is pickier than C, so this is fine. But I don't really know wha=
t=20
to make of the warnings that g++ gave me. What is the potential problem=
=20
if a non-local variable has an anonymous type?

Apparently if a **local** variable has an anonymous type it is OK, sinc=
e=20
I did not get this warning when I put the mystruct and myclass=20
definitions into main(). But I don't get the logic behind:

1) the warning
2) the distinction between local and nonlocal in this case

Please explain.

With thanks as always,

Shriramana Sharma.

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
