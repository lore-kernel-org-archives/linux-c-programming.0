From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: C/C++ Debugging techniques
Date: Wed, 12 Jun 2002 16:28:54 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020612162854.H17527@neutrino.particles.org>
References: <20020604071008Z316528-22651+74173@vger.kernel.org> <20020612115900Z317464-22020+2833@vger.kernel.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020612115900Z317464-22020+2833@vger.kernel.org>; from adam@luchjenbroers.com on Wed, Jun 12, 2002 at 09:31:47PM +0930
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Luchjenbroers <adam@luchjenbroers.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, Jun 12, 2002 at 09:31:47PM +0930, Adam Luchjenbroers wrote:

> So I plan to attempt to fix the code. Before I started I thought I'd ask for 
> advice on techniques for debugging code and how to make use of things such as 
> core-dumps to find the problem. I hope to learn something from the advice 
> people may give me.

Use Electric Fence or memprof to find critical memory corruption errors,
mem leaks, etc. Inspect the core files using gdb to see where the bug
is:

% gdb ./foo ./core
[...]
% where

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
