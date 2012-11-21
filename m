From: Celelibi <celelibi@gmail.com>
Subject: Re: cat a /proc entry
Date: Wed, 21 Nov 2012 15:36:57 +0200
Message-ID: <CAJR2zJ-dOT3YbzHC55+Z-t98YqGaX=dEm9uY6mqxK6G1QXpKtg@mail.gmail.com>
References: <CAGZFCEFaWrXMDAjCrXipiPyLxeWaQzGgn=GtLZhFHDwdrMAHcw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=6ZxDHtO4unFynCfBLHDGDXzJPyKeSGaIeBYxWnD6src=;
        b=p8tWTdPUVsRSlW+G1hQshizytIM6bWBCRWNhpb4/0NWPcKnKUY2rw+Aq3rPZjz8MET
         4A/jgSA4WmzEXYJbbbYSWbbS/acKgSHL311spokzGbDhEwGC3mz6heYfKjII5bXE6t9+
         efQitNS6hkgWI5ynIYlgQzGyawDRR34kBmX+2IBXhioEr89mNYMWnsm6K9II6E/yJNjz
         aNTPPKxVwft2tj7sBhESNMcvCbWYuJim6s+BlyBAnPzY44xnAPCshOSvXHOIGxaRxXgM
         9MNkdTSEPcJBALZnFadeNtxZJf7MJI9iz57maIOgJGQHN/XU6SAaYlhbDv74uFJBVOp+
         A7FQ==
In-Reply-To: <CAGZFCEFaWrXMDAjCrXipiPyLxeWaQzGgn=GtLZhFHDwdrMAHcw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-newbie <linux-newbie@vger.kernel.org>, linux-c-programming@vger.kernel.org

2012/11/21, ratheesh kannoth <ratheesh.ksz@gmail.com>:
> Hi,
>
> is there size limit on the buffer content as i am using  "cat" command
> ( so ,not allocating any buffer in userspace, so not doing any
> copy_to_user from kernel; simply doing  sprintf(buffer, %s , data )
> from kernel  for a big data  )
>
> -Ratheesh

Hello,

I'm not sure to understand your problem.
Do you write userland or kernelland code?
If you write kernel code, why don't you just use the API behind the
/proc file system?
If you write userland code, what is your problem with the buffer
allocation? You can allocate a buffer as big as your memroy allows it.


Celelibi
