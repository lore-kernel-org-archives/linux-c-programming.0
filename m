From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: specifying process priority
Date: Mon, 25 Aug 2003 04:19:02 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16201.32807.775.458421@cerise.nosuchdomain.co.uk>
References: <Pine.GSO.4.56.0308242242470.24177@uni01du.unity.ncsu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.GSO.4.56.0308242242470.24177@uni01du.unity.ncsu.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Palash Mohanlal Kasodhan <pmkasodh@unity.ncsu.edu>
Cc: linux-c-programming@vger.kernel.org


Palash Mohanlal Kasodhan wrote:

>     Is there a way to specify the priority of a process you are creating
> by fork() besides using the 'nice' command..more specifically an API call
> to specify the priority at the time of creating a process ..like an RTOS

	setpriority()

-- 
Glynn Clements <glynn.clements@virgin.net>
