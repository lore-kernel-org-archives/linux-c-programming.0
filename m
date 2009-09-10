From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: Division in loop
Date: Thu, 10 Sep 2009 14:01:18 +0700
Message-ID: <34e1241d0909100001u4a3b338crf225e7fc9083a806@mail.gmail.com>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
	 <20090908145838.GF947@comcast.net>
	 <19110.64410.498993.60369@cerise.gclements.plus.com>
	 <34e1241d0909081937y5ecbd0davf7edbba9d9b201a0@mail.gmail.com>
	 <34e1241d0909081939x2d20ab45t57fe3f760ae447d0@mail.gmail.com>
	 <19112.19543.594103.477988@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=zzHjqzD0JA20wJlWC+YtlObCUkaqMLcPH+mxv+jw9qA=;
        b=DF61kTyrdsx52VADR/Uw2MZcXh/kk+dIwPZ1K1SKequojBY2PHTAIL+xNjw/WPmimh
         wD4DoQ0B4zJ8fSbBH735lvYnAu+TLZ6rqKw3r5V6Cw2lmf0dcYejUJZvbKTgY3nxRLkK
         veH8V6OR2MHdySAjKErTOFkZsVDkMbkfAL3jo=
In-Reply-To: <19112.19543.594103.477988@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

Thanks Glynn for let me know that the void* pointer arithmetic is
undefined, and gcc automatically cast it to char* pointer... is this
because void* doesn't have a size? im curious when i do sizeof(void*),
my machine tell me sizeof(void*) is 4kb... i thnk when i do (void* +
1) that's means "4 kb after void*"?....

i run the code in GNOME terminal, that's means stdout connected to xterm?


On Thu, Sep 10, 2009 at 7:46 AM, Glynn Clements
<glynn@gclements.plus.com> wrote:
>
> Randi Botse wrote:
>
>> void *buffer; /* buffer, will be allocated */
>> ...
>
>>        ret = read(fdp, buffer + bytes, stat.st_size - bytes);
>
> Pointer arithmetic on a void* is undefined. gcc allows this as an
> extension, treating void* like char*, i.e. p+i is treated as
> (void*)((char*)p+i).
>
> For portability, define buffer as a char*.
>
>>        printf("\rcompleted: %i%%", progress); /* NO OUTPUT, UNTIL LOOP ENDED */
>>        fflush(stdout);
>
>> Then i see printf() never output the message until the loop has ended...
>> 'fdp' is a file descriptor to a local file, i send it through a serial
>> connection (RS232),
>
> Try checking the return value of printf() and fflush(), and errno upon
> error.
>
> Also, what is stdout connected to? A VT? An xterm? sshd?
>
> --
> Glynn Clements <glynn@gclements.plus.com>
>
