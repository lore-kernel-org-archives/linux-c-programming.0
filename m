From: Bryan Christ <bryan.christ@gmail.com>
Subject: Re: running out of file descriptors
Date: Mon, 16 Feb 2009 11:39:28 -0600
Message-ID: <444391460902160939x639e2289gc8fbe7cd75f6ee0f@mail.gmail.com>
References: <444391460902152148u11d4a973ka5a630898405d1c6@mail.gmail.com>
	 <3605561d0902152218t431d9edbuf87397bdc9af999@mail.gmail.com>
	 <444391460902152309h179bd75agdded10ca6af135d@mail.gmail.com>
	 <18841.25815.270749.45139@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=nVWhNe48qzdORevcW9i4z7Jeb70pwxh8geuncm39HtQ=;
        b=fp8YQ73wC5akr6wMrk1Ut8eZCubpo36+lk0sA4KmrDN+Aeob00kfiPTeh0S58pnyX8
         uAUTDhR+m8QPVl9iREv8+kc9+ZwKgBmfdj42jslpC9k4aZmlUUjmtpFc5dLt32xuKDDW
         lnWrhGnZOA4jzbdsMQpy2/tMsZV3P7njA0qNY=
In-Reply-To: <18841.25815.270749.45139@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Joe Damato <ice799@gmail.com>, linux-c-programming@vger.kernel.org

Yes--the daemon runs as root.  It believe it's running out of file
descriptors because as soon as I hit that magic 700 number, the
daemons fail to stop accepting connections and all of the transfer
threads start aborting with EPIPE.  My only other thought is perhaps I
am somehow hitting a limit on the number of open sockets I can have...
but as far as I know that is the same as the number of max open file
descriptors.

On Mon, Feb 16, 2009 at 7:06 AM, Glynn Clements
<glynn@gclements.plus.com> wrote:
>
> Bryan Christ wrote:
>
>> >> I am writing a multi-threaded application which services hundreds of
>> >> remote connections for data transfer.  Several instances of this
>> >> program are run simultaneously.  The problem is that whenever the
>> >> total number of active user connections (cumulative total of all open
>> >> sockets tallied from all process instances) reaches about 700 the
>> >> system appears to run out of file descriptors.  I have tried raising
>> >> the open files limit via "ulimit -n" and by using the setrlimit()
>> >> facility.  Neither of these seem to help.  I am currently having to
>> >> limit the number of processes running on the system to 2 instances
>> >> allowing no more than 256 connections each.
>> >
>> > Have you tried editing /etc/security/limits.conf  (or equivalent file
>> > on your system) to increase the max number of open files?
>>
>> It seems that would be the same as setting RLIMIT_NOFILE via
>> setrlimt() or the same as using the userspace tool "ulimit -n".  Am I
>> wrong?  Isn't this the same?
>
> Is your daemon running as root? If not, it cannot increase any hard
> resource limit. Are you checking the return value (and errno) from
> setrlimit()?
>
> BTW, what do you mean by "appears to run out of file descriptors"?
> Which system call fails, and with what error?
>
> --
> Glynn Clements <glynn@gclements.plus.com>
>



-- 
Bryan
<><
