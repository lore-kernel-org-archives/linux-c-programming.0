From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: fork + signal
Date: Fri, 29 Jul 2005 11:03:12 +0800
Message-ID: <42E99C70.3090807@hq.ntsp.nec.co.jp>
References: <s2e9e5b6.077@EMAIL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <s2e9e5b6.077@EMAIL>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Suma Choudhary <sumac@myw.ltindia.com>, linux-c-programming <linux-c-programming@vger.kernel.org>

state-machine processing problems?

perhaps the mother process was not yet finished performing the function 
for processing the "card insertion message"
when the child process raised a SIGCHLD... perhaps a system call or a 
task done by the parent process was interrupted when the SIGCHLD
was received by the signal handler..

aside from doing a "fork" (and an "exec"), what are other tasks are done 
whenever a card insertion message is received??

can u show some code? both for the parent and child processes



Suma Choudhary wrote:

>Sorry for being so vague!
>OK the situation is like this:
>I've a process which after receiving a card insertion message  spawns another process.
>Now when the insertion and removal of card is done at a fast rate, the spawning of the child stops after certain time:-(
>This when checked with a slower rate works fine.
>
>When the card is removed the child process detects it and kills itself.
>THe parent gets a SIGCHLD and "waits" on the child.
>
>Do u see any problem here......should I disable the SIGCHLD before spawning the child?
>
>
>Thanks for taking the time to consider it.
>
>Regards
>suma
>
>  
>
>>>>r_zaca <r_zaca@ig.com.br> 07/28/05 22:03 PM >>>
>>>>        
>>>>
> Suma, 
>
> How could a child process send a signal if it is not already created? 
>
>  
>
>>hi all 
>>I have this doubt of what happens when a process is still on the way >of 
>>forking(+ maybe exec further) a child and there comes a sigchld >signal. 
>>(Of course assuming that theres a signal handler for the sigchld >signal.) 
>>    
>>
>
>  
>
>>hopeful of getting an answer 
>>regards 
>>suma 
>>    
>>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

