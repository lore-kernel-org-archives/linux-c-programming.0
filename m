From: Ajay Dudani <abdudani@unity.ncsu.edu>
Subject: Re: child processes
Date: Mon, 22 Apr 2002 14:15:45 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.44.0204221413330.7621-100000@uni03du.unity.ncsu.edu>
References: <02042209461600.15975@linux1.fastinc.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <02042209461600.15975@linux1.fastinc.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gerald Waugh <gwaugh@frontstreetnetworks.com>
Cc: linux-c-programming@vger.kernel.org


man select

select allows for "synchronous I/O multiplexing"

"The  functions  select  and  pselect wait for a number of file
descriptors to change status." - man page

You can use these descriptors to be socket fd's

Ajay


On Mon, 22 Apr 2002, Gerald Waugh wrote:

>    I am not doing a good job of explaining my requirements, but I am looking for
>    ideas...
>     I have an assignment to do an applicaiton that must communicate on
>    three different TCP ports...
>    I was wondering if I could run a daemon that would create three child
>    processes, one for each of the tcp ports?
>    Then have the daemon run any time there was communications activity on any of
>    the ports
>    The daemon must translate the data coming in any one of the ports to a protocol
>    acceptable to the port the data is to be sent to.
>    Any ideas?.
>

-- 
Ajay Dudani <abdudani@cs.ncsu.edu>
Graduate Student in Computer Science at NC State University
http://www4.ncsu.edu/~abdudani

