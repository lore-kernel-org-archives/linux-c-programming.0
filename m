From: Steve Goodwin <SteveG@bitscorp.com>
Subject: Curses and key-up information
Date: Mon, 6 Jan 2003 14:29:05 -0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4DB84F6A7711D511A5020002A550C8B778710B@BELL>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi all,

I'm writing to write a little curses maze game that involves a lot of key
handling, and the most obvious way to handle the control is with a
IsKeyDown(char key) type-function. Alas, curses doesn't appear to have one
and was wondering is anyone else has found a way around this problem (either
within curses, or using ioctl/poll or similar).

I have a (rather poor) solution whereas all keys are read on a zero timeout
and fast repeat, but the situation: 'z' key down, 'k' key down, will not
pick up the 'k' for more than 1 frame which is not enough :(

Steev



The information in this Internet Email is confidential and is intended
solely for the addressee. Access, copying or re-use of information in it by
anyone else is unauthorised. Please immediately notify the sender if you are
not the intended recipient and have received this mail. 
Any views or opinions presented are solely those of the author and do not
necessarily represent those of Bits Corp plc or any of its affiliates. 

Tel. +44 (0)20 8282 7200 
Fax. +44 (0)20 8450 9966
