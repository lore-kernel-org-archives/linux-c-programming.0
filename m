From: joy <gracecott@sancharnet.in>
Subject: Re: various doubts ......
Date: Wed, 11 Aug 2004 08:21:55 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <411989CB.3000304@sancharnet.in>
References: <4117B259.1090500@sancharnet.in>
Reply-To: gracecott@sancharnet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <4117B259.1090500@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: 
Cc: linux-c-programming@vger.kernel.org

joy wrote:

> Hello,
> I  have a few , though unconnected doubts.
>
> 1) can a named pipe be locked using normal lockf()  or do I have to 
> perform some voodoo?
>
Yes it can! I tried it out with two processes trying to write to the 
pipe at the same time.One obtains the  lock
and sleep()s for 10 seconds during which the other process is blocked.

> 2) I need to transfer data (protocol not an issue, just raw data) from 
> a usb peripheral(not HDD)
>    to the host comp. can I do this without writing a usb driver 
> myself, i.e , using some generic or user-space driver (like ppdev)
>    the peripheral is a texas instruments tusb246b hub.
>
> Thanx in advance,
> Joy.M.Monteiro
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

