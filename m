From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: converting from cp1251 to utf-8
Date: Fri, 26 Mar 2004 15:37:05 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16484.20001.402336.195699@cerise.nosuchdomain.co.uk>
References: <20040326163523.71d0410d.alphex@crew.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040326163523.71d0410d.alphex@crew.org.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alphex K." <alphex@crew.org.ru>
Cc: linux-c-programming@vger.kernel.org


Alphex K. wrote:

> I'm have a big trouble with converting from cp1251 to utf-8 
> I'm get some data from MySQL in cp-1251 and I need convert it to utf-8
> so, how I can do it? 

Use iconv() etc; see the "Generic Charset Conversion" node in the libc
Info file for details.

-- 
Glynn Clements <glynn.clements@virgin.net>
