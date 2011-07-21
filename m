From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: time system call expensive?
Date: Thu, 21 Jul 2011 13:20:18 +0200
Message-ID: <op.vyyu34nf3l0zgt@mnazarewicz-glaptop>
References: <CA+NBAy6499cgdzwGuPk6h+Y3D-DxEHP2HEKjtNAgis7K4RTKig@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=sender:content-type:to:subject:references:date:mime-version
         :content-transfer-encoding:from:message-id:in-reply-to:user-agent;
        bh=M7PZEKSO+9s6aEe1u94SKvChEBUeUrzexALq3l+U4Os=;
        b=ks8/1dUXup/vFvFMXxNGcthEggc9wAXfF51niMydmC+c/8FqihEINRlERUXEdbCqQM
         LbgAmzcQtgJzUgXoqw7iCgd7mkF66IbrnXAtUO7Chdwj5Vc7/NWPRGN8w6Mx/RErPu0J
         lsiWHToXueORtHF1nUBnxopJjHMBya6fVXrkM=
In-Reply-To: <CA+NBAy6499cgdzwGuPk6h+Y3D-DxEHP2HEKjtNAgis7K4RTKig@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming <linux-c-programming@vger.kernel.org>, Vadiraj <vadiraj.cs@gmail.com>

On Thu, 21 Jul 2011 06:41:14 +0200, Vadiraj <vadiraj.cs@gmail.com> wrote:
> I'm evaluating time consumed by method. I'm using time(NULL) system
> call to capture time before and after the call to the function.
> Just wanted to know if this has a considerable performance hit? For
> all I believe time syscall is quite optimized and should not really be
> matter of concern.
>
> Please let me know if someone have evaluated time(NULL) system over  
> head..
>
> Assuming the method I'm evaluating is a frequently called method.

Why do you worry about it?  What do you need the time for?  If are
really using time(2) it means that the function you're calling run time
is counted in seconds.  If that's the case, two call to time(2) are
by all means negligible.

If you need in for benchmark, you would probably do something like:

start = time(NULL)
for (vary big number)
     call function you benchmark
end = time(NULL)

In either case, you should check gettimeofday(2).

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz    (o o)
ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
