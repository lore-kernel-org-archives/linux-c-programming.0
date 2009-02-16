From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: running out of file descriptors
Date: Mon, 16 Feb 2009 13:06:31 +0000
Message-ID: <18841.25815.270749.45139@cerise.gclements.plus.com>
References: <444391460902152148u11d4a973ka5a630898405d1c6@mail.gmail.com>
	<3605561d0902152218t431d9edbuf87397bdc9af999@mail.gmail.com>
	<444391460902152309h179bd75agdded10ca6af135d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <444391460902152309h179bd75agdded10ca6af135d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bryan Christ <bryan.christ@gmail.com>
Cc: Joe Damato <ice799@gmail.com>, linux-c-programming@vger.kernel.org


Bryan Christ wrote:

> >> I am writing a multi-threaded application which services hundreds of
> >> remote connections for data transfer.  Several instances of this
> >> program are run simultaneously.  The problem is that whenever the
> >> total number of active user connections (cumulative total of all open
> >> sockets tallied from all process instances) reaches about 700 the
> >> system appears to run out of file descriptors.  I have tried raising
> >> the open files limit via "ulimit -n" and by using the setrlimit()
> >> facility.  Neither of these seem to help.  I am currently having to
> >> limit the number of processes running on the system to 2 instances
> >> allowing no more than 256 connections each.
> >
> > Have you tried editing /etc/security/limits.conf  (or equivalent file
> > on your system) to increase the max number of open files?
> 
> It seems that would be the same as setting RLIMIT_NOFILE via
> setrlimt() or the same as using the userspace tool "ulimit -n".  Am I
> wrong?  Isn't this the same?

Is your daemon running as root? If not, it cannot increase any hard
resource limit. Are you checking the return value (and errno) from
setrlimit()?

BTW, what do you mean by "appears to run out of file descriptors"?
Which system call fails, and with what error?

-- 
Glynn Clements <glynn@gclements.plus.com>
