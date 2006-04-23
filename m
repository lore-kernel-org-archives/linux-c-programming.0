From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Getting resource usage informations of a process
Date: Sun, 23 Apr 2006 15:28:20 +0100
Message-ID: <17483.36612.294727.811224@cerise.gclements.plus.com>
References: <87r73snzqg.fsf@baldur.nicundtas.de>
	<17480.57948.42893.816927@cerise.gclements.plus.com>
	<871wvoa778.fsf@baldur.nicundtas.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <871wvoa778.fsf@baldur.nicundtas.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tassilo Horn <heimdall@uni-koblenz.de>
Cc: linux-c-programming@vger.kernel.org


Tassilo Horn wrote:

> >> How can I get correct memory resource usage informations of a (child)
> >> process (without changing the code of the process' applications)?
> >
> > Parse /proc/<pid>/maps. Any entries with an inode of zero (other than
> > the heap and stack regions) correspond to mmap(MAP_ANONYMOUS).
> 
> The problem with that approach is, that I want some statistics over the
> complete runtime of the process. So I would have to parse
> /proc/<pid>/maps every few tenth of a second, sorting out what's seen
> before, etc. which would produce a great overhead and could have effects
> on the processes I want to inspect. Or do I get you wrong, here?

If you want to continuously monitor resource usage, efficiency could
be an issue. But I don't think that there's any other way to obtain
that information.

> BTW: The infos of /proc/<pid>/status are looking interesting, too
> (VmPeak, VmSize, VmData, ...). But then another question is, how do I
> know when a process finishes? Is there some sort of signalling: "Hey,
> Process XY's going to die now!"?

The parent receives SIGCHLD when a child terminates. However, at that
point, /proc/<pid>/maps will be empty, as the process will have
released all of its resources. The only information which you can
obtain once the process has terminated is that returned by wait4()
etc.

-- 
Glynn Clements <glynn@gclements.plus.com>
