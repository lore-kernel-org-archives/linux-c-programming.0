From: Yuri Edward <yuri6037@yuristudio.net>
Subject: Re: Issue with fcntl FD_CLOEXEC and execve
Date: Mon, 22 Jun 2020 19:09:22 +0200
Message-ID: <77fb62c9-1b7f-363a-b574-477bf980e209@yuristudio.net>
References: <000801d64679$d347bf10$79d73d30$@yuristudio.net>
 <87mu4yp6rt.fsf@mid.deneb.enyo.de>
 <fadc7cda-a84b-33ed-e15a-8203673f9d61@yuristudio.net>
 <87y2og5h0h.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <87y2og5h0h.fsf@mid.deneb.enyo.de>
Content-Language: en-US
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Weimer <fw@deneb.enyo.de>
Cc: linux-c-programming@vger.kernel.org

Hello,

Thanks a lot for the tip; I changed my fcntl call to the following: 
"fcntl(myfd, F_SETFD, FD_CLOEXEC)" and that fixed the problem.

I can now run and control external processes using the same API across 
most platforms!

I wish the man pages of fcntl could have been clearer about how you were 
supposed to apply the FD_CLOEXEC flag...

Yuri Edward


On 6/21/20 9:57 PM, Florian Weimer wrote:
> * Yuri Edward:
>
>> https://github.com/BlockProject3D/Framework/blob/ProcessManagement/Base/src/Framework/System/Process.cpp
>>   > This is the main class that performs fork, pipe, read, write and
>      if (fcntl(commonfd[PIPE_WRITE], FD_CLOEXEC, 1) != 0)
>
> That's not how fcntl works.  You need to use F_GETFD and F_SETFD to
> set the FD_CLOEXEC flag.
