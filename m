From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: type qualifiers on function return types?
Date: Fri, 9 Dec 2005 19:25:54 +0000
Message-ID: <17305.55874.776271.548409@cerise.gclements.plus.com>
References: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain>
	<6a00c8d50512080858n70ef1937n8ccc2c96b9eb799c@mail.gmail.com>
	<001401c5fc1e$d7963110$8e01a8c0@Nate>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <001401c5fc1e$d7963110$8e01a8c0@Nate>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nate Jenkins <nate@uniwest.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Nate Jenkins wrote:

> I am sure I am not the only one here wondering what "type qualifiers"=
 are.
> Could someone expound on what they are and why one would use them?

=46or a precise definition, see =A76.7.3 of the C99 draft, at:

	http://www.open-std.org/jtc1/sc22/open/n2794/n2794.txt

The most useful is "const", which tells the compiler to generate a
warning if anything tries to modify the target. Also, if a function
argument is a pointer to a const target, the compiler can assume that
the target will not be modified.

The "volatile" qualifier indicates that any reads or writes must be
performed exactly as indicated by the code, and cannot be optimised
away (e.g. caching the value in a register).

It is used if the target can be read or written by mechanisms which
aren't visible to the compiler (hardware, other threads, signal
handlers, etc).

The "restrict" qualifier is new in C99 and allows additional
optimisations. It only applies to pointers, and asserts that the
location to which the pointer points will only be read or written
through that pointer.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
