From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: GCC and Memory Organization
Date: Tue, 9 Apr 2002 23:12:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15539.26431.760192.203498@cerise.nosuchdomain.co.uk>
References: <3CB3039C.4070404@veritel.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3CB3039C.4070404@veritel.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "William N. Zanatta" <william@veritel.com.br>
Cc: "'linux-c-programming@vger.kernel.org'" <linux-c-programming@vger.kernel.org>


William N. Zanatta wrote:

>    I have a question on memory organization...
>    In my Computer Architeture classes, I've learned something like that 
> there are two ways to organize data in memory.
>    The first one puts it in a linear mode like:
> 
>       +---------------+
> 12k  | z | z |   |   |
>       |---------------|
> 8k   | y | y | z | z |
>       |---------------|
> 4k   | x | x | x | y |
>       +---------------+
> 
>    And the second way is a non-linear, a block mode like:
> 
>       +---------------+
> 12k  | z | z | z | z |
>       |---------------|
> 8k   | y | y | y |   |
>       |---------------|
> 4k   | x | x |   |   |
>       +---------------+
> 
>    The second way should be faster than the first one for memory 
> management, right?! That a kindda obviuos as it wouldn't be necessary to 
> scan all the block to find the next entry. Also it can be expensive 
> since the 4k block is allocated for only 2k of real data.
> 
>    My question is, how does GCC works with this? Does it have any switch 
> for optimizing (or not) the code?? What's the default action???

This isn't a compiler issue. The different layouts would require
different source code. The former corresponds to a one-dimensional
array, while the latter corresponds to a two-dimensional array.

-- 
Glynn Clements <glynn.clements@virgin.net>
