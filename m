From: Jon Masters <jonmasters@gmail.com>
Subject: Re: Unix Time
Date: Sun, 26 Sep 2004 23:57:11 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <35fb2e590409261557361c5dea@mail.gmail.com>
References: <20040926140210.43741.qmail@web52903.mail.yahoo.com>
	 <cj6vk0$c3i$1@sea.gmane.org>
Reply-To: jonathan@jonmasters.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <cj6vk0$c3i$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Suciu Flavius <suciuflavius@tiscali.de>
Cc: linux-c-programming@vger.kernel.org

On Sun, 26 Sep 2004 20:01:04 -0700, Suciu Flavius
<suciuflavius@tiscali.de> wrote:

>   struct timeval start,stop;
>   int elapsed;
> 
>   gettimeofday(&start,NULL);
> 
>   computeWhatIWant();
> 
>   gettimeofday(&stop,NULL);
> 
> elapsed=(stop.tv_sec-start.tv_sec)*1000000+(stop.tv_usec-start.tv_usec);
> printf("sprintf:  elapsed=%5d miliseconds\n",elapsed);
 
...or you could use the POSIX difftime function if you don't mind
having a double returned.

Jon.
