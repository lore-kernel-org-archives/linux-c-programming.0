From: "Bert Wesarg" <bert.wesarg@googlemail.com>
Subject: Re: How to name the pthread or Renaming?
Date: Mon, 10 Mar 2008 17:41:05 +0100
Message-ID: <36ca99e90803100941u4294b271lb295ad4b2a3b33ed@mail.gmail.com>
References: <47D51268.7020705@sun.com>
	 <36ca99e90803100723q142411e0r8e0462be8eac5d6d@mail.gmail.com>
	 <47D54A87.6010608@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=aXI4viArIVRppHFPbXukAx9bgoI4xsW2Qooj55hxwhg=;
        b=qoBFHc6vOBsMpWLSAH/H1o2xxkfwbWf6Wm8n60WOu3/qGzdhz7y67TIFMKe7VqsiDwqmPzwNbNj2Py4+HZsyVKDl5omDYXr61Xuz5/mmm+I537QnDMWfCHvCNDYQd4MF2Z/l6+bcXV+RQjVhQOIUDQSg4BeYaO7/+Z4b3yfAP9Y=
In-Reply-To: <47D54A87.6010608@sun.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ziaudeen.Abdulrazak@sun.com
Cc: linux-c-programming@vger.kernel.org

Sorry, forgot the ML as CC. I put the ML back on the CC.

On Mon, Mar 10, 2008 at 3:49 PM, ziaudeen <Ziaudeen.Abdulrazak@sun.com> wrote:
>
>  Hi Bert,
>
>  It is the name which I set using the prctl function prctl(PR_SET_NAME,<null
> terminated string.,0,0,0).  It is successfully setting the name for the
> thread. But I don't know how to see the changed thread name using the
> command
>   like ps -eLf or ps H.
as the named suggest, prctl(2) is to control a process's attributes.
The name is a attribute to the whole process, and can not be set
individual per thread.

>
>  Do you suggest something for me to try to see the changed name of each
> thread?
No, because I think you can not set the name for each thread, at most
for the process.

Anyway, I'm a little confused, in your first mail, you asked how to
set the name for a thread created with pthread_create(3), and now you
ask how you can see the changed name of a thread!

Bert

>
>  Regards
>  Ziaudeen
>
>
>
>
>  Bert Wesarg wrote:
>  Hi,
>
> On Mon, Mar 10, 2008 at 11:50 AM, ziaudeen <Ziaudeen.Abdulrazak@sun.com>
> wrote:
>
>
>  Hi,
>
>  While creating a pthread using the pthread_create function, Is there any
>  ways to change/give the name of the thread to our custom names?
>
>  About what name do you talking, the name of the binary, which is shown
> in ps/top/...?
>
> If its some internal name, posix threads have no such thing.
>
> Bert
>
>
>
>  Please help me, I am a new bee to linux programming
>
>  Regards
>  Ziaudeen
>
>
>
