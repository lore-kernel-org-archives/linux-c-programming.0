From: HIToC <hitoc_mail@yahoo.it>
Subject: Re: Bitfields
Date: Wed, 1 Dec 2004 20:44:38 +0100
Message-ID: <200412012042.09952.hitoc_mail@yahoo.it>
References: <1101875142.7423.2.camel@myLinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1101875142.7423.2.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Cc: Linux C programming <linux-c-programming@vger.kernel.org>

On Wednesday 01 December 2004 05:25, Jagadeesh Bhaskar P wrote:
> Hi all,
> 	What is a bitfield? How is it used in C??
>
> TIA


It is possible to use several of bit variables like fields within a struct.
You have to indicate first the name of the field, then the number of bits
that the field occupies. Also you have to put double points ":" between
the filed's name and its bit-size.
For example, you want to save the current date; you can define a
struct Date (YYYY/MM/DD) like this

struct Date {                              // Date format: YYYY/MM/DD
	unsigned	year    : 7;         // 0-127 (2000-2127)   [7 bits size]
	unsigned	month  : 4;		// 1-12                       [4 bits size]
	unsigned	day      : 5;        // 1-31                       [5 bits size]
};

In this case we have the complete date in a 16 bit variable (7+4+5=16 bit)!

-- 

With regards,
				HIToC 
				hitoc_mail@yahoo.it

