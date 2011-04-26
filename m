From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: malloc question
Date: Tue, 26 Apr 2011 13:40:07 +0300
Message-ID: <BANLkTikCz0uyFkU2Df-hiAmmj+-ZRABdVQ@mail.gmail.com>
References: <BANLkTik1ZqN2cOqu65f380wfgOHQpwX7gg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=T0ApL6ZNGnyV/qiXRM3pedaxLW/Ure3KSa8E28Qwudo=;
        b=gipz8OxsVOvQskWG3kYOASx41JYwM69hlbhe+SH9qs12KQmnrEouNvjD0mSJdtMfpz
         YAVu6F7Ss4ZYBV9aHJr6FyplGfJxWqkUhUgVCtS7xIeCupE4UsWFkPaWhCnW+gk2vlIy
         kFpP4GkhWqHqYyEGlpyIA1D8NqxFz5I21TiZw=
In-Reply-To: <BANLkTik1ZqN2cOqu65f380wfgOHQpwX7gg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, Apr 26, 2011 at 1:33 PM, Randi Botse <nightdecoder@gmail.com> wrote:
> Hi All,
>
> I want to ask malloc() behaviour, consider these codes;
>
> ...
> char *ptr = malloc(1);
> strcpy(ptr, "what");
> puts(ptr);
> ....
>
> Confusingly, the strcpy() copied all bytes to ptr, but I just manage
> to allocate ptr only for 1 byte, I guess I will have segfault here,
> why this happen? why the string successfully copied into ptr? , is
> those code legal?

You didn't get segfault because you were lucky.

Memory is allocated in multiples of page size (usually 4K).
The memory after your allocated byte is valid in your case.

thanks,
Daniel.
