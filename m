From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Help on a memory leak issue
Date: Mon, 11 Jan 2010 20:37:51 +0000
Message-ID: <19275.35871.267090.666667@cerise.gclements.plus.com>
References: <8eec89ee1001110705k3257bd80r2a719a67b0bda641@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <8eec89ee1001110705k3257bd80r2a719a67b0bda641@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?VcSfdXIgQVRB?= <ataugur@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


U=C4=9Fur ATA wrote:

> I have a client server application which uses a local file socket.
> When i connect to the server part and then close the connection the
> memory usage stays the same indicating that the resources aren't
> freed. Other then this memory leak problem everything is working fine=
=2E
> Messeages are sent and received. After each message is sent/received
> rss indicator in the ps command increases with different amounts for
> each different message. When the rss reaches around 64MB the program
> stops working and freezes. Then it needs to be restarted.
> I couldn't find a solution to this problem anywhere on the web so
> thanks in advance if someone could be of help.
> Below is the result of uname -a:
> Linux server 2.6.27.7-smp #2 SMP Thu Nov 20 22:32:43 CST 2008 i686
> Pentium III (Katmai) GenuineIntel GNU/Linux
> Slackware 12.2 is running on that kernel and my source for the server=
 part is:

Whatever is causing the leak isn't in the portion of the code which
you posted.

Also:

> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr_un client_name;
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0socklen_t client_name_len =3D 0; // =
it should be >=3D 0 otherwise accept returns EINVAL
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0int client_socket_fd;
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0client_socket_fd =3D accept(socket_f=
d, &client_name, &client_name_len);

If you want accept to initialise client_name, you should initialise
client_name_len to the size of the buffer, i.e.:

	client_name_len =3D sizeof client_name;

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
