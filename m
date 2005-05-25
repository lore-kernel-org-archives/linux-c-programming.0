From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: kerel level threads
Date: Wed, 25 May 2005 12:46:50 +0100
Message-ID: <17044.26026.165790.767334@gargle.gargle.HOWL>
References: <20050524034750.70100.qmail@web51307.mail.yahoo.com>
	<42942467.9060805@cse.iitk.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42942467.9060805@cse.iitk.ac.in>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "K. Anantha Kiran" <ananth@cse.iitk.ac.in>
Cc: linux-c-programming@vger.kernel.org


K. Anantha Kiran wrote:

>     Point me to appropiate group if this question doesnt fit here.
>     Does pthread_create() create kernel level threads?
>     I have created two threads A and B. Thread A was written to print 
> some statement in an infinite loop, while Thread B was written to be 
> blocked for some time(I have used sleep system call to block Thread B). 
> If at all pthread_create() creates user level threads, Blocking of 
> Thread B will also make Thread A to be blocked.  But  in my output, 
> Thread A was continously printing even when Thread B was blocked.  My 
> observation is that either both of the threads be Kernel level threads 
> or pthread library has given wrapper functions for blocking calls(for 
> example, sleep system call in our case) which stop all of the threads to 
> be blocked.  I read in text books that pthread libray is for creating 
> user level threads(threads about which kernel is not aware of).

libpthread creates kernel threads.

-- 
Glynn Clements <glynn@gclements.plus.com>
