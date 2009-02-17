From: Bryan Christ <bryan.christ@gmail.com>
Subject: Re: strtok, bus error
Date: Mon, 16 Feb 2009 21:57:52 -0600
Message-ID: <444391460902161957h1f8cf10cl25cd8c57df55d33d@mail.gmail.com>
References: <125035.76273.qm@web63404.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=X5yAgGFk84L5xZDR9XDZQn23E4ePY4LhEjlbD8ilGbM=;
        b=G6Cln6Ur1YaGfFmzsHNTyG8lm8e7I8rQsHXDN5l4A8h0j58gPWOCgjBQeEDHMlJ+21
         fHSe7RzgS5sdIaJmDk6KigDR7/WmdSqZAu31UAv9SCTfrVb53ZURZCh4MsYX6PP5HlQs
         yROt8hWmASaa/uPraZe4LGBHVFu+Sw1HYdHkA=
In-Reply-To: <125035.76273.qm@web63404.mail.re1.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux-c-programming@vger.kernel.org

 char src[]  = "hello world #"; is an automatic variable (char array)
which is both read and write.
char *other = "hello world #"; is a char * (which points to a string)
of text allocated in the program's text (Data/BSS) area which is read
only.

On Mon, Feb 16, 2009 at 8:52 PM, Fundu <fundu_1999@yahoo.com> wrote:
> i'm trying to do pretty simple replacement using strtok.
> but it looks like i have missed some subtle difference between the two following
>
>  char src[]  = "hello world #";
>  char *other = "hello world #";
>
> because if i use "char * other" with strtok it fails with bus error but i use src it works, don't understand what's the difference.
>
> here's the code for strtok.
>     char delims[] = "#";
>     char *result = NULL;
>     // this works
>     result = strtok( src, delims );
>     // this doesnot work and give a bus error
>     // result = strtok(other, delims);
>     while( result != NULL ) {
>         printf( "result is \"%s\"\n", result );
>         result = strtok( NULL, delims );
>     }
>
> what am i missing here ? i thought both way of declaration(mentioned above ) were the same apparently the r not, whats the diff ?
>
> any insight would be appreciated, TIA!
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
Bryan
<><
