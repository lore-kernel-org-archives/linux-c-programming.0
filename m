From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: usage of pipes
Date: Tue, 23 Nov 2004 06:43:18 +0000
Message-ID: <16802.56326.334226.401481@cerise.gclements.plus.com>
References: <1101189263.3786.19.camel@myLinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1101189263.3786.19.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Cc: linux-c-programming@vger.kernel.org


Jagadeesh Bhaskar P wrote:

> I created a pipe in a program. Now i want to write through that to
> another program. Is it possible? 
> Or putting it in other words, can I communicate with a pipe (and not a
> named pipe or FIFO), between 2 entirely independent processes?

The other process needs a descriptor for the other end of the pipe. 

AFAIK, there are only two ways to achieve this: either both processes
must have a common ancestor which creates the pipe, or the processes
must communicate via a Unix-domain socket so that the creator can send
the descriptor using sendmsg() with an SCM_RIGHTS message.

-- 
Glynn Clements <glynn@gclements.plus.com>
