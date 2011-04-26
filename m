From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: malloc question
Date: Tue, 26 Apr 2011 13:57:56 +0300
Message-ID: <BANLkTikL+p2dBYBGKjwKkUUMYoPm7XxKGg@mail.gmail.com>
References: <BANLkTik1ZqN2cOqu65f380wfgOHQpwX7gg@mail.gmail.com>
	<BANLkTikCz0uyFkU2Df-hiAmmj+-ZRABdVQ@mail.gmail.com>
	<BANLkTinW-j2DiwbVC5u8BfJMU7jK3_KbwA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=L69LUEDycjyrQhb3+Ips1jJawLKJ4bfNVoMl0rQEYGI=;
        b=SC1ULz6FD1TqMp/dOzfIFOyMjUxpj4HITHXqNuwCtTtSk8elVvM/MC8d+Duj3uZcZC
         08LuAs1keG9ufLAO/f1av48zXKnYB/k21oANIeYCkpk7b29VoHPhdyGMsHWm9HVvERfi
         AfbjbZGZc6wWyAPk8i5yhcMU5zjtonUbVmpLU=
In-Reply-To: <BANLkTinW-j2DiwbVC5u8BfJMU7jK3_KbwA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: Randi Botse <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org

On Tue, Apr 26, 2011 at 1:54 PM, ratheesh kannoth
<ratheesh.ksz@gmail.com> wrote:
> On Tue, Apr 26, 2011 at 4:10 PM, Daniel Baluta <daniel.baluta@gmail.c=
om> wrote:
>> On Tue, Apr 26, 2011 at 1:33 PM, Randi Botse <nightdecoder@gmail.com=
> wrote:
>>> Hi All,
>>>
>>> I want to ask malloc() behaviour, consider these codes;
>>>
>>> ...
>>> char *ptr =3D malloc(1);
>>> strcpy(ptr, "what");
>>> puts(ptr);
>>> ....
>>>
>>> Confusingly, the strcpy() copied all bytes to ptr, but I just manag=
e
>>> to allocate ptr only for 1 byte, I guess I will have segfault here,
>>> why this happen? why the string successfully copied into ptr? , is
>>> those code legal?
>>
>> You didn't get segfault because you were lucky.
>>
>> Memory is allocated in multiples of page size (usually 4K).
>> The memory after your allocated byte is valid in your case.
>>
>> thanks,
>> Daniel.
>> --
>
> U could read a little more about vm_page_struct. ( virtual address
> space to =A0physical page ).

Can you elaborate on this?

Daniel.
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
