From: Nicolae Mihalache <mache@abcpages.com>
Subject: Re: tcpdump equivalent for the serial port
Date: Fri, 12 Sep 2003 16:23:32 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F61D6E4.2050604@abcpages.com>
References: <3F61CC14.20607@abcpages.com> <20030912140542.GP14376@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030912140542.GP14376@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Jan-Benedict Glaw wrote:

>
>Your approach won't work, but I can hint you to another. If you don't
>need the *wire states*, but only the data your application receives (or
>transmits), then this is easy. Simply use strace or a preload lib to
>intercept open, close, read and write.
>
>That way, you don't monitor the serial port itself, but the application
>using it. For me, that has always been enough:-)
>
This seems a good ideea. Probably I will not use exactly strace but 
develop something using the same library it uses.
I will still keep the cable break-out solution as an option but 
definitely I wanted to be able to monitor the data without interfering 
with the electic signaling on the cable.

Thanks a lot!
nicolae

