From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: my server is blocking...
Date: Thu, 27 Jul 2006 22:19:56 +0100
Message-ID: <17609.11772.345833.181191@cerise.gclements.plus.com>
References: <78031e5e0607271217u2f60d430n42cacef776a26e2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <78031e5e0607271217u2f60d430n42cacef776a26e2@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Norbert_Fran=E7ois?= <norbertlike@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Norbert Fran=E7ois wrote:

> I'm a beginner in C (sockets) programming, so please, excuse my stupi=
d question.
>=20
> I'm trying to do a servent (server+client) for a p2p connexion. When =
I
> dissociate the client and the server, everything's all right. The
> Server is waiting for (pending) a connexion and when I connect on it,
> I've the behaviour I want.
>=20
> But now, I tried to merge the server & client together. When I start
> my program, the server is pending and the other part of my program
> isn't executed :( (the server is pending in an "accept" state). I
> tried to do some fork(), but it was useless (in fact, a new server is
> restarted and I get a bind error). How can I solve this problem
> (easily, if possible) ?

You essentially have three choices:

1. Run the client and server in separate processes (i.e. fork()).
2. Run the client and server in separate threads.
3. Use select() or poll() to check that operations on sockets won't
block.

#1 is the easiest to implement, but it makes integrating the client
and server more awkward. #2 requires being able to write thread-safe
code, which can be quite complex.

#3 tends to be messy, as you have to allow for the fact that
read/write operations will often be incomplete, i.e. a read() may
return part of a request, then the next part may not arrive until
later, and you still need to service the other half (client/server) in
the meantime.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
