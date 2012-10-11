From: Pietro Paolini <P.Paolini@ext.adbglobal.com>
Subject: use getifaddrs()
Date: Thu, 11 Oct 2012 08:44:39 +0000
Message-ID: <56AB56EAD87AF24C803FB693654D7A89C87CA3@adbbexch01.adbitaly.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hello,

I'm not sure about the mailing list I should ask this.
I am rewrite a C program in order to make it portable between differents arch and I am a bit confused regarding byte order.

I am getting the list of my interfaces using the getifaddr() functions and it seems return me a list of interfaces with their IP addresses in network byte order instead of host byte order.
It is a regular behavior or I am wrong and confused ?

Many thanks,
Pietro
