From: Sascha Retzki <lantis@iqranet.info>
Subject: Re: array size 1 ?
Date: Sun, 08 Aug 2004 07:37:54 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1091943474.1291.0.camel@linux.local>
References: <40EF3BCD.7080808@comcast.net> <40F45DEF.8060307@techsource.com>
	 <40F475FC.9090202@comcast.net>  <002601c46e79$3da5f100$d3113b80@Viper>
Reply-To: lantis@iqranet.info
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002601c46e79$3da5f100$d3113b80@Viper>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Am Di, 2004-07-20 um 18.47 schrieb Anshuman S. Rawat:
> Hi,
> What does an array of size 1 mean? or maybe I might be putting it wrong, so
> here's the declaration -
> 
> struct option_state {
>     int refcnt;
>     int universe_count;
>     int site_universe;
>     int site_code_min;
>     VOIDPTR universes[1];
> };
> 
> (code from ISC DHCP sources includes/dhcpd.h)
> 
> What does universes[1] mean here?
> 
> Thanks.
> -Anshu
> 


Came across this:
http://www.eskimo.com/~scs/C-faq/q2.6.html


