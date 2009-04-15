From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Is there a way to force suspended process's memory to swap space?
Date: Wed, 15 Apr 2009 04:28:24 +0100
Message-ID: <18917.21592.802252.709725@cerise.gclements.plus.com>
References: <56b13acf0904140103x52978583hdf00ba46d5fa3c73@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <56b13acf0904140103x52978583hdf00ba46d5fa3c73@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mingliang <longapple@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Mingliang wrote:

> For example, my process continuously consumes 30MB memory.
> $ ps aux|grep job
> joe      17941  0.0  0.3 33104 31096 pts/16  S    15:50   0:00 ./job 30
>                                            ^^^^^^^
> 
> Now I stop it
> $kill -STOP  17941
> [1]+  Stopped                 ./job 30
> 
> $ ps aux|grep job
> joe      17941  0.0  0.3 33104 31096 pts/16  T    15:50   0:00 ./job 30
> 
> So it doesn't consume CPU time any more, BUT is there also a way to
> swap out the 30MB memory?
> Can it be accomplished manually (some signal, maybe?) or is it only
> the kernel who can make decision?

You can't force it to be swapped out.

If it's suspended long enough, it will get swapped out eventually.

-- 
Glynn Clements <glynn@gclements.plus.com>
