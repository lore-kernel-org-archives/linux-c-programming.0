From: Suciu Flavius <suciuflavius@tiscali.de>
Subject: Re: _var_name
Date: Fri, 24 Sep 2004 17:43:25 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <cj1eqa$m10$1@sea.gmane.org>
References: <20040924025427.37460.qmail@web52909.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040924025427.37460.qmail@web52909.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

__variables are LIBRARY related global variables,
In a normal case you will NEVER use them directly.
The functions from the library use this variables.
It's named like this to be UGLY to use them, and
somehow it's a convention to name internal library
variables using prepended __

So, forget about them and use the functions  :)




Ankit Jain wrote:
> hi
> 
> i have seen some variables in C defined in this
> format(_var_name or __var1_name). generally like this
> they are defined in header files also
> 
> how to use them
> 
> thanks
> 
> ankit
> 
> 
> 
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping" 
> your friends today! Download Messenger Now 
> http://uk.messenger.yahoo.com/download/index.html
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

