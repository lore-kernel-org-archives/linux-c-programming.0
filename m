From: Alphex Kaanoken <kaanoken@crew.org.ru>
Subject: Re: passing host name from a structure.
Date: Thu, 7 Oct 2004 02:44:48 +0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041007024448.5c42e951.kaanoken@crew.org.ru>
References: <20041006104403.96723.qmail@web52903.mail.yahoo.com>
	<1097099245.4086.421.camel@localhost.localdomain>
Reply-To: kaanoken@crew.org.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1097099245.4086.421.camel@localhost.localdomain>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Parrilla <eparrilla@comcast.net>
Cc: linux-c-programming@vger.kernel.org

On 06 Oct 2004 16:47:27 -0500
Edward Parrilla <eparrilla@comcast.net> wrote:

> Hi Experts,
> here a question for you, I have defined the following
> 
> 
> #define bcopy(a,b,c) strncpy(b,a,c)
> 
> 
>    struct sockaddr_in  sa;  /* socket addr. structure           */
>    struct hostent * hp;     /* host entry                       */
>    char *hostname;
> 
> hostname=argv[3];
> 
> hp=gethostbyname(hostname);  <-- get this error " warning: assignment
> makes pointer from integer without a cast
> "
so, it's wrong write 
hp=gethostbyname((const char*)hostname);/*but why you need pointer hostname? may be use argv[3] instead?*/
see `man gethostbyname' for details
> 
> 
> bcopy((char *)hp->h_addr, (char *)&sa.sin_addr, hp->h_length);  <--
> getting  dereferencing pointer to incomplete type
> 
> Any idea?
> thanks in advance
> Edward
> 
> 
> 
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Alphex Kaanoken,
Senior Developer of
Crew IT research labs.
Web: http://crew.org.ru
Mail: kaanoken at crew.org.ru
