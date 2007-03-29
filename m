From: "Sreevathsa" <sreevathsa@gmail.com>
Subject: RE: Custom defined object in a signal handler
Date: Wed, 28 Mar 2007 17:22:10 -0700
Message-ID: <460b06e1.2894bac9.6e94.23cd@mx.google.com>
References: <17931.925.199685.326663@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:from:to:cc:subject:date:organization:mime-version:content-type:content-transfer-encoding:x-mailer:x-mimeole:in-reply-to:thread-index:message-id;
        b=IdDCOzoj+LqV2av/rbrSc5zHNF66iVkZCPHRg5GAT2+zEWkPXT0J0c9ZZESgsfWJszvk9RYKwzteXvFvBo/UZBsYlL0oFB4lvZrt3DgMsD/LX9pug6K6E9kPWUObnXZjLO0ifsYwHDnl0rOiIU7vP6xKUY5s8CbL/+tG1z5XHFw=
In-Reply-To: <17931.925.199685.326663@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Glynn Clements' <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

I am working on a multithreaded application in which, in one of the code
paths, multiple threads need to setup a SIGALRM signal (to achieve TCP
retrasmission kind of functionality). When each thread does this, it also
need to pass the address of the structure that it operated upon, so that
when the signal is delivered, the signal handling thread will know the
address of the strucutre and can act upon it.

Is there any way to accomplish this goal? If you need any other info about
the problem environment, I can provide them, please let me know.

Thanks,
Sreevathsa

 

> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org 
> [mailto:linux-c-programming-owner@vger.kernel.org] On Behalf 
> Of Glynn Clements
> Sent: Wednesday, March 28, 2007 5:09 PM
> To: Sreevathsa
> Cc: linux-c-programming@vger.kernel.org
> Subject: Re: Custom defined object in a signal handler
> 
> 
> Sreevathsa wrote:
> 
> > I have a question regarding signals. Is there a way you can 
> pass some 
> > custom defined parameter (say, a struct foo * ) to a signal 
> handler??
> 
> No (other than by using a global variable).
> 
> As you can only install a single handler for any given 
> signal, there isn't any real need to support closures.
> 
> --
> Glynn Clements <glynn@gclements.plus.com>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in the body of a message to 
> majordomo@vger.kernel.org More majordomo info at  
> http://vger.kernel.org/majordomo-info.html

