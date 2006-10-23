From: =?ISO-8859-1?Q?=22J=F8rgen_P=2E_Tjern=F8=22?= <jorgen@devsoft.no>
Subject: execve-type memory-based function, possible?
Date: Mon, 23 Oct 2006 11:19:58 +0200
Message-ID: <453C893E.9060901@devsoft.no>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi!

I've recently been toying with methods for copy-protection and other=20
esoteric subjects, for academic and hobby purposes, and I haven't found=
=20
much info on this subject.

I want to see if it's possible (from userspace) to load and execute an=20
ELF-binary based on a memory-buffer, i.e. load, relocate, etcetera (the=
n=20
execute) a program that's stored in memory.

I can't find any readily available options, I've toyed a bit with shmem=
=20
(to get an fd) and fexecve, but haven't gotten far. I've briefly looked=
=20
at the execve-code in the kernel.

So I'm curious; does anyone have any experience or suggestions on this=20
subject? Is it at all possible to do the operations via usermode? I've=20
toyed with creating copy-protection-schemes and binary packers and such=
=20
under Win32, where it's possible, but I have no experience on the=20
subject under Linux (or found any documentation on anyone else doing so=
).

Any papers, links, source-file-references etcetera would be appreciated=
=2E :-)

--=20
Kindest regards / Med vennlig hilsen,
  J=F8rgen P. Tjern=F8
  <jorgen@devsoft.no>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
