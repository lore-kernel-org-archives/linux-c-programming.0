From: Florian Attenberger <fattenberger@onlinehome.de>
Subject: Re: literal constant..
Date: Tue, 03 Feb 2004 15:34:00 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <401FB158.40408@onlinehome.de>
References: <31E38B53D182D51195FA00508BE3A334033CA936@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <31E38B53D182D51195FA00508BE3A334033CA936@zwnbc004.cala.nortel.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sandro Dangui <sdangui@nortelnetworks.com>, linux-c-programming@vger.kernel.org

char c[1]="c" is an unlucky example, it seems to be like this:
char c* = "c"; // make c point to "c\0".
char c[1] = "c"; // make c point to an undifined array of char of length 
1, set last char to '\0', _after_ that overwrite the array with "c", 
since "c" is just as long as the whole array, the \0 gets overwritten.

To get the second example behave equal to the first, it needs to be:
char c[2] = "c"; // char[0] == 'c', char[1] == '\0'.

So much to code difference.

char c[] is however a constant pointer, so you cannot reassign it.
That doesn't have to result in any assembler code difference at all, its 
just the compiler that complains.

flo
