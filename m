From: Vadiraj <vadiraj.cs@gmail.com>
Subject: Re: pthread stack limit.
Date: Mon, 29 Nov 2004 12:35:38 +0530
Message-ID: <6eee1c40411282305393e7d00@mail.gmail.com>
References: <6eee1c404112423345c1d792f@mail.gmail.com>
	 <20041125104836.GE2067@lug-owl.de>
Reply-To: Vadiraj <vadiraj.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041125104836.GE2067@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On Thu, 25 Nov 2004 11:48:36 +0100, Jan-Benedict Glaw <jbglaw@lug-owl.de> wrote:
> On Thu, 2004-11-25 13:04:01 +0530, Vadiraj <vadiraj.cs@gmail.com>
> wrote in message <6eee1c404112423345c1d792f@mail.gmail.com>:
> 
> >   Does any one has idea on how this thread stack limit is decided
> > upon. I see different max stack limit for different pthread
> > implementation. Is there a standard that is followed in deciding on
> > thread stack size and number of threads?
> 
> I guess pthread_attr_getstacksize() and pthread_attr_setstacksize()
> can be used for getting/setting the size...

 Thats true. What I want to know is how is the max limit decided upon.
Does page size come into picture for this.. pthread_attr_setstacksize
throws error for certain size in differnect systems. For linux its 2
mb where as some other system do support more than 8mb. How is this
handled?



-- 
cheers,
Vadi
