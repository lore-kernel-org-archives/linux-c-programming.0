From: "J." <mailing-lists@xs4all.nl>
Subject: Re: binary tree traversal...
Date: Thu, 27 Jan 2005 21:06:22 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0501272100300.32584-100000@hestia>
References: <200501262007.19118.eric@cisu.net>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200501262007.19118.eric@cisu.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, 26 Jan 2005, Eric Bambach wrote:

> On Wednesday 26 January 2005 05:01 pm, J. wrote:
> > Wednesday, January 26

> > I guess there is something wrong in my reasoning about this...
> 
> Yea, that definatly wont work. I think you're messing up because a recursive 
> function can only pass back the top node, or a node that meets a certain 
> condition back up the calling stack, without static data, you cant call a 
> recursive function and keep going where it left off so you can only return 
> one node.

Aha, of course momement here ! ;-)
 
> Why dont you just pass a function pointer into the recursive function so it 
> looks like this:(pseudocode, my function pointer syntax is bad)

Thnkx...

I slept a night over it and decided that it was way more effecient for my
program to keep an shadow array of pointers to each node in the tree.
That way it's easy sorting, iter etc.. And it works without a large mem
increase.

Thnkx again.. for the answer.

J.

