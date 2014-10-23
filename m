From: Daniel Hilst Selli <danielhilst@gmail.com>
Subject: Re: Show application performance/errors from pseudo file
Date: Thu, 23 Oct 2014 17:09:03 -0200
Message-ID: <5449524F.1000206@gmail.com>
References: <5440216C.3010207@gmail.com> <CAMvDr+T54gR3APzCOyZczvCTZs=FvHhsCA0VkZAVJR3BQdeT+w@mail.gmail.com> <CAMvDr+Qum0dWSarjH1ECnofdP1Ec_EZDczYRFrwP-0Z71Mc5GQ@mail.gmail.com> <54416714.6080100@gmail.com> <54416747.2010108@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=JBnHJ5b8hjJOtyTgoI9s2mZDqIcq13FtM4bkJzDfFYU=;
        b=imtwEM843ss/uUg1h1C2o8czejEe4OHw2TKynwmTyrUvtNFfn+PG+3Kz2k2CsNgmlx
         zA1HCFe5kxecE1fLAdN6LWJCFs0EQs2XKm2yBrrMMwcA7ybQRJ4JX+9FRtwtO30jT2MG
         oCAsCgXcjS3p5t4n2wZbLBJS9FcF4/WGrEPIAsK00SufVQI6ed1ITuWOXF8u3oYT0BIi
         oRjF8jZxtrDrIwpNm7JbAWNnM4q/xcb0Kb9JXg4/AHaurZ1d02Iy+Z8la/nCbrhPPLX3
         xXfxIf11NBWcQRvztw5Q2kgNrjMpPwuBweMHn+85nKAOno06f70iBaAwO6gRy69N7Bld
         rR3Q==
In-Reply-To: <54416747.2010108@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On 10/17/2014 04:00 PM, Daniel Hilst Selli wrote:
> On 10/17/2014 03:59 PM, Daniel Hilst Selli wrote:
>> On 10/16/2014 05:31 PM, Yichao Yu wrote:
>>> Resend as plain text.
>>>
>>> On Thu, Oct 16, 2014 at 4:01 PM, Yichao Yu <yyc1992@gmail.com> wrote:
>>>>
>>>>
>>>> On Thu, Oct 16, 2014 at 3:50 PM, Daniel Hilst Selli <danielhilst@gmail.com>
>>>> wrote:
>>>>>
>>>>> I'm writing a new application and would be nice to have a pseudo file
>>>>> showing its status, just the way that procfs does with kernel.
>>>>> I'm looking for sugestions, I want to `cat' files contents and have
>>>>> something similar to /proc/meminfo
>>>>>
>>>>> First I think using named pipes, but, AFAIK, pipes would retain data
>>>>> writed until someone read it, what I thought is a kind of read
>>>>> hook that only show data when asked for. Here are a few requisites,
>>>>>
>>>>> - Don't retain data
>>>>> - Don't generate disk I/O
>>>>> - Vanish when application stops
>>>>> - Work with a simple cat or something similar..
>>>>
>>>>
>>>> You should have a look at fuse[1].
>>>>
>>>> [1] http://fuse.sourceforge.net/
>>>>
>>>>>
>>>>>
>>>>> With that in mind I think about using unix domain sockets.. it seems to
>>>>> fit all requisites, for
>>>>> the fourth requisite I could use netcat, that is almost cat,
>>>>>
>>>>> Cheers
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe
>>>>> linux-c-programming" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>>
>>
>> Seems god, a little overkill for so simple stuff but adds nice features, I'm taking
>> a look on further options..
>>
>> Cheers
> good*

Looking further I found that named pipes will block on open() calls, until
the other end open it too. So I still can implement this with named pipes.

Here is the pseudo code implementation I use. (Yes I'm using threads)

void *stats_handler(void *unused)
{
	for (;;) {
		int fd = open(FIFO_PATH, O_WRONLY); /* should block here */

                 /* handle open error */

		write(fd, statistics_buffer, statistics_buffer_len);

		close(fd);

		sleep(1); /* avoid flooders :-P */
	}
}

void stats_init(void)
{
	pthread_t stat_id;

	mkfifo(FIFO_PATH, 0755);
	/* handle mkfifo errors */
	pthread_create(&stat_id, NULL, stats_handler, NULL);
}

int main(void)
{
	...
	stats_init();
	...
}


After that I can just `cat FIFO_PATH' to see my statistics :D

Thanks for all and best regards!
