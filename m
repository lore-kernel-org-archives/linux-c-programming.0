From: Javier Martinez Canillas <martinez.javier@gmail.com>
Subject: Re: close() on tcp socket.
Date: Wed, 6 Apr 2011 13:54:46 +0200
Message-ID: <BANLkTi=kMZHoeef90BFNG-hmo-c4VAzR0w@mail.gmail.com>
References: <BANLkTimLJ4k1KzmzHkz10JvL9HTyb0y+WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=VrRBVCkAtIFeypCHThLHkoJ1kfIOWFGilGfI7VEIa1g=;
        b=ugxgL6p058vSxNKPcEeWdCSlgTl4uuTo+FWiNYp47998kemvEFH/f2+W00LmO+6GJ1
         ivy6rx2b2tel7AziSanNLsU8O0TPRb9mVGAD8IYeX4ze5arCv0CdhVZjtXQf50RkHc8U
         jWApARDEdR35tZ/Jd0K0hK/2VIsFFoJWwSD/g=
In-Reply-To: <BANLkTimLJ4k1KzmzHkz10JvL9HTyb0y+WQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On Wednesday, April 6, 2011, ratheesh kannoth <ratheesh.ksz@gmail.com> =
wrote:
> connect() system call establishes a connection as shown in below step=
s.
>
> 1. =C2=A0 |client | =C2=A0----------------- syn ---------------> =C2=A0=
| server |
>
> 2. =C2=A0|Server| =C2=A0--------------syn+ ack --------------> | clie=
nt |
>
> 3. =C2=A0| Client | -----------------ack --------------------> | Serv=
er |
>
>
> But establishing connection , client calls close() system call. Clien=
t
> is sending FIN+ ACK to server =C2=A0[ i expected only FIN to be sent =
from
> client to server ]
>
> Is this a valid scenario.? =C2=A0what could be the problem ?
>
>
> -Ratheesh

The problem is that both sides can never coordinate to close the
connection. So TCP does the best it can. It notifies the other side
that the connection will be closed and start a timer. If the othet
side gets the FIN + ACK its send an ACK. When the sender gets the ACK
closes the connection. If the ACK doesnt arrive and the timer expires,
it just close the connection, the other side will eventually will
notice that the connection was closed so it will also close its side.
So you dont need a handshacking protocol. In fact you cant design a
robust protocol. This is a particular case of a more general problem
known as the two army problem [1]

[1] http://en.m.wikipedia.org/wiki/Two_Generals'_Problem

Hope it helps,
Javier

--=20
-----------------------------------------
Javier Mart=C3=ADnez Canillas
(+34) 682 39 81 69
PhD Student in High Performance Computing
Computer Architecture and Operating System Department (CAOS)
Universitat Aut=C3=B2noma de Barcelona
Barcelona, Spain
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
