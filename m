From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: Division in loop
Date: Thu, 10 Sep 2009 12:33:27 +0530
Message-ID: <ea11fea30909100003u60a59257k7645b9edf2b0ca76@mail.gmail.com>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com> 
	<20090908145838.GF947@comcast.net> <19110.64410.498993.60369@cerise.gclements.plus.com> 
	<34e1241d0909081937y5ecbd0davf7edbba9d9b201a0@mail.gmail.com> 
	<34e1241d0909081939x2d20ab45t57fe3f760ae447d0@mail.gmail.com> 
	<19112.19543.594103.477988@cerise.gclements.plus.com> <34e1241d0909100001u4a3b338crf225e7fc9083a806@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=ZORGu/u+mh3GnGbEf0vYpjiMAFCNvQIS4jetktXsjOg=;
        b=KBYxYmIjtgROoxYXiUaK1H5luJUss5Jww+5lSSXSRt+byg+CUhZK0TBx1Hy/MAmeEo
         rdODDjGcBDrhAtwZL+h/xMiCby3+KMdOt8DmPxNe/4SLhsM9uSzKH9icNqddyXIZ9kIU
         Opu82QATcn/lb47ztiyvjktZE6zJUd8MPD3e4=
In-Reply-To: <34e1241d0909100001u4a3b338crf225e7fc9083a806@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

On Thu, Sep 10, 2009 at 12:31 PM, Randi Botse <nightdecoder@gmail.com> =
wrote:
> Thanks Glynn for let me know that the void* pointer arithmetic is
> undefined, and gcc automatically cast it to char* pointer... is this
> because void* doesn't have a size?
void * or any pointer for that matter will have a size fixed based on
your platform ie... 4 for x86 and 8 for x86_64.
> im curious when i do sizeof(void*),
> my machine tell me sizeof(void*) is 4kb

That is 4 bytes and not 4KB.

> ... i thnk when i do (void* +
> 1) that's means "4 kb after void*"?....
>
> i run the code in GNOME terminal, that's means stdout connected to xt=
erm?
>
>
> On Thu, Sep 10, 2009 at 7:46 AM, Glynn Clements
> <glynn@gclements.plus.com> wrote:
>>
>> Randi Botse wrote:
>>
>>> void *buffer; /* buffer, will be allocated */
>>> ...
>>
>>> =A0 =A0 =A0 =A0ret =3D read(fdp, buffer + bytes, stat.st_size - byt=
es);
>>
>> Pointer arithmetic on a void* is undefined. gcc allows this as an
>> extension, treating void* like char*, i.e. p+i is treated as
>> (void*)((char*)p+i).
>>
>> For portability, define buffer as a char*.
>>
>>> =A0 =A0 =A0 =A0printf("\rcompleted: %i%%", progress); /* NO OUTPUT,=
 UNTIL LOOP ENDED */
>>> =A0 =A0 =A0 =A0fflush(stdout);
>>
>>> Then i see printf() never output the message until the loop has end=
ed...
>>> 'fdp' is a file descriptor to a local file, i send it through a ser=
ial
>>> connection (RS232),
>>
>> Try checking the return value of printf() and fflush(), and errno up=
on
>> error.
>>
>> Also, what is stdout connected to? A VT? An xterm? sshd?
>>
>> --
>> Glynn Clements <glynn@gclements.plus.com>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Thanks -
Manish
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
