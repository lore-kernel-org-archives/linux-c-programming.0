From: "Alphex K." <alphex@crew.org.ru>
Subject: Re: converting from cp1251 to utf-8
Date: Fri, 26 Mar 2004 20:15:27 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040326201527.3c90c0d9.alphex@crew.org.ru>
References: <20040326163523.71d0410d.alphex@crew.org.ru>
	<16484.20001.402336.195699@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16484.20001.402336.195699@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

On Fri, 26 Mar 2004 15:37:05 +0000
Glynn Clements <glynn.clements@virgin.net> wrote:

> 
> Alphex K. wrote:
> 
> > I'm have a big trouble with converting from cp1251 to utf-8 
> > I'm get some data from MySQL in cp-1251 and I need convert it to utf-8
> > so, how I can do it? 
> 
> Use iconv() etc; see the "Generic Charset Conversion" node in the libc
> Info file for details.
> 
> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
thanx, but I found some gtk functions like g_locale_to_utf8() and g_convert 
it work.

---===---
Alphex Kaanoken
Senior developer of Crew IT research labs
web: http://crew.org.ru
mailto:Alphex@Crew.Org.RU
