From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: Re: malloc question
Date: Tue, 26 Apr 2011 16:24:05 +0530
Message-ID: <BANLkTinW-j2DiwbVC5u8BfJMU7jK3_KbwA@mail.gmail.com>
References: <BANLkTik1ZqN2cOqu65f380wfgOHQpwX7gg@mail.gmail.com>
	<BANLkTikCz0uyFkU2Df-hiAmmj+-ZRABdVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=4NTu9jghvo9KKPB8w5EYIAdPBXGKVX1oQD7//cj3nAc=;
        b=fknwckmFt2kKG1+vSqWm19jE1Qt/I/Hg/x/9+3g2DvofynwTzKZDCtIHQZZV2mbQ9T
         n4ra9afkc7f4LB2hhHr2To5siiMuXEWQOUy2CYQjg0TPkJIMwtcOyZ+4uHGpFqQWeeCI
         wz3dhv6CdEq6YIbTZVZgc6AogFYNe/Ekf5SFc=
In-Reply-To: <BANLkTikCz0uyFkU2Df-hiAmmj+-ZRABdVQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Randi Botse <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org

On Tue, Apr 26, 2011 at 4:10 PM, Daniel Baluta <daniel.baluta@gmail.com=
> wrote:
> On Tue, Apr 26, 2011 at 1:33 PM, Randi Botse <nightdecoder@gmail.com>=
 wrote:
>> Hi All,
>>
>> I want to ask malloc() behaviour, consider these codes;
>>
>> ...
>> char *ptr =3D malloc(1);
>> strcpy(ptr, "what");
>> puts(ptr);
>> ....
>>
>> Confusingly, the strcpy() copied all bytes to ptr, but I just manage
>> to allocate ptr only for 1 byte, I guess I will have segfault here,
>> why this happen? why the string successfully copied into ptr? , is
>> those code legal?
>
> You didn't get segfault because you were lucky.
>
> Memory is allocated in multiples of page size (usually 4K).
> The memory after your allocated byte is valid in your case.
>
> thanks,
> Daniel.
> --

U could read a little more about vm_page_struct. ( virtual address
space to  physical page ).  Try below code also for more
clarification.....

    char *ptr =3D malloc(1);
    strcpy(ptr, "what");
    free(ptr);
    strcpy(ptr, "hell");





> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
