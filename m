From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: a problem about send() on socket programming
Date: Wed, 15 Mar 2006 12:23:06 +0000
Message-ID: <17432.1834.198830.761296@cerise.gclements.plus.com>
References: <MAILCIqtQvAauNjVuMh000006ab@mail.ndsc.com.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <MAILCIqtQvAauNjVuMh000006ab@mail.ndsc.com.cn>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zxt@mail.ndsc.com.cn
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Xueting Zhu wrote:

> I am studying socket programming. I have a problem about the function
> send(). Generally it is thought that the calls return the number of
> characters sent, or -1 if an error occurred. But when I practice
> programming about udp socket, the server return 0 when it actually
> sent data. I am really puzzled. Can anyone help me ? The program I
> practice is as follows.

>  *in line 38:count=sendto(sd,"test from server",sizeof("test from server"),0,(struct sockaddr *) &s_addr,sizeof(s_addr))<0)
>  *when captured with etheral, it is found that the data has been sent, 
>  *while the printed message shows that "0 byte send success!" 
>  */

> 		if(count=sendto(sd,bufftosend,sizeof(bufftosend),0,(struct sockaddr *) &s_addr,sizeof(s_addr))<0)

sendto() isn't returning zero.

The "<" operator has higher precedence than "=" (the only operator
with a lower precedence than assignment operators is the sequencing
operator ","), so the above call is equivalent to:

	if (count = (sendto(...) < 0))

I.e. "count" is being assigned the value of the expression (sendto(...) < 0),
which will be 1 if sendto() returns a negative value and zero otherwise.

To get the behaviour which you desire, you need additional parentheses, i.e.:

	if ((count = sendto(...)) < 0)

-- 
Glynn Clements <glynn@gclements.plus.com>
