From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: Re: Unix Time
Date: Mon, 27 Sep 2004 06:10:48 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040927051048.25873.qmail@web52902.mail.yahoo.com>
References: <35fb2e590409261557361c5dea@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <35fb2e590409261557361c5dea@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jonathan@jonmasters.org
Cc: linux prg <linux-c-programming@vger.kernel.org>

well still the problem exists

7360568 sec how to interpret this no. in seconds?

do u know about any manula to understand htis unix
time

thanks

ankit


 --- Jon Masters <jonmasters@gmail.com> wrote: 
> On Sun, 26 Sep 2004 20:01:04 -0700, Suciu Flavius
> <suciuflavius@tiscali.de> wrote:
> 
> >   struct timeval start,stop;
> >   int elapsed;
> > 
> >   gettimeofday(&start,NULL);
> > 
> >   computeWhatIWant();
> > 
> >   gettimeofday(&stop,NULL);
> > 
> >
>
elapsed=(stop.tv_sec-start.tv_sec)*1000000+(stop.tv_usec-start.tv_usec);
> > printf("sprintf:  elapsed=%5d
> miliseconds\n",elapsed);
>  
> ...or you could use the POSIX difftime function if
> you don't mind
> having a double returned.
> 
> Jon.
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
>  

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
