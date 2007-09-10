From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Testing if a file or directory exist
Date: Mon, 10 Sep 2007 15:39:44 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0709101531480.17374@diagnostix.dwd.de>
References: <Pine.LNX.4.64.0709090907400.18317@diagnostix.dwd.de>
 <18147.61965.904640.471967@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18147.61965.904640.471967@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

On Sun, 9 Sep 2007, Glynn Clements wrote:

>
> Holger Kiehl wrote:
>
>> What is the quickest way to test if a file or directory exist.
>> I can think of three different system calls that can be used:
>> access(), stat() and open(). Writting a little test program I
>> found that this is also the order of which is the quickest,
>> that is access() is the quickest and open() the slowest. The code
>> for the test programms is shown below.
>>
>> The question I have is there any other system call that I can use
>> that would be cheaper then access(). Even if they are linux specific
>> system calls I would like to know.
>>
>> Thanks,
>> Holger
>>
>> access.c
>>
>>     #include <stdio.h>
>>     #include <string.h>
>>     #include <unistd.h>
>>     #include <errno.h>
>>
>>     #define MAX_LOOPS 5000000
>>
>>     int main(void)
>>     {
>>        unsigned int i;
>>
>>        for (i = 0; i < MAX_LOOPS; i++)
>>        {
>>           if (access("abcd", R_OK) != 0)
>
> If you just want to check for existence, use F_OK. If you use R_OK,
> the call will fail if you don't have read permission for the file.
>
Right. I thought F_OK was just for files and not directories, but that is
wrong, a directory is also just a file. Also, testing showed that F_OK is
quicker then R_OK.

Thanks a lot for the advice!

Holger

