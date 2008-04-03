From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Subject: Re: Git tags
Date: Thu, 03 Apr 2008 16:40:06 +0200
Message-ID: <47F4EC46.5030307@visionsystems.de>
References: <47F4E1AF.5060509@visionsystems.de> <20080403143250.GA16034@ahaupt-debian-vm.localdomain>
Reply-To: yegor_sub1@visionsystems.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20080403143250.GA16034@ahaupt-debian-vm.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andre Haupt <andre@bitwigglers.org>
Cc: Yegor Yefremov <yegor_sub1@visionsystems.de>, linux-c-programming@vger.kernel.org

Dear Andre,

thank you for your answer. Yes. I have made some changes to the kernel 
sources. Is it really so, that if I make some changes Makefile or some 
other script notices this fact and adds "dirty" to the kernel version 
string?

Best regards,
Yegor

Andre Haupt wrote:
> On Thu, Apr 03, 2008 at 03:54:55PM +0200, Yegor Yefremov wrote:
>   
>> Hi all,
>>
>> I don't really know where to post this question. Why, if I check out the 
>> 2.6.24.4 kernel (2.6.24.4 tag 
>> http://git2.kernel.org/?p=linux/kernel/git/stable/linux-2.6-stable.git;a=commit;h=16c64cac7d9c6a503f49887219c4fe675e7d43d9) 
>> from the stable git tree, I get "dirty" added to my kernel version after 
>> compilation? The 2.6.24.4 is stable as far as I understand.
>> I have already searched for this info and looked through some tutorials 
>> like http://linux.yyz.us/git-howto.html, but I didn't find any info that 
>> would answer my question.
>>     
>
> Do you have uncommited local changes in your git tree?
>
> Best regards,
>
> Andre
>
>   

