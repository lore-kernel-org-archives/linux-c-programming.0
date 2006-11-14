From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: max heap usage of a Linux process
Date: Tue, 14 Nov 2006 10:57:55 +0000
Message-ID: <17753.41267.125633.668756@cerise.gclements.plus.com>
References: <455873BA.1060908@Sun.COM>
	<d9def9db0611130609q305b243y188f01902c9ff418@mail.gmail.com>
	<1450f66c0611130739k5391a9adu26f9698f22df4c85@mail.gmail.com>
	<4559619F.3090904@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4559619F.3090904@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Cc: Dan Gary <funkychunkymunky@gmail.com>, linux-c-programming@vger.kernel.org


Prasanta Sadhukhan wrote:

> Actually, I have the process-pid(s) and I want to find out 
> programmatically, what's the max heap size that had been consumed by 
> that process at any given moment(based on user command) from another 
> process.

Then you need to read the files in /proc/<pid>/*. There isn't a system
call to get resource usage for another process.

Note that you won't be able to determine how much of the allocated
heap is free or used; that information is internal to the process, and
isn't visible externally.

-- 
Glynn Clements <glynn@gclements.plus.com>
