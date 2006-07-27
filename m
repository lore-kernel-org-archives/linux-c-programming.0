From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: my server is blocking...
Date: Thu, 27 Jul 2006 21:37:55 +0200
Message-ID: <6a00c8d50607271237s611cc14ao47c877fb9715bd02@mail.gmail.com>
References: <78031e5e0607271217u2f60d430n42cacef776a26e2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <78031e5e0607271217u2f60d430n42cacef776a26e2@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 7/27/06, Norbert Fran=E7ois <norbertlike@gmail.com> wrote:
> Hi list,

Norbert,

> I'm a beginner in C (sockets) programming, so please, excuse my stupi=
d question.
>
> I'm trying to do a servent (server+client) for a p2p connexion. When =
I
> dissociate the client and the server, everything's all right. The
> Server is waiting for (pending) a connexion and when I connect on it,
> I've the behaviour I want.
>
> But now, I tried to merge the server & client together. When I start
> my program, the server is pending and the other part of my program
> isn't executed :( (the server is pending in an "accept" state). I
> tried to do some fork(), but it was useless (in fact, a new server is
> restarted and I get a bind error). How can I solve this problem
> (easily, if possible) ?

1.  A process always blocks in a call to accept() waiting for socket
descriptors to be fetched from the queue of incomplete connection
requests.  Usually, when accept() returns, another process is forked
or some thread created to serve the client.

2.  The bind() error you're probably observing is the famous "address
already in use" thing.  You can solve the issue by setting the
SO_REUSEADDR socket:

int on =3D 1;
setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on));

with s being the socket descriptor to set the option for.  The socket
option must be set before the call to bind().

There are some good documents on the Internet dealing design of
concurrent servers and I'd highly recommend to get your hands on W. R.
Stevens' classic "Unix Network Programming" which is considered to be
one of the most comprehensive guides on network programming with the
sockets API.  It's worth every penny.

	\Steve
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
