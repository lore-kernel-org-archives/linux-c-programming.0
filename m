From: Pavel Maltsev <pari@isr.lviv.ua>
Subject: how to speed up function "read" when working with /dev/ttyS ?
Date: Fri, 14 May 2004 17:47:26 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1524164387.20040514174726@isr.lviv.ua>
Reply-To: Pavel Maltsev <pari@isr.lviv.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Dear all,

Could you advice, how to speed up function "read" or "tcdrain" when I
working with /dev/ttyS# ?

We use RS-422 half-duplex interface (115200 bod) on VIPER
Strong ARM platform (www.arcom.com) with kernel 2.4.21.
Cause the interface is half-duplex, to communicate with attached
devices we use following sequence:
1. Switch the line state to "transmitting"
   (change RTS level - ioctl...)
2. Transmit a request using write function
3. To ensure, that all data are successfully transmitted to the
   communication line - we read data just send
4. Switch line state to "receiving" and waiting for response from
   attached devices...

Everything works, but time delay between step 3 and 4 is extremely big
- about 5-6 ms (but we expected micro seconds). It means, that all
attached devices already sent their replies, but we are still in
"transmitting" state - "read" function does not return yet and all
responses just skipped...
Additionally we checked: just line switching (ioctl) takes only 5
microseconds - very well. Write function also very fast - it returns
even before all data are send to the RS-422 line (if we switch line
state immediately after write function - it doesn't work, because
request is not transmitted completely).
Also, we found, that function "read" can return very quickly, if there
is no any data to return... So, if "read" has nothing to return -
everything is OK (it returns more than 50 times with "0" return
value before it finally return with our data), but if it has
data to return - this big delay occurs.

Could you advice or recommend something, which will help us to solve
this problem.

Sincerely,
Pavel Maltsev


