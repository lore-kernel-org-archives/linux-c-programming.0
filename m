From: Progga <abulfazl@juniv.edu>
Subject: Re: Size of the terminal with curses
Date: Thu, 21 Oct 2004 18:30:28 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041021183028.A502@Imrashi.net.bd>
References: <cl6gpb$gap$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cl6gpb$gap$1@sea.gmane.org>; from tyler@agat.net on Wed, Oct 20, 2004 at 10:11:23PM +0200
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tyler <tyler@agat.net>
Cc: linux-c-programming@vger.kernel.org

On Wed, Oct 20, 2004 at 10:11:23PM +0200, Tyler wrote:
> 
> How can I get the size of the terminal (in lines and cols) of the actual 
> terminal ? It would be cool if the solution uses some curses function.

 Get the values of the 'LINES' and 'COLUMNS' env variables using getenv().


