From: ibraheem umaru-mohammed <iumarumo@eidosnet.co.uk>
Subject: Re: actual memory size
Date: Wed, 31 Jul 2002 17:16:55 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020731161655.GH1595@micromuse.com>
References: <3D47C16C.26CE722D@cs.unt.edu>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3D47C16C.26CE722D@cs.unt.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C news group <linux-c-programming@vger.kernel.org>

[Mehran Rezaei wrote...]
-| Hello,
-| 
-| Is anyone aware of a shell command that tells you the size of physical
-| memory used in your computer?
-| Any help is appreciated.
-| So long,
-| 
-| Mehran
-| 

try 'free':

			-- cut here --
ibraheem@ignoramus:1 $ free
	
             total       used       free     shared    buffers     cached
Mem:       1027924     1014776     13148        324     119456     715936 
-/+ buffers/cache:      179384 	  848540 
Swap:      2040244	     0	 2040244	
			-- cut here --

Kindest regards,

			--ibs.

-- 
			ibraheem umaru-mohammed
			   www.micromuse.com
			         --0--
