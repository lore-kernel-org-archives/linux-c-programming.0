From: Bogdan Cristea <bogdan.cristea@upmc.fr>
Subject: Re: duplicated modulo
Date: Fri, 1 Apr 2011 11:30:46 +0200
Message-ID: <201104011130.46406.bogdan.cristea@upmc.fr>
References: <20110401114113.6e2e91af@absol.kitzblitz> <op.vs86ylxn3l0zgt@mnazarewicz-glaptop> <20110401121916.34a567da@absol.kitzblitz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20110401121916.34a567da@absol.kitzblitz>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Nicolas Kaiser <nikai@nikai.net>
Cc: linux-c-programming@vger.kernel.org

On Friday, April 01, 2011 12:19:16 pm you wrote:
> Sure. But I fail to see where between
> 
> a %= b;
> a %= b;
> 
> and
> 
> a = (a % b) % b;
> 
> and
> 
> a %= b;
> 
> would be a difference?

That is basic math. Once you have obtained the remainder of the division by b, 
taking the second time the remainder makes no sense.

-- 
Bogdan Cristea
