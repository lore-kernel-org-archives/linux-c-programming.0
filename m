From: Bastian Ruppert <ng@max01.eu>
Subject: line buffered stdin
Date: Mon, 11 Jan 2010 17:27:31 +0100
Message-ID: <4B4B5173.20504@max01.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello,

under Linux stdin is line buffered, that means you can read one byte with
following statement:

read(0,&myvar,1);

You get the byte after typing one or more chars AND return.

But i need this function to return after every char entered in stdin.

Is there a function that reads stdin without line buffering?

Is it possible to disable the linebuffer or to reduce the buffersize to one?
Does this kind of manupilation have consequences for the hole system or 
just for
the app
doing this?

Any Ideas are very welcome,
thank you.

Regards
Bastian.
