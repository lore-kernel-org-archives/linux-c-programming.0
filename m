From: "Christ, Bryan" <bryan.christ@hp.com>
Subject: Re: max heap usage of a Linux process
Date: Tue, 14 Nov 2006 09:19:57 -0600
Message-ID: <1163517597.23620.7.camel@tuxdev.americas.hpqcorp.net>
References: <455873BA.1060908@Sun.COM>
	 <d9def9db0611130609q305b243y188f01902c9ff418@mail.gmail.com>
	 <1450f66c0611130739k5391a9adu26f9698f22df4c85@mail.gmail.com>
	 <4559619F.3090904@sun.com>
	 <17753.41267.125633.668756@cerise.gclements.plus.com>
Reply-To: bryan.christ@hp.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17753.41267.125633.668756@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>, Dan Gary <funkychunkymunky@gmail.com>, linux-c-programming@vger.kernel.org

If you don't feel like reading proc or want to make things more
portable, use libgtop.

On Tue, 2006-11-14 at 10:57 +0000, Glynn Clements wrote:
> Prasanta Sadhukhan wrote:
> 
> > Actually, I have the process-pid(s) and I want to find out 
> > programmatically, what's the max heap size that had been consumed by 
> > that process at any given moment(based on user command) from another 
> > process.
> 
> Then you need to read the files in /proc/<pid>/*. There isn't a system
> call to get resource usage for another process.
> 
> Note that you won't be able to determine how much of the allocated
> heap is free or used; that information is internal to the process, and
> isn't visible externally.
> 
