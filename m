From: <yiding_wang@agilent.com>
Subject: RE: Size of the terminal with curses
Date: Thu, 21 Oct 2004 11:08:55 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <08A354A3A9CCA24F9EE9BE13600CFBC50F8580@wcosmb07.cos.agilent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tyler@agat.net, linux-c-programming@vger.kernel.org

The simplist way - run shell command "set", you will see some setting like 
...
COLUMNS=80 
...
LINES=25
...

It is an environment setting.

Eddie

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of Tyler
Sent: Wednesday, October 20, 2004 1:11 PM
To: linux-c-programming@vger.kernel.org
Subject: Size of the terminal with curses


Hey,

How can I get the size of the terminal (in lines and cols) of the actual 
terminal ? It would be cool if the solution uses some curses function.

Thx

-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
