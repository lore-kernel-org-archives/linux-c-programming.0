From: "Luciano Moreira - igLnx" <lucianolnx@ig.com.br>
Subject: Re: (non-member) wait-notify mechanism in pthreads
Date: Mon, 28 Apr 2003 14:02:36 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <016801c30da7$fa4ebeb0$0b00a8c0@SPLUCIANO>
References: <3EACE858.8000700@hq.ntsp.nec.co.jp> <16045.13129.643228.647757@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>, ronkhu@ntsp.nec.co.jp
Cc: linux-c-programming@vger.kernel.org

If you dont need to execute something while waiting a thread to exit, you
can use only pthread API instead mutex, waiting a thread to join.

Luciano

----- Original Message ----- 
From: "Glynn Clements" <glynn.clements@virgin.net>
To: <ronkhu@ntsp.nec.co.jp>
Cc: <linux-c-programming@vger.kernel.org>
Sent: Monday, April 28, 2003 10:57 AM
Subject: Re: (non-member) wait-notify mechanism in pthreads


>
> ronkhu wrote:
>
> > Im not a member of this list but I've got a question:
> > How does one go about implementing a wait-notify mechanism in pthreads
> > in lieu of the
> > busy-waiting approach( which tends to be a cpu-hog)?
>
> Mutexes, condition variables, or POSIX semaphores. See the "POSIX
> Threads" section in the "libc" Info file for more details.
>
> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>


