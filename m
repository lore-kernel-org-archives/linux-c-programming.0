From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: UDP message boundary
Date: Sat, 20 Oct 2012 23:55:29 +0200
Message-ID: <CADtGFvk=3WXBT93Vd94FGmhxs5ENgBfU23K-WZ7=Qu8V1qa_8g@mail.gmail.com>
References: <CAA6iF_7Hmu4c2FyGFRUw12QxK=t_tMvyu_xhMUjFGe7fCTxw5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=Dc66yAgZDRlC3Aw196VJmMzMvoDo3wAItz2pp29ZDso=;
        b=OrsxMIeuwgVn5PA+oqm4y+n8BxIS/62Ja+4X1wjXx5pbK1fqV1tVfCQ1PxC2kJw2u6
         XFcA+lWk6t5PFI3/8a08jFfuzNvTF8OS5Q6O2zWzsVGJFXzHS4ElZ1QlNIONVF1ZPMm2
         AcKnfUdU7ayU8BOv6IOCSpy0QufRXh4nhp8YQ8jGHDKmqIlSaJOI66W20P0U8Fw7E+4V
         QZJbcbp5JtHUOXc7+bzf5ponlf84miMwv3sCnEgjOGZZZUhGMk/Tt9hJ2HDNFVTGyYlT
         Tfj052ysg4WkeFpFoV+jTP8DC9jFXfq24c2ECWIVP/bBU6Or6qtsJsWIlaF94rk7fR4J
         vzRQ==
In-Reply-To: <CAA6iF_7Hmu4c2FyGFRUw12QxK=t_tMvyu_xhMUjFGe7fCTxw5Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Mon, Oct 15, 2012 at 6:50 AM, Randi Botse <nightdecoder@gmail.com> w=
rote:
> Hi All
>
> When using TCP socket, I loop send() or recv() until ALL the data has
> been transmitted (or error, disconnect, etc.), because TCP socket
> packet is transmitted in stream nature, maybe a byte, bytes or all
> bytes in one transfer.

TCP is like a water tap (a character device) that you need to "format"
yourself with boundaries/etc.

> The UDP socket preserve message boundary which TCP socket doesn't.
> Does this means single call to sendto() will processed by single call
> recvfrom()?, and how about packet that exceeds UDP data MAX size?.

UDP is more like a block device, a letter/package sent. It's only the
single packet that is sent, and only that same single packet that will
be received (or go missing in the post)

I believe the error you might be refering to is  this one from a Linux
2.6 based Ubuntu 6.0.5 man page for recvfrom:

<quote man recv(2)>
       All  three  routines  return the length of the message on
successful completion.  If a message is too long to fit in the sup=E2
       plied buffer, excess bytes may be discarded depending on the
type of socket the message is received from.
<snip>
(recv(2) flags orred together:)
       MSG_TRUNC (since Linux 2.2)
              For  raw  (AF_PACKET),  Internet datagram (since Linux
2.4.27/2.6.8), and netlink (since Linux 2.6.22) sockets: return
              the real length of the packet or datagram, even when it
was longer than the passed buffer.  Not implemented  for  Unix
              domain (unix(7)) sockets.

<snip>
(recvmsg(2) flags return status:)
       MSG_TRUNC
              indicates that the trailing portion of a datagram was
discarded because the datagram was larger than the  buffer  sup=E2
              plied.
</quote>

In other words, you have been sent a 1024byte long packet with
sentto(2), but recvfrom(2) only had a 900 bytes buffer, then sorry,
you've lost 124 bytes.
Looking at the recv(2) manual page, I recall that recv(2)/recvfrom(2)
will return the size of the packter received, so if you've provided a
65535 byte buffer, and was only sent 1024bytes, then
recv(2)/recvfrom(2) will return the 1024bytes answer.

> So in code, do I need to loop sendto() or recvfrom() to transmit the =
data?.

It depends on the data being sent, but for every sendto(2), you will
need a single recv(2)/recvfrom(2) with a correctly sized buffer to
receive that single message.

> Example codes is:
>
> char packet[100];
> size_t nbytes =3D 0;
> int ret;
>
> while (nbytes < sizeof(packet)) {
>     ret =3D recvfrom(socket, packet + nbytes, addr, 0,  sizeof(packet=
) - nbytes);
>     if (ret <=3D 0) {
>         /* deal with recvfrom() error */
>     }
>     nbytes +=3D ret
> }

That is TCP, for UDP you will have something like:

sender:

char buffer[1024];
int size_of_data=3Dfill_buffer_withdata(buffer,1024);
sendto(socket,buffer,size_of_data,flags);


receiver:
chat buffer [1024];
int size_of_data=3Drecv(socket,buffer,1024,flags);
if size_of_data>1024
then
 throw_error
else
 do_something_with_data(buffer,size_of_data);
end

there are another method, using MSG_PEEK in the flags before reading
the real data and remove that from the queue,

>
>
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
