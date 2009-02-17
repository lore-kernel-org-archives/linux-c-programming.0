From: Bert Wesarg <bert.wesarg@googlemail.com>
Subject: Re: strstr and strchr
Date: Tue, 17 Feb 2009 13:00:58 +0100
Message-ID: <36ca99e90902170400i58dbf6bbu406b1886886edfcd@mail.gmail.com>
References: <36ca99e90902170248y5ae1dc8heb5e4873429f3ae@mail.gmail.com>
	 <937267.9085.qm@web63401.mail.re1.yahoo.com>
	 <36ca99e90902170358m1e0fc809p1da7a1603185e005@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=adL1Kec3Ls6Sj6r1TSRZqZXitM3/CZ9/j/vaCLtv8cY=;
        b=akr5WdF50GgrUO9xt0wQuxUeBmdq+mx7rO6CAk+RZX24y3cKcpeetK00FOZ99FAfiw
         B2Omtdzk9fYf1tf+je/oZfMMql4J6M30Zw5iZSDxpquuPAUh/Bqt0PopJy6JoHZx4GKW
         Dx8AK3ArwtmPjQHeFR1axzu6X71WuPkXrRiaY=
In-Reply-To: <36ca99e90902170358m1e0fc809p1da7a1603185e005@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fundu_1999@yahoo.com
Cc: linux-c-programming@vger.kernel.org

On Tue, Feb 17, 2009 at 12:58, Bert Wesarg <bert.wesarg@googlemail.com> wrote:
> On Tue, Feb 17, 2009 at 12:52, Fundu <fundu_1999@yahoo.com> wrote:
>> Bert,
>> i did try that but got same response.
> I'm not:
>
> int
> main(int ac, char *av[])
> {
>    char *str = "<Info firstName='sam' lastName='Smith' />";
>    char *ptr = strchr(str, '\'');
>
>    if (!ptr)
>        return 1;
>
>    printf("%s\n", str);
>    printf("%*s^\n", (int)(ptr - str), "");
>
>    return 0;
> }
>
> prints:
>
> <Info firstName='sam' lastName='Smith' />
>                ^
This looks probably wrong, because of malformed whitespace.
