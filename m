From: simon <simon.guinot@laposte.net>
Subject: Re: Size of the terminal with curses
Date: Fri, 22 Oct 2004 01:06:26 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <417840F2.1060103@laposte.net>
References: <cl6gpb$gap$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <cl6gpb$gap$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tyler <tyler@agat.net>
Cc: linux-C-programming <linux-c-programming@vger.kernel.org>

hello

Tyler wrote:
> Hey,
> 
> How can I get the size of the terminal (in lines and cols) of the actual 
> terminal ? It would be cool if the solution uses some curses function.
nothing to do with ncurses... juste use LINES and COLS macro...

simon
