From: "Jason P. Winters" <jason@txt.com>
Subject: Re: realloc
Date: Mon, 5 Aug 2002 14:46:13 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200208052146.g75LkEOs023679@grinch.txt.com>
References: <20020805163543.A7759@atl.lmco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020805163543.A7759@atl.lmco.com> from "Chuck Winters" at Aug 05, 2002 04:35:43 PM
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chuck Winters <cwinters@atl.lmco.com>
Cc: linux-c-programming@vger.kernel.org

 
> Hello all,
> 	Anyone know why a program would freeze at realloc?  I thought
> if there was a problem, realloc would just fail.

Not really.  I've had that problem... it's a corrupted heap problem,
usually.  And the results are undefined.. :(

Ciao!

Jason
-- 
|UUCP  jason@txt.com                        Who wills, Can.
|VOICE (408) 243-3425                         Who tries, Does.
|LOCAL Hey, Jason!                              Who loves, Lives.          o_.
|Disclaimer:  Not me! I didn't do *THAT!*                                 <|
|Local Disclaimer:  I'm not here!                   A. McCaffrey           4
