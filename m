From: Benjamin Sobotta <mayday@gmx.net>
Subject: Re: Virtual functions and destructors
Date: Thu, 23 Mar 2006 23:00:33 +0100
Message-ID: <200603232300.33759.mayday@gmx.net>
References: <200603192050.22014.samjnaa@gmail.com> <200603222327.41672.mayday@gmx.net> <200603230732.21532.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603230732.21532.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On Thursday 23 March 2006 03:02, Shriramana Sharma wrote:
> Thursday, 23 March 2006 03:57 samaye tvayaa likhitam:
> > I'm not sure if this is right. Functions can always be overloaded.
>
> He did not speak of functions being overloaded. He spoke of functions being
> over-*ridden*.

Sorry I must have read wrong. Nevertheless even if you prefer to say override 
you can still override a function without using virtual. Just adjust the type 
of the pointer to the class of which you want to execute the member function.

Ben

>
> > Further I believe that once a function is declared virtual it always
> > stays that way. Even if in subsequently derived classes it is not
> > explicitly declared virtual any longer.
>
> Verified this using a grandchild class.
