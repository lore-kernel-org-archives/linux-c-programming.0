From: Nicolae Mihalache <mache@abcpages.com>
Subject: Re: tcpdump equivalent for the serial port
Date: Fri, 12 Sep 2003 17:33:52 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F61E760.3070304@abcpages.com>
References: <3F61CC14.20607@abcpages.com> <20030912140542.GP14376@lug-owl.de> <3F61D6E4.2050604@abcpages.com> <20030912143927.GS14376@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030912143927.GS14376@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Jan-Benedict Glaw wrote:

>On Fri, 2003-09-12 16:23:32 +0200, Nicolae Mihalache <mache@abcpages.com>
>wrote in message <3F61D6E4.2050604@abcpages.com>:
>  
>
>>Jan-Benedict Glaw wrote:
>>    
>>
>>>That way, you don't monitor the serial port itself, but the 
>>>application
>>>using it. For me, that has always been enough:-)
>>>
>>>      
>>>
>>This seems a good ideea. Probably I will not use exactly strace but 
>>develop something using the same library it uses.
>>    
>>
>
>  
>
Hello again,

Now that I'm thinking better, this approach is not similar with tcpdump 
because if I monitor the application that reads the data, I won't see it 
until it is actualy read. The idea of my sniffer is to debug the device 
that runs on the other side so it would be interesting to display 
something as soon as it arrives rather than waiting till the application 
reads the data.
I will try to see if there is some support provided in the kernel.

Thanks,
nicolae

