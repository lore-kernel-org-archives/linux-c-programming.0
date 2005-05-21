From: Akbar Ali <kaberjobs@yahoo.com>
Subject: Re: CPU/disk usage
Date: Sat, 21 May 2005 10:12:19 -0700 (PDT)
Message-ID: <20050521171219.18783.qmail@web50807.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: 6667
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Dyga <adeon@tlen.pl>, linux-c-programming <linux-c-programming@vger.kernel.org>

Why not just take a quick look at the top source code
?
btw, if you find out tell me, cause i'm intersted in
that data as well..

--- Adam Dyga <adeon@tlen.pl> wrote:
> Hello,
> 
> What's the best way to:
> 1. Get the percent cpu usage (as in top)
> 2. Get disk activity (eg. number of bytes
> read/written from/to disk 
> during some period of time).
> 
> Ad1) I know I could find the cpu usage in top
> sources, but unfortunately 
> I don't have enough time
> to do it currently - maybe some of you did this
> already.
> There is sysinfo() system call that returns average
> loads during the 
> last 1, 5, and 15
> minutes but average load, AFAIK, is a average number
> of tasks waiting 
> for cpu, so it's not
> exactly what I want.
> 
> Cheers
> AD
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 


		
Discover Yahoo! 
Get on-the-go sports scores, stock quotes, news and more. Check it out! 
http://discover.yahoo.com/mobile.html
