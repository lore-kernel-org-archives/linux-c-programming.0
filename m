From: "mike" <ruler@isolate.net>
Subject: Re: Misc C question
Date: Thu, 20 Jun 2002 01:08:38 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <002701c21818$8a302d10$0201a8c0@ws1>
References: <20020619214332.A299@nietzsche>    <010701c21808$1a7315b0$0201a8c0@ws1> <20020619234424.A480@nietzsche>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xmp <xmp@multipasto.net.co>, linux-c-programming@vger.kernel.org

Hi,

"r" is for readonly, if you don't include what it should do with the file,
you will get an error on compile. :)  The possible options are "r", "w",
"r+" "w+", and more.  You should consult a book/website which will explain
everything you need to know about them :)

Also after you fopen(); you should always fclose(); somewhere after :)

And, no, the call won't return NULL if you don't have "r", it simply won't
compile, and can't give you anything ;)

Thanks.
----- Original Message -----
From: "xmp" <xmp@multipasto.net.co>
To: "mike" <ruler@isolate.net>
Cc: <linux-c-programming@vger.kernel.org>
Sent: Thursday, June 20, 2002 12:44 AM
Subject: Re: Misc C question


> > Basically, you could use the fexist() function (I think that's what its
> > called), or the way most people do it..
> > FILE *blah;
> > if ((blah = fopen("/path/to/file, "r")) != NULL) {
> >     printf("File does not exist.");
> >     exit(0);
> > }
> hi, thanks for reply me.
> About your example, What happens if the file exist and you dont have "r"
permission? the call will return NULL?.
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

