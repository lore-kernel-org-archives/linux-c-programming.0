From: "Suma Choudhary" <sumac@myw.ltindia.com>
Subject: Re: fork + signal
Date: Fri, 29 Jul 2005 08:15:18 +0530
Message-ID: <s2e9e5b6.077@EMAIL>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: r_zaca@ig.com.br, linux-c-programming@vger.kernel.org

Sorry for being so vague!
OK the situation is like this:
I've a process which after receiving a card insertion message  spawns another process.
Now when the insertion and removal of card is done at a fast rate, the spawning of the child stops after certain time:-(
This when checked with a slower rate works fine.

When the card is removed the child process detects it and kills itself.
THe parent gets a SIGCHLD and "waits" on the child.

Do u see any problem here......should I disable the SIGCHLD before spawning the child?


Thanks for taking the time to consider it.

Regards
suma

>>> r_zaca <r_zaca@ig.com.br> 07/28/05 22:03 PM >>>
 Suma, 

 How could a child process send a signal if it is not already created? 

>hi all 
>I have this doubt of what happens when a process is still on the way >of 
>forking(+ maybe exec further) a child and there comes a sigchld >signal. 
>(Of course assuming that theres a signal handler for the sigchld >signal.) 

>hopeful of getting an answer 
>regards 
>suma 

