From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: problem in sending a message
Date: Sun, 27 Feb 2005 18:07:31 +0800
Message-ID: <42219BE3.8060609@hq.ntsp.nec.co.jp>
References: <cvrpo8$h4g$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <cvrpo8$h4g$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: muruganandam@softhome.net, linux-c-programming@vger.kernel.org

im not sure where ur problem is...
is it with the sending of bytes/data or with the receiving part??

A:
actual size of image file: N bytes
actual bytes sent: M bytes( where M < N)

B:
actual bytes sent: N bytes
actual bytes read: M bytes ( where M < N)

is it scenario A or scenario B?
or a hybrid??

can u send us some of ur code?


Muruganandam wrote:

> dear all,
> when i sending the image file ,it is not exactly same size.it is lower 
> than than actual image file.how to send a image file using sockets.i 
> expect from u.
>
> thank you,
>
> with regards,
> C.Muruganandam
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>


