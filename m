From: "Anil Vishnoi" <vishnoianil@gmail.com>
Subject: RE: Socket programming
Date: Fri, 27 Mar 2009 03:12:09 +0530
Message-ID: <000901c9ae5b$bc7549f0$355fddd0$@com>
References: <20090322063116.1C31F627@resin17.mta.everyone.net> <160bbd1a0903220824o14c100eeqc28f8a745b62228b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=pL2gUC3XjINyiIIRZewSG7RJZn0g2DJGL5Q00RNXld8=;
        b=GAVSd7igrZ4xMfOtMZwF7f1sKDR5EHIZ3LJWv+zn8jCT5ZZYvAX5fHu68QXVhi9h1w
         Fl8nYl4wlHTB0n9dtqTtz737OecckGz2VzUOfuKVLRjqtoH/Oa7AMGts5vg/E6otRYol
         5JFxkegUHami6B75ZzhAD+ge0mR+cgo9EVD7A=
In-Reply-To: <160bbd1a0903220824o14c100eeqc28f8a745b62228b@mail.gmail.com>
Content-Language: en-us
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Canaan Kao' <canaan.kao@gmail.com>, ajhwb@knac.com
Cc: linux-c-programming@vger.kernel.org

Ardhan,
Book suggested by Canaan is really good one, I also recommend.

Cheers
Anil=20

-----Original Message-----
=46rom: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of Canaan =
Kao
Sent: Sunday, 22 March 2009 20:55
To: ajhwb@knac.com
Cc: linux-c-programming@vger.kernel.org
Subject: Re: Socket programming

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
he
stream.
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
>> Listen to KNAC, Hit the Home page and Tune In Live! --->
http://www.knac.com
>> --
>> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
>
>
> _____________________________________________________________
> Listen to KNAC, Hit the Home page and Tune In Live! --->
http://www.knac.com
>
--
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
