From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: How to execute a process in background by exec functions?
Date: Mon, 12 Apr 2004 00:02:22 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16505.52862.698829.458397@cerise.nosuchdomain.co.uk>
References: <80BEFFCCAAE8E374782232F2462F1582@jlalarcon.bunniwerks.zzn.com>
	<1081703027.19558.5.camel@Marx.fesnel.no-ip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1081703027.19558.5.camel@Marx.fesnel.no-ip.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org
Cc: Jose Luis Alarcon Sanchez <jlalarcon@bunniwerks.zzn.com>


John T. Williams wrote:

> The single quotes need to be double quotes 
> so the call should look like 
> 
> execl("/bin/ls", "ls", 0);  

Actually:

	execl("/bin/ls", "ls", (void *) 0);

The difference matters on systems where sizeof(void*) != sizeof(int).

-- 
Glynn Clements <glynn.clements@virgin.net>
