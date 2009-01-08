From: ninjaboy <n0b0dyn1nj4@gmail.com>
Subject: Re: c preprocessor expansion
Date: Thu, 8 Jan 2009 19:11:45 +0100
Message-ID: <a3399010901081011p607d688es98a4ca77581b0a88@mail.gmail.com>
References: <ef37ea20901080949i2cd875fbk58b4ae3605655812@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=G6uN3PV0dqGn7qo8u30ERXuFsssH9IJq/FjgOOeZqgw=;
        b=wB8vV0MW7Z27TZ2F0mjWKr8E/XKcnDfpquNlXifdDephqP12oHiO62AqPndl+VSTNZ
         PZ1twkHXHTXDXj414F5GJUvzKcQr7l5wz6QrI8m2eqPvmF2JxftfEYQuLFdjm5xrCB6E
         hVtsjdO3rQtQ8gPnwsN9hBAciWSaDhSnif4Qk=
In-Reply-To: <ef37ea20901080949i2cd875fbk58b4ae3605655812@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Task Struct From Hell <taskstructfromhell@googlemail.com>
Cc: linux-c-programming@vger.kernel.org

2009/1/8 Task Struct From Hell <taskstructfromhell@googlemail.com>:
> Hi,
>
> I was wondering if gcc has any argument which allows for the expansion
> of all macros in a file, just so if we have something like the
> following:
>
>
> #define FOO "bar"
>
> int main() {
>   printf(FOO);
> }
>
> It will output this:
>
> int main() {
>   printf("bar");
> }
>

gcc -E code.c -o codemacro.m

-- 
noone is alone.
