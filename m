From: "mike" <ruler@isolate.net>
Subject: Re: Misc C question
Date: Wed, 19 Jun 2002 23:10:59 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <010701c21808$1a7315b0$0201a8c0@ws1>
References: <20020619214332.A299@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xmp <xmp@multipasto.net.co>, linux-c-programming@vger.kernel.org

Hi,

Basically, you could use the fexist() function (I think that's what its
called), or the way most people do it..
FILE *blah;
if ((blah = fopen("/path/to/file, "r")) != NULL) {
    printf("File does not exist.");
    exit(0);
}

Thanks.
----- Original Message -----
From: "xmp" <xmp@multipasto.net.co>
To: <linux-c-programming@vger.kernel.org>
Sent: Wednesday, June 19, 2002 10:46 PM
Subject: Misc C question


> hi, What is the correct unix-style way to check if a file exists ? create
it ? and delete it ?.
> Maybe trying to fopen() it and if call != NULL it exist, else it doesnt?.
> I want to know the most standard and used in system such as FreeBSD and
solaris, linux.
>
> bye
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

