From: kranthi <kranthi@effigent.net>
Subject: Re: time conversion
Date: Tue, 23 Aug 2005 14:07:56 -0000
Message-ID: <opsvyr7isqcqhltn@effigent.org>
References: <430AD085.7070004@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <430AD085.7070004@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org







I think this may serve u  r purpose

#include <stdio.h>
#include <sys/time.h>
#include <time.h>
#include <unistd.h>



int main()
{
	time_t t;  //Number in Unsigned format
  	printf("% u \n ",t);
	time(&t);
	printf("%s",ctime(&t)); //  Time in Human readable format
	return 0;
}


On Tue, 23 Aug 2005 15:30:13 +0800, Lejanson C. Go  
<lejanson@ntsp.nec.co.jp> wrote:

> Hi,
>
> I had searched the net on how to convert unsigned long timestamp
> to human readable format or maybe in struct timeval format. Any sample  
> code that you can share would be greatly appreciated.
> Thanks.
>
> Lejanson
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe  
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/m2/
