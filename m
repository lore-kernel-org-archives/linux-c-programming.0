From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Help on pipe
Date: Fri, 10 Jul 2009 18:40:38 +0100
Message-ID: <19031.32022.804076.200185@cerise.gclements.plus.com>
References: <34e1241d0907092322h5aea016cj437168a43ebfe50e@mail.gmail.com>
	<op.uwubc1lg7p4s8u@amdc030.digital.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <op.uwubc1lg7p4s8u@amdc030.digital.local>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Cc: Ardhan Madras <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org


Micha=B3 Nazarewicz wrote:

> >     waitpid(pid, &ret, 0);
> >     close(fds[1]);
>=20
> No need to close.

There definitely is a need to close, but it should be fclose(stream)
*before* the waitpid(). As David points out, sort won't terminate
until it has finished reading its input.

David Lee wrote:

> The sort program is waiting for an EOF (^D).

Ctrl-D isn't EOF unless you're reading from a terminal. The TTY driver
"sends EOF" (i.e. causes read() to return a zero count) when you press
Ctrl-D (by default) if the driver is in canonical mode. Ctrl-D doesn't
have any significance in other contexts.

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
