From: Hossein Mobahi <hmobahi@yahoo.com>
Subject: Race: SignalHandler() & sleep()
Date: Tue, 4 Jun 2002 07:48:04 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020604144804.33629.qmail@web12706.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hello

main()
{
    ....
    signal (SIGIO, signalhandler() ) ;
    ....
    sleep (65535) ;
    ....
}

signalhandler() { ... } 

Assume the frequency of IO events is faster than one
event per 65535 seconds. Therefore, let's consider
65535 as infinity (sleeping foreveR).
If a SIGIO arrives, main will get out of sleep and
continue running, but signalhandler will be invoked
too. I wanted to know if there is any order/priority
for sleep() in main, and signalhandler() to be called
first, or one of them is invoked first randomly (race
condition) ?

I myself ran the program many times and everytime
observed signalhandler responding first. But maybe it
is not a rule, and it was just my chance ?

Thnx for your comment !

--Hossein Mobahi


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
