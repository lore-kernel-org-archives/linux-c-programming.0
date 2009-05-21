From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: PIPE questions for Linux 2.4 setup
Date: Thu, 21 May 2009 20:51:52 +0100
Message-ID: <18965.45272.721883.642962@cerise.gclements.plus.com>
References: <9f924d250905210756l5db654abkf9c9fbc4170717ac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <9f924d250905210756l5db654abkf9c9fbc4170717ac@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: AdvandenBroek.nl@gmail.com
Cc: linux-c-programming@vger.kernel.org


Ad van den Broek wrote:

> Dear C/Linux friends,
> 
> We wanted to increase PIPE_SIZE (from 4K to 8K on linux 2.4 on an AMD
> LX800 system).
> The result is a segmentation error as soon as Read() is reading more
> data than 4K
> from the pipe.
> So pipe data seems to be damaged.
> If we change PIPE_SIZE back tot 4K everything is running fine.
> Question-1: Any suggestion to prevent this segmentation error ?
> 
> * PIPE_SIZE
> If you look in the linux kernel code for PIPE_SIZE
> ("include/linux/pipe_fs_i.h") you find:
> #define PIPE_SIZE PAGE_SIZE
> I don't know if #define PIPE_SIZE PAGE_SIZE is necessary or just a
> simple shortcut.
> Question-2: Is it OK if PIPE_SIZE > PAGE_SIZE ?
> 
> * PAGE_SIZE
> Question-3: Is it OK to increase Page_size on linux 2.4 on AMD LX800 system ?
> Which aspects are limiting the user to config the PAGE_SIZE ?

The page size is hardcoded in silicon; you can't change it in
software.

And the kernel itself no longer refers to PIPE_SIZE (it did in earlier
2.6 versions), so there's not much point in changing it.

-- 
Glynn Clements <glynn@gclements.plus.com>
