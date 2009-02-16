From: Bryan Christ <bryan.christ@gmail.com>
Subject: Re: running out of file descriptors
Date: Mon, 16 Feb 2009 01:09:42 -0600
Message-ID: <444391460902152309h179bd75agdded10ca6af135d@mail.gmail.com>
References: <444391460902152148u11d4a973ka5a630898405d1c6@mail.gmail.com>
	 <3605561d0902152218t431d9edbuf87397bdc9af999@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=n7esREroV2D01jxjeCyhKQEhZmtTEz348g4rugDPI/E=;
        b=detEzD1kmDtiH8IgYTbIJKeROXiKfn/WOoVsm4WOTQ4yqfgsh1mTZCI2S1gQYwmcY+
         hGOaTTUfj5uPprC3hhtcjJ3qc1O/XyujM1bDe+yvDYBMzL1qags5rvjmg9aNURJv+4PC
         vHIsZ1/chBqB5Dj8iJAVZUw5Cps8a5OwdLlXE=
In-Reply-To: <3605561d0902152218t431d9edbuf87397bdc9af999@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Damato <ice799@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Mon, Feb 16, 2009 at 12:18 AM, Joe Damato <ice799@gmail.com> wrote:
> On Sun, Feb 15, 2009 at 9:48 PM, Bryan Christ <bryan.christ@gmail.com> wrote:
>> I am writing a multi-threaded application which services hundreds of
>> remote connections for data transfer.  Several instances of this
>> program are run simultaneously.  The problem is that whenever the
>> total number of active user connections (cumulative total of all open
>> sockets tallied from all process instances) reaches about 700 the
It seems that would be the same as setting RLIMIT_NOFILE via
setrlimt() or the same as using the userspace tool "ulimit -n".  Am I
wrong?  Isn't this the same?

>> system appears to run out of file descriptors.  I have tried raising
>> the open files limit via "ulimit -n" and by using the setrlimit()
>> facility.  Neither of these seem to help.  I am currently having to
>> limit the number of processes running on the system to 2 instances
>> allowing no more than 256 connections each.
>
> Have you tried editing /etc/security/limits.conf  (or equivalent file
> on your system) to increase the max number of open files?
>
> perhaps something like:
> *              -       nofile         524288
>
> is what you want?
>
> joe
>



-- 
Bryan
<><
