From: Andre Haupt <andre@bitwigglers.org>
Subject: Re: shell getting scrambled while printing out ascii 14
Date: Tue, 16 Oct 2007 15:12:21 +0200
Message-ID: <20071016131221.GA20751@ahaupt-debian-vm.localdomain>
References: <1192534028.2728.4.camel@root>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1192534028.2728.4.camel@root>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vibi <vibi_sreenivasan@cms.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, Oct 16, 2007 at 04:57:08PM +0530, vibi wrote:
> hi,
> 	can any one tell me the reason why the command prompt in the terminal
> window get scrambled when a character with ascii value 14 is printed
> out.
Have a look at the Shift Out and Shift In control characters.

regards,

Andre
