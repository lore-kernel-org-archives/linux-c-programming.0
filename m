From: "Bert Wesarg" <bert.wesarg@googlemail.com>
Subject: Re: How to name the pthread or Renaming?
Date: Tue, 11 Mar 2008 14:05:35 +0100
Message-ID: <36ca99e90803110605g16ed53a8je2e40316c9618ca4@mail.gmail.com>
References: <47D51268.7020705@sun.com>
	 <36ca99e90803100723q142411e0r8e0462be8eac5d6d@mail.gmail.com>
	 <47D54A87.6010608@sun.com>
	 <36ca99e90803100941u4294b271lb295ad4b2a3b33ed@mail.gmail.com>
	 <47D61F00.1090507@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Mmfsgco2l8FZKI2QTXm8M4iCJdNRuHZsUdZxO5gZyZg=;
        b=jmvY78qpFCPNm8F/2q4zFizkBuTTdetGU4Vtd8GfAP7CYx4S9OD4NHq79LacYFjHc47m4PWAa5VCc9Pt+MhF5MunceFFohzfsJyfXG8r+3n0zaHiJlTzE0Sn6SHutSg/zm0PYSFWMpZDp6MhYlJ7y6qU1wpn/j+6aVXN18l+odk=
In-Reply-To: <47D61F00.1090507@sun.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ziaudeen.Abdulrazak@sun.com
Cc: linux-c-programming@vger.kernel.org

On Tue, Mar 11, 2008 at 6:56 AM, ziaudeen <Ziaudeen.Abdulrazak@sun.com> wrote:
>
>  Hi Bert,
>  As the pthread_create or any other pthread functionality API is not
> available to set a name to the thread, so I have tried with the prctl() with
> PR_SET_NAME. I am able to set the name for the thread.successfully, since it
> is considered as LWP(light weight process), it is individually setting the
> name for the thread. I have checked this by using prctl() -PR_GET_NAME
> getting the name back from each thread and print it, I will be able to see
> the individual thread name, what I have change it. So now the problem is I
> am unable to see the LWP process name through PS command, even though the
> name is present for each thread. So I would like to know whether any other
> command present to see the pthread names.
Ok, I was wrong, the name you can set with prctl is indeed a
per-thread attribute. you can see this either in the stat file from
the /proc filesystem (inside parentheses) or with ps and the comm
format, not the args format, and the same with top, where you switch
this with 'c'.

Bert
>
>
>
>  Regards
>  Ziaudeen
>
>  Bert Wesarg wrote:
>  Sorry, forgot the ML as CC. I put the ML back on the CC.
>
> On Mon, Mar 10, 2008 at 3:49 PM, ziaudeen <Ziaudeen.Abdulrazak@sun.com>
> wrote:
>
>
>  Hi Bert,
>
>  It is the name which I set using the prctl function prctl(PR_SET_NAME,<null
> terminated string.,0,0,0). It is successfully setting the name for the
> thread. But I don't know how to see the changed thread name using the
> command
>  like ps -eLf or ps H.
>
>  as the named suggest, prctl(2) is to control a process's attributes.
> The name is a attribute to the whole process, and can not be set
> individual per thread.
>
>
>
>
>
>  Do you suggest something for me to try to see the changed name of each
> thread?
>
>
>
>  No, because I think you can not set the name for each thread, at most
> for the process.
>
> Anyway, I'm a little confused, in your first mail, you asked how to
> set the name for a thread created with pthread_create(3), and now you
> ask how you can see the changed name of a thread!
>
> Bert
>
>
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
>
>
>
