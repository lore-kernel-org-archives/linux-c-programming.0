From: chuckw@ieee.org
Subject: Re: C/C++ Debugging techniques
Date: Thu, 13 Jun 2002 00:04:52 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020613000452.A22499@whatever.local>
References: <20020604071008Z316528-22651+74173@vger.kernel.org> <20020612115900Z317464-22020+2833@vger.kernel.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020612115900Z317464-22020+2833@vger.kernel.org>; from adam@luchjenbroers.com on Wed, Jun 12, 2002 at 09:31:47PM +0930
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, Jun 12, 2002 at 09:31:47PM +0930, Adam Luchjenbroers wrote:
> I plan to start doing some debugging and stabilisation work on an open-source 
> project. It provides the functionality I'm looking for but is incredibly 
> unstable.
> 
> So I plan to attempt to fix the code. Before I started I thought I'd ask for 
> advice on techniques for debugging code and how to make use of things such as 
> core-dumps to find the problem. I hope to learn something from the advice 
> people may give me.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

If you are inexperienced with command line debuggers, there are a few nice
graphical ones.  The one I use is ddd which is a frontend to gdb and a few
other possible debuggers.

Chuck
