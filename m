From: Hendrik Visage <hvjunk@gmail.com>
Subject: Re: About the memory ordering and function call
Date: Wed, 5 Feb 2014 07:14:27 +0200
Message-ID: <CADtGFvnLNsfzf67_2nu=Ca9O1K2PrYmBMjRGQQ7vv=aHpWEEUw@mail.gmail.com>
References: <52F19297.9070703@cn.fujitsu.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=Fp8d2DGQAr4GrhPvjTjmJcxQy7bqSgMJCUUYt3sRpW4=;
        b=x1P5kmcPNy/OVHEys1MmKhGTpn5edgZTVHRD5laZq1F0KvLSkUfxlDYCQf2y9qwjtD
         ZnE91oZ5fW036xUHTQK7/VlSQLztI+JI+aEaB0bQwUnKRPtbod/KcXFFO6USy8klrCBF
         TPuQgxbTjbusCdoeka7wl3ONSpCpcPuUDCrb/HOqOv0kH2LfX00e4BL9akIPjfhiaWI8
         +xIcXkcLz2kbQiX2ElNlidjyoBlt28qafkMMUzcHH/zOqqC7Qr8YbFMUqvAg3jpqM9Xb
         AqASMX4j/b3fxWDKZYwFqgj5vxr6hGQBZpEsgKG3NuWGfhukpK6X63lHS8NCOh2pZUgv
         JQkw==
In-Reply-To: <52F19297.9070703@cn.fujitsu.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Qu Wenruo <quwenruo@cn.fujitsu.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hi Qu,

 Don't have the answer, but perhaps try different compilers, different
optimization options? Once you've found a combination, then take the
compiled instructions, and I believe the compiler guys might be better
help then in understanding/fixing the instruction ordering/etc..

Hendrik

On Wed, Feb 5, 2014 at 3:23 AM, Qu Wenruo <quwenruo@cn.fujitsu.com> wrote:
> Hi,
>
> Notsure it's suitable to ask here,but a strange memory order related
> problem happens.
> Related codes are like below (somewhat simplified)
>
> ------
> struct my_work {
> /* someunrelated variants */
> struct SOME_OTHER_STRUCT *my_pointer; <<< Attention here
> struct work_struct normal_work;
> };
>
> void my_queue_work(struct workqueue_struct *wq, <<< wq is WQ_UNBOUND
> workqueue
> struct my_work *work)
> {
> /*
> * the work->normal_work is initialized somewhere else,
> * and the work job will use the work->my_pointer.
> */
>
> work->my_pointer = something; <<< The problem
> /* Do something else */
> queue_work(wq, work->normal_work);
> }
> ------
>
> The codes runs fine on all my *INTEL* boxes but kernel panic on *AMD*
> boxes(othertesters', so I can't reproduce it),
> when the work is executed, a NULL pointer exception will happen.
> After tracing the backtrace,it happens that the work->my_pointer is not
> set to proper address and isstill NULL.
>
> So I have some questionsabout the problem.
> 1) Should I add an smp_mb() behind "work->my_pointer = something"?
>
> 2) Why the smp_mb() in queue_work() function can't ensure
> "work->my_pointer" is set?
> More accuratly, will smp_mb() affect outside of a function call?
> Forreference, the smp_mb() lies like below:
> queue_work()
> queue_work_on()
> __queue_work()
> insert_work()
> smp_mb()
>
> 3) Why INTEL CPUs can't trigger the problem?
> Wikipedia says that AMD CPUs has somewhat weak memory ordering than
> Intel, may it be the problem?
>
> Thanks,
> Qu
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
