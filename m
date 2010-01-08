From: Nanakos Chrysostomos <linuxcprog@wired-net.gr>
Subject: Re: float
Date: Fri, 08 Jan 2010 19:19:53 +0200
Message-ID: <4B476939.6000600@wired-net.gr>
References: <a24b3c171001080830l4bb72defr32b60386e4e45ae9@mail.gmail.com>	<4B476184.9070407@wired-net.gr> <87hbqwwmgb.fsf@erwin.mina86.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <87hbqwwmgb.fsf@erwin.mina86.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Nazarewicz <mina86@tlen.pl>
Cc: phoenixxz <vim.xxz@gmail.com>, linux-c-programming@vger.kernel.org

On 8/1/2010 19:11, Michal Nazarewicz wrote:
>> On 8/1/2010 18:30, phoenixxz wrote:
>>     
>>> float i=1.34;
>>> printf("%f",i);
>>>
>>> ->> 0
>>> why?
>>>       
> Nanakos Chrysostomos <linuxcprog@wired-net.gr> writes:
>   
>> printf("%lf",i);
>>     
> %lf is actually invalid format (though glibc will gladly treat it the
>  same way it treats %f).  When passing a float value to a function with
>  variable number of arguments it is promoted to double.
>
>   
It could then be:

printf("%lf", (double)i);
