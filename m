From: Steve Graegert <graegerts@gmail.com>
Subject: Re: pthread_mutex_destroy call in nptl-2.3.4 thread libraries
Date: Mon, 6 Feb 2006 18:03:57 +0100
Message-ID: <6a00c8d50602060903i6aee9348i39e359aaa59f4617@mail.gmail.com>
References: <8d1265000602060818n6a1c499che2828236645252f4@mail.gmail.com>
	 <8d1265000602060820t247b6f18kf79f72e3bb131cb8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <8d1265000602060820t247b6f18kf79f72e3bb131cb8@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 2/6/06, Senthil Nathan V <pingtosen@gmail.com> wrote:
> Hi All,
>    I am learning multi-threaded programming in Linux. Locking a
> deleted mutex is possible in nptl threads.

Don't know what you mean here.  Locking a destroyed (thus,
uninitialized mutex) returns EINVAL.

>  Now my query is :
>  * Is there any possible way to check for destroyed mutex ?

Are you looking for a function that lists destroyed mutexes?  If so,
there is none.  If not, calling pthread_mutex_destroy() will fail if
the mutex is invalid (probably destroyed).  pthread_mutex_lock()
returns EINVAL if called for a destroyed (and unitialized) mutex. 
Additionally, pthread_mutex_init __may__ return EBUSY if you try to
reinitialize a mutex which has been previously intialized, but not yet
destroyed.  You may want to combine these calls to detect a destroyed
mutex, although I do __not__ recommend it.

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
