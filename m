From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: exit(42)
Date: Fri, 24 Sep 2004 09:29:14 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4154131A.7030208@ig.com.br>
References: <20040924115759.6133.qmail@web52908.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040924115759.6133.qmail@web52908.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

Operating systems can catch programs exit values (eg: by exit() in C/C++).

So, you can do it by script shell (in UNIX) or by "DOS" commands in 
Wndows Console. Well, Operating systems can also give you this values 
when you call a program from another program, see exec() and system() 
functions.

Luciano


Ankit Jain wrote:

>well do any body know what does this mean?
>
>exit(42)
>
>and also when we say exit(0) or exit(1) then there is
>anyway to catch these values
>
>also when we return from main fn then what is the
>benfit?
>
>does it have any utilisation?
>
>thanks
>
>ankit
>
>________________________________________________________________________
>Yahoo! Messenger - Communicate instantly..."Ping" 
>your friends today! Download Messenger Now 
>http://uk.messenger.yahoo.com/download/index.html
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>
