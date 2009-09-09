From: Zhenwen Xu <helight.xu@gmail.com>
Subject: Re: Division in loop
Date: Wed, 9 Sep 2009 08:45:31 +0800
Message-ID: <20090909004531.GA3264@helight>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
Reply-To: Zhenwen Xu <helight.xu@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:reply-to:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=goJcJjcKwW2ZdMraNPSBPZc7XcykyZerNZU9WKI6vao=;
        b=O1Hf77Av1T4FQn1MxrvuU3fhohrAFezI4/ZvQA73Vk9c90MNL6KlxfXLhHLI2Re+kM
         U4jRnuwBYZL31d64j4w8yDWnxcy1jqBHd7IFbhAmp6bSFPfp76cydsYm0CiTosf7Z2Fb
         5Ayn0kJAyq1fxlcYANljmrLXePRx2K3S1E+t8=
Content-Disposition: inline
In-Reply-To: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, Sep 08, 2009 at 09:40:30PM +0700, Randi Botse wrote:
> hi all,
> 
> ....
> int fd, fdp;
> unsigned int size;
> int progress = 0;
> size_t bytes = 0;
> void *buffer;
> ....
> 
> /* open fd from a device then create fdp, allocate buffer,, etc. */
> 
> while (bytes < size) {
>         ret = read(fd, buffer + bytes, size - bytes);
>         if (ret == -1) {
>             perror("read");
>             return -1;
>         }
>         ret = write(fdp, buffer + bytes, ret);
>         if (ret == -1) {
>             perror("write");
>             return -1;
>         }
>         bytes += ret;
> 
>         progress = (int) ((bytes / size) * 100);
>         printf("\rcompleted: %i%%", progress);

printf them all and check them:

         printf("\rcompleted: %i%% bytes: %d size: %d \n", progress, bytes, size);

>         fflush(stdout);
>     }
> 
> ....
> 
> I run this loop to receive some data, the printf() seem not updated,
> the progress output is
> always in it's initial value until the loop was finished. but when i do...
> 
> progress = (int) ((bytes / 2) * 100); /* change size to 2 (or random number) */
> 
> then it's works... what's wrong here???
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
--------------------------------
http://zhwen.org - Open and Free
