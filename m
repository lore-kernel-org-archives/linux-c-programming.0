From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Testing if a file or directory exist
Date: Mon, 10 Sep 2007 15:53:15 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0709101540300.17374@diagnostix.dwd.de>
References: <Pine.LNX.4.64.0709090907400.18317@diagnostix.dwd.de>
 <Pine.LNX.4.64.0709090605220.31293@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0709090605220.31293@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sun, 9 Sep 2007, Robert P. J. Day wrote:

> On Sun, 9 Sep 2007, Holger Kiehl wrote:
>
>> Hello
>>
>> What is the quickest way to test if a file or directory exist. I can
>> think of three different system calls that can be used: access(),
>> stat() and open(). Writting a little test program I found that this
>> is also the order of which is the quickest, that is access() is the
>> quickest and open() the slowest.
>
> if all you want to do is check for existence, then, execution time
> notwithstanding, you should use the method which accomplishes that and
> nothing more, so the obvious solution would be stat().
>
That is what I first thought as well. But I think the problem is that
stat() needs to fill up the structure with all the data, is what takes
most the time. So I thought calling stat() as follows would solve it:

      stat("abcd", NULL)

But that would fail with EFAULT (Bad address). I wonder why this is
the case, because then I assume it should be as quick as access("abcd", F_OK)
or maybe even quicker. By providing NULL as argument I tell the function
not to fillup the structure and just test if the file exist. Most proberly
POSIX defines it that way.

Holger

