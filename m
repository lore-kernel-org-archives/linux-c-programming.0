From: Jeff Woods <kazrak+kernel@cesmail.net>
Subject: Re: pointer notation
Date: Tue, 28 Oct 2003 10:46:26 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20031028103917.01841e48@no.incoming.mail>
References: <3F9E5A41.40204@ig.com.br>
 <20031028094205.GA4228@mrna.tn.nic.in>
 <3F9E5A41.40204@ig.com.br> <20031028174605.GA5517@mrna.tn.nic.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031028174605.GA5517@mrna.tn.nic.in>
References: <3F9E5A41.40204@ig.com.br>
 <20031028094205.GA4228@mrna.tn.nic.in>
 <3F9E5A41.40204@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: km <km@mrna.tn.nic.in>
Cc: Luciano Moreira - igLnx <lucianolnx@ig.com.br>, linux-c-programming@vger.kernel.org

At 10/28/2003 11:16 PM +0530, km wrote:
>In the above code we can see the statement called "(*s)->previous = 
>NULL;". I didnt get what exactly it means to be and how different is *s 
>different from (*s) in this context. can it be written in any other form 
>alternatively ?

"*s" and "(*s)" are exactly the same.  However, "*s->next" and "(*s)->next" 
are NOT the same because without the parentheses field selection through 
the pointer ("->") wouild be done before indirection ("*") of the "handle" 
(pointer to a pointer) "s".  IOW, the parentheses are only there (as is 
usually the case in a C expression) to control precedence of binding.

--
Jeff Woods <kazrak+kernel@cesmail.net> 


