From: Canaan Kao <canaan.kao@gmail.com>
Subject: Re: Socket programming
Date: Sun, 22 Mar 2009 23:24:33 +0800
Message-ID: <160bbd1a0903220824o14c100eeqc28f8a745b62228b@mail.gmail.com>
References: <20090322063116.1C31F627@resin17.mta.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=tQRogn3gjZ/k4FWP9KXtARfwbMexxt5ont0vZqYXCq4=;
        b=u7NHGsnJEye4w4F6EQSY8+Z6uTQrelvB94/DH0IYW9Ppx6I98h6GTAm6F34SyxFpbr
         3G+gMq8ji2bRGKZnBcUrmtVblbpM0U4YmJbw4h8uZqF6Ht1ccD6Qkse2+7p2kbdulBu0
         a2JKucPVxyEOna+4HL2fVfnGqq4OWWM0DZhW0=
In-Reply-To: <20090322063116.1C31F627@resin17.mta.everyone.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ajhwb@knac.com
Cc: linux-c-programming@vger.kernel.org

Dear Ardhan,

We need to allocate the bar->name manually in general.

About the related socket programming issues, I recommend you one book.
UNIX Network Programming, Volume 1, Second Edition: Networking APIs:
Sockets and XTI, Prentice Hall, 1998, ISBN 0-13-490012-X.

Best regards,
Canaan

On Sun, Mar 22, 2009 at 9:31 PM, Ardhan Madras <ajhwb@knac.com> wrote:
> Dear Canaan,
>
> Thanks for your reply. It's a great clue :)
> btw, i have one more question...
>
> In the receiver, do i need to allocate for example
> bar->name member manually? or it's done by recv() ?
>
>
> --- canaan.kao@gmail.com wrote:
>
> From: =A0 Canaan Kao <canaan.kao@gmail.com>
> To: =A0 =A0 ajhwb@knac.com
> Cc: =A0 =A0 linux-c-programming@vger.kernel.org
> Subject: Re: Socket programming
> Date: =A0 Sun, 22 Mar 2009 21:00:14 +0800
>
> Dear Ardhan,
>
> You can add a mySize data member in struct foo.
>
> struct foo
> =A0{
> =A0unsigned mySize;
> =A0char *name;
> =A0char *pix;
> =A0int id;
> =A0};
>
>
> =A0struct foo *bar =3D malloc (sizeof(struct foo));
>
> =A0if(NULL!=3Dbar)bar->mySize=3Dsizeof(struct foo);
>
> =A0/* fill the structure, then send */
>
> Finally, your receiver will get the size of foo in the beginning of t=
he stream.
>
> Best regards,
> Canaan
>
> On Sun, Mar 22, 2009 at 8:42 PM, Ardhan Madras <ajhwb@knac.com> wrote=
:
>> Hi All,
>>
>> I was written small network utility in Linux 2.6, glibc 2.7.
>> I have been using send() and recv() system call in SOCK_STREAM
>> to send or receive fixed size data. for example, i write my data
>> structure like this:
>>
>> struct foo
>> {
>> =A0char name[16];
>> =A0char pix[1024];
>> =A0int id;
>> } bar;
>>
>> If i want to send or receive data i just call
>>
>> send (socket, &bar, sizeof(struct foo), 0);
>>
>> or to receive:
>> recv (socket, &bar, sizeof(struct foo), 0);
>>
>> My problem is how to receive dynamic sized data? for
>> example this structure:
>>
>> struct foo
>> {
>> =A0char *name;
>> =A0char *pix;
>> =A0int id;
>> }
>>
>> struct foo *bar =3D malloc (sizeof(struct foo));
>> /* fill the structure, then send */
>>
>> How to receive the data? since there are no way
>> to the receiver to know data sizes?
>>
>> Thanks for your help.
>>
>>
>> _____________________________________________________________
>> Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.=
knac.com
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-c-pr=
ogramming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
>
>
> _____________________________________________________________
> Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.k=
nac.com
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
