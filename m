From: Milind A Choudhary <milindchoudhary.lkml@gmail.com>
Subject: Re: Function pointers
Date: Sat, 23 Jan 2010 17:27:38 -0500
Message-ID: <70016fb31001231427n225eb4f6i5c78da6f9223cf01@mail.gmail.com>
References: <27253432.post@talk.nabble.com>
	 <19288.9425.111644.585101@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=QCsetRZxmqHUzFU87COrh6/1Cz4i5XpYtE2QFbFUdCE=;
        b=xoQr7doG9Ab1bfiBMczqvTcY9ZbacjmMCNWPUHZuhKacIUN7fwyp4G2i8WCSIiwcGC
         I3E+E7BiSxrH6lten/Cb9ca5a5Q1KdCwiEnZz/mKym6HkcEmslIlTqOCZLjqUD8NDMpk
         iPlpTcVdJRQyYop5O2fn/lvUKqKmCNRsrDOi8=
In-Reply-To: <19288.9425.111644.585101@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: kumar11 <ravikumar.chakram@gmail.com>, linux-c-programming@vger.kernel.org

On Thu, Jan 21, 2010 at 4:56 AM, Glynn Clements
<glynn@gclements.plus.com> wrote:
>
> kumar11 wrote:
>
>> Could you please explain the meaning of below declaration statement.
>>
>> char (*pa())[4];
>
> "pa" is a function returning a pointer to an array of four characters.
>

You already have got the required answer from others.
C and function pointers can always be confusing. At times you think
you have understood it throughly and but still not be able to decode some
more complex declarations. (cdec can come to help but not always..at least not
in a technical interview ) The best approach that I have come across is
the `Clockwise Spiral` rule. (link :
http://www.c-faq.com/decl/spiral.anderson.html )

Hope this helps..

Thanks & Regards
Milind A Choudhary
http://www.csl.mtu.edu/~machoudh/

-- 
Milind  Arun Choudhary
