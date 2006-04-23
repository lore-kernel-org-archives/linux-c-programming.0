From: Tassilo Horn <heimdall@uni-koblenz.de>
Subject: Re: Getting resource usage informations of a process
Date: Sun, 23 Apr 2006 12:59:23 +0200
Message-ID: <871wvoa778.fsf@baldur.nicundtas.de>
References: <87r73snzqg.fsf@baldur.nicundtas.de>
	<17480.57948.42893.816927@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Glynn Clements <glynn@gclements.plus.com> writes:

Hi Glynn,

>> Is getrusage()/wait4() broken, or not intended to be used like this?
>
> GNU libc uses mmap(MAP_ANONYMOUS) for large blocks; this isn't
> accounted for by conventional Unix resource handling mechanisms
> (getrusage, setrlimit etc).

Ah, thanks.

>> How can I get correct memory resource usage informations of a (child)
>> process (without changing the code of the process' applications)?
>
> Parse /proc/<pid>/maps. Any entries with an inode of zero (other than
> the heap and stack regions) correspond to mmap(MAP_ANONYMOUS).

The problem with that approach is, that I want some statistics over the
complete runtime of the process. So I would have to parse
/proc/<pid>/maps every few tenth of a second, sorting out what's seen
before, etc. which would produce a great overhead and could have effects
on the processes I want to inspect. Or do I get you wrong, here?

BTW: The infos of /proc/<pid>/status are looking interesting, too
(VmPeak, VmSize, VmData, ...). But then another question is, how do I
know when a process finishes? Is there some sort of signalling: "Hey,
Process XY's going to die now!"?

Kind regards,
Tassilo
-- 
A morning without coffee is like something without something else.

