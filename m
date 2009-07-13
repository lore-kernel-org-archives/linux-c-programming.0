From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: Help on pipe
Date: Mon, 13 Jul 2009 08:45:34 +0200
Message-ID: <op.uwzud8p07p4s8u@amdc030.digital.local>
References: <34e1241d0907092322h5aea016cj437168a43ebfe50e@mail.gmail.com>
 <op.uwubc1lg7p4s8u@amdc030.digital.local>
 <19031.32022.804076.200185@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <19031.32022.804076.200185@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Ardhan Madras <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org

>>>     waitpid(pid, &ret, 0);
>>>     close(fds[1]);

> Micha=C5=82 Nazarewicz wrote:
>> No need to close.

On Fri, 10 Jul 2009 19:40:38 +0200, Glynn Clements =20
<glynn@gclements.plus.com> wrote:
> There definitely is a need to close, but it should be fclose(stream)
> *before* the waitpid(). As David points out, sort won't terminate
> until it has finished reading its input.

Yes, yes... David already pointed out the problem is with EOF not =20
buffering.

--=20
Best regards,                                            _     _
  .o. | Liege of Serenly Enlightened Majesty of         o' \,=3D./ `o
  ..o | Computer Science,  Micha=C5=82 "mina86" Nazarewicz      (o o)
  ooo +-<m.nazarewicz@samsung.com>-<mina86@jabber.org>-ooO--(_)--Ooo--

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
