From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Antwort: Re: Antwort: Re: -EFAULT during freeing a pointer to
 a structure
Date: Fri, 08 Oct 2004 22:07:59 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <41669F3F.2040003@hq.ntsp.nec.co.jp>
References: <OF9FBCFEF1.D1EE727C-ONC1256F27.0043E708@bln.d-trust.de> <41669D5E.1050402@hq.ntsp.nec.co.jp> <20041008135938.GO5033@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041008135938.GO5033@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org

LOL!
my point exactly  :-)

Jan-Benedict Glaw wrote:

>On Fri, 2004-10-08 21:59:58 +0800, Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
>wrote in message <41669D5E.1050402@hq.ntsp.nec.co.jp>:
>  
>
>>I may not know how u got away with it by using even values for maxnum,
>>but almost everbody knows that an array created with N elements/slots in 
>>C,C++ or in java
>>could only be safely accessed/manipulated via the indices 0...N-1 
>>(unless if u're an expert in memory manipulation)
>>    
>>
>
>Don't ever do that. While you may "survive" on one operating system
>using a specific malloc library and a specific processor, you just loose
>all portability. Just use the malloc functions as they were advertised
>in their manual pages :-)
>
>MfG, JBG
>
>  
>

