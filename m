From: Lorenzo Beretta <lory.fulgi@infinito.it>
Subject: Re: use getifaddrs()
Date: Thu, 11 Oct 2012 19:16:26 +0200
Message-ID: <k56ut9$ns9$1@ger.gmane.org>
References: <56AB56EAD87AF24C803FB693654D7A89C87CA3@adbbexch01.adbitaly.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <56AB56EAD87AF24C803FB693654D7A89C87CA3@adbbexch01.adbitaly.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 11/10/2012 10:44, Pietro Paolini wrote:
> Hello,
>
> I'm not sure about the mailing list I should ask this.
> I am rewrite a C program in order to make it portable between differents arch and I am a bit confused regarding byte order.
>
> I am getting the list of my interfaces using the getifaddr() functions and it seems return me a list of interfaces with their IP addresses in network byte order instead of host byte order.
> It is a regular behavior or I am wrong and confused ?
>
> Many thanks,
> Pietro
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Regular -- I'm not sure about getifaddrs, but most (all?) socket 
functions do the same, so sometimes (as in this case it sems) it's just 
assumed to be the default.
In general you can just check the manpage:
1. from your system -- "man getifaddrs"
2. from the posix std online
3. from www.freebsd.org -- its manpages section actually lets you look 
at manpages from a *lot* of unices (*BSD, linux, solaris, ...), it's 
very very handy

