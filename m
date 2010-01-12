From: Sam Liao <phyomh@gmail.com>
Subject: Re: Help on a memory leak issue
Date: Tue, 12 Jan 2010 16:02:03 +0800
Message-ID: <da5b0fda1001120002je8f34e0lc8956ed8a88c55e@mail.gmail.com>
References: <8eec89ee1001110705k3257bd80r2a719a67b0bda641@mail.gmail.com>
	 <19275.35871.267090.666667@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=LkFRPBwRzaO0qJ6VJ+mp+Lbr9Nqpjboweix82zK1Yno=;
        b=U+j+XOpYJ4BWB7LS0aqTG2HEs7pXiwC5UkTRUd7TED7lpygfKSMzjJoPZxiPXHbVei
         mVOPiPe8I+53YDsYp6pu4fAfmjuHN5B7r84HLW6X7iKXX6KKzNtwdR9pUP8gZpWwySys
         g5VquunhUsg7zokqw6dNmomjXn4/vocZZHgCw=
In-Reply-To: <19275.35871.267090.666667@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: =?UTF-8?B?VcSfdXIgQVRB?= <ataugur@gmail.com>, linux-c-programming <linux-c-programming@vger.kernel.org>

Instead of read each line in details, have a try for valgrind.

-Sam

On Tue, Jan 12, 2010 at 4:37 AM, Glynn Clements
<glynn@gclements.plus.com> wrote:
>
> U=C4=9Fur ATA wrote:
>
>> I have a client server application which uses a local file socket.
>> When i connect to the server part and then close the connection the
>> memory usage stays the same indicating that the resources aren't
>> freed. Other then this memory leak problem everything is working fin=
e.
>> Messeages are sent and received. After each message is sent/received
>> rss indicator in the ps command increases with different amounts for
>> each different message. When the rss reaches around 64MB the program
>> stops working and freezes. Then it needs to be restarted.
>> I couldn't find a solution to this problem anywhere on the web so
>> thanks in advance if someone could be of help.
>> Below is the result of uname -a:
>> Linux server 2.6.27.7-smp #2 SMP Thu Nov 20 22:32:43 CST 2008 i686
>> Pentium III (Katmai) GenuineIntel GNU/Linux
>> Slackware 12.2 is running on that kernel and my source for the serve=
r part is:
>
> Whatever is causing the leak isn't in the portion of the code which
> you posted.
>
> Also:
>
>> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr_un client_name;
>> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0socklen_t client_name_len =3D 0; //=
 it should be >=3D 0 otherwise accept returns EINVAL
>> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0int client_socket_fd;
>> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0client_socket_fd =3D accept(socket_=
fd, &client_name, &client_name_len);
>
> If you want accept to initialise client_name, you should initialise
> client_name_len to the size of the buffer, i.e.:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0client_name_len =3D sizeof client_name;
>
> --
> Glynn Clements <glynn@gclements.plus.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
