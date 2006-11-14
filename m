From: Al Boldi <a1426z@gawab.com>
Subject: Re: max heap usage of a Linux process
Date: Tue, 14 Nov 2006 14:39:38 +0300
Message-ID: <200611141439.38048.a1426z@gawab.com>
References: <455873BA.1060908@Sun.COM> <4559619F.3090904@sun.com> <17753.41267.125633.668756@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17753.41267.125633.668756@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-c-programming@vger.kernel.org

Glynn Clements wrote:
> Prasanta Sadhukhan wrote:
> > Actually, I have the process-pid(s) and I want to find out
> > programmatically, what's the max heap size that had been consumed by
> > that process at any given moment(based on user command) from another
> > process.
>
> Then you need to read the files in /proc/<pid>/*. There isn't a system
> call to get resource usage for another process.

Wow, really?  Reading /proc/<pid>/* is pretty expensive, especially if you 
have to do it for 1000's of procs.

That's probably why top is such a cpu-hog.


Thanks!

--
Al


