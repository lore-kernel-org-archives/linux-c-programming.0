From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: STL - creating std::map key higher than double
Date: Tue, 26 Oct 2004 09:55:34 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <417E4946.6080001@ig.com.br>
References: <4176BF8E.5010107@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4176BF8E.5010107@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-c-programming@vger.kernel.org

Hi guys ! No aswers, no comments, no questions unil now.

I fixed the problem, if some one wants to know how, please contact me.

Regards,
Luciano

Luciano Moreira - igLnx escreveu:

> THE PROBLEM:
> I never created a map<> object that has a key different from embbeded 
> types. When I need a different key type, I create a union joinning my 
> type with a large enough embbed type. A sample:
> urion {
>      myObject X; // Its size is less or equal to double size;
>      double real_key;
> };
>
> Well, now I need a key larger than 128 bits, because it ll have about 
> 48 bytes. I tryed to create a map like as:
> typedef std::map<myKeyType, stItem, std::less< myKeyType > > tpList;
>
> But, off course, the compiler advised me that "less<>" cannot compare 
> "myKeyType", then I implemented a "operator<" into "myKeyType". And 
> now the problem is with "iterator".
>
> MY QUESTIONS:
> Does exist a way to get a map<> with a customized key ? Should I fix 
> the compiling erros, building my own objects ?
>
> Thanks,
> Luciano
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
