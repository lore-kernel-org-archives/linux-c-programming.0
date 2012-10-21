From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: UDP message boundary
Date: Sun, 21 Oct 2012 16:46:58 +0700
Message-ID: <CAA6iF_6_8oU_XuxQb=1jpojUZmE0_WXO6nT3U-81G3CWEsqKcg@mail.gmail.com>
References: <CAA6iF_7Hmu4c2FyGFRUw12QxK=t_tMvyu_xhMUjFGe7fCTxw5Q@mail.gmail.com>
	<CADtGFvk=3WXBT93Vd94FGmhxs5ENgBfU23K-WZ7=Qu8V1qa_8g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=n7SHQwtB1qy6UA1CnvCgHmVe/I2YCOVxBHgabddKo5g=;
        b=pP9R0fETtAOlXfwvt0emAkVELQ5OuIXLQYA7Ax5H+e8FOCfMdQJKcVqzHWRnVb+KTU
         KVmhn5n04ydYnOA0+7pFJZ/hDeijKg0wH49loH2hpUN9zTx/o67Tb8L9aoy2Qt1G19XA
         RwK4Ls34zfc6ALKWP1ro0m0s4Rtd3lZMqQ+IcugckS3DWZW62QAPWrGV+TJRkX0HbFmq
         YKamZLDlHGYIWguaYxWXewqnQdlV7vdR8bvHykbscCgyD7YmdqueT7MBmWjlaEyf4vJ+
         68h6eZb9iitD37nnXPbEyqAjgxFtaME9OkyUC9BV/j6VqldNYUc7zq/vEnXeQDGVeWK4
         2WfQ==
In-Reply-To: <CADtGFvk=3WXBT93Vd94FGmhxs5ENgBfU23K-WZ7=Qu8V1qa_8g@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hendrik Visage <hvjunk@gmail.com>
Cc: linux-c-programming@vger.kernel.org

This is very clear and complete answer.

Thanks You!

Regards.

On Sun, Oct 21, 2012 at 4:55 AM, Hendrik Visage <hvjunk@gmail.com> wrot=
e:
> On Mon, Oct 15, 2012 at 6:50 AM, Randi Botse <nightdecoder@gmail.com>=
 wrote:
>> Hi All
>>
>> When using TCP socket, I loop send() or recv() until ALL the data ha=
s
>> been transmitted (or error, disconnect, etc.), because TCP socket
>> packet is transmitted in stream nature, maybe a byte, bytes or all
>> bytes in one transfer.
>
> TCP is like a water tap (a character device) that you need to "format=
"
> yourself with boundaries/etc.
>
>> The UDP socket preserve message boundary which TCP socket doesn't.
>> Does this means single call to sendto() will processed by single cal=
l
>> recvfrom()?, and how about packet that exceeds UDP data MAX size?.
>
> UDP is more like a block device, a letter/package sent. It's only the
> single packet that is sent, and only that same single packet that wil=
l
> be received (or go missing in the post)
>
> I believe the error you might be refering to is  this one from a Linu=
x
> 2.6 based Ubuntu 6.0.5 man page for recvfrom:
>
> <quote man recv(2)>
>        All  three  routines  return the length of the message on
> successful completion.  If a message is too long to fit in the sup=E2
>        plied buffer, excess bytes may be discarded depending on the
> type of socket the message is received from.
> <snip>
> (recv(2) flags orred together:)
>        MSG_TRUNC (since Linux 2.2)
>               For  raw  (AF_PACKET),  Internet datagram (since Linux
> 2.4.27/2.6.8), and netlink (since Linux 2.6.22) sockets: return
>               the real length of the packet or datagram, even when it
> was longer than the passed buffer.  Not implemented  for  Unix
>               domain (unix(7)) sockets.
>
> <snip>
> (recvmsg(2) flags return status:)
>        MSG_TRUNC
>               indicates that the trailing portion of a datagram was
> discarded because the datagram was larger than the  buffer  sup=E2
>               plied.
> </quote>
>
> In other words, you have been sent a 1024byte long packet with
> sentto(2), but recvfrom(2) only had a 900 bytes buffer, then sorry,
> you've lost 124 bytes.
> Looking at the recv(2) manual page, I recall that recv(2)/recvfrom(2)
> will return the size of the packter received, so if you've provided a
> 65535 byte buffer, and was only sent 1024bytes, then
> recv(2)/recvfrom(2) will return the 1024bytes answer.
>
>> So in code, do I need to loop sendto() or recvfrom() to transmit the=
 data?.
>
> It depends on the data being sent, but for every sendto(2), you will
> need a single recv(2)/recvfrom(2) with a correctly sized buffer to
> receive that single message.
>
>> Example codes is:
>>
>> char packet[100];
>> size_t nbytes =3D 0;
>> int ret;
>>
>> while (nbytes < sizeof(packet)) {
>>     ret =3D recvfrom(socket, packet + nbytes, addr, 0,  sizeof(packe=
t) - nbytes);
>>     if (ret <=3D 0) {
>>         /* deal with recvfrom() error */
>>     }
>>     nbytes +=3D ret
>> }
>
> That is TCP, for UDP you will have something like:
>
> sender:
>
> char buffer[1024];
> int size_of_data=3Dfill_buffer_withdata(buffer,1024);
> sendto(socket,buffer,size_of_data,flags);
>
>
> receiver:
> chat buffer [1024];
> int size_of_data=3Drecv(socket,buffer,1024,flags);
> if size_of_data>1024
> then
>  throw_error
> else
>  do_something_with_data(buffer,size_of_data);
> end
>
> there are another method, using MSG_PEEK in the flags before reading
> the real data and remove that from the queue,
>
>>
>>
>> Thanks
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-c-pr=
ogramming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
