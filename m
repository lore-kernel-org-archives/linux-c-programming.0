From: Chuck Winters <cwinters@atl.lmco.com>
Subject: Re: threaded program turns into "forked"
Date: Thu, 13 Mar 2003 11:45:30 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030313164530.GA15695@atl.lmco.com>
References: <75B979779CA1D311808400508B6F40FF073E2003@zes06exm01.madrid.ecid.cig.mot.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <75B979779CA1D311808400508B6F40FF073E2003@zes06exm01.madrid.ecid.cig.mot.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Thu, Mar 13, 2003 at 05:14:45PM +0100, Alvarez Alberto-AALVARB1 wrote:
> Hi all,
> 	a work mate has a program which creates up to 5 threads:
> 
> 	( this is done at the "main" module)
> 		 for (i=0;i<numeroSM;i++)
> 		  {
> 		     rc=thr_create(NULL,NULL,RecogerCDRs,(void *)i,NULL,&hilo);
> 		  }
> 
> 		but, "sometimes" (horrible expression) a child turns up: new process (new pid), whose parent id and command is the former process.
> 		 AFAIK, thread creation can't "fork" a program.
> 
> 		The only data i know is that the second process starts 1 second after the first, which could easily occur while thread creation. 
> 		Just in case it's important, we're working with a socket per thread.
> 
> 		Does anyone know whether thread creation could be the reason?
> 
> 		TIA
> 
> Alberto ?lvarez Besada
> 
> Tlf.:        +34 914002155
> e-mail.:   aalvarb1@motorola.com
>             
> 

If you are stating that a new child process turns up when a thread is created,
then what you are explaining is the correct behavior.  I believe(someone correct
me if I am wrong), that the pthreads package uses the clone(2) system call which
basically creates a new process with some shared resources.  So, each new thread
will have a different process id with the parent being the process which spawned
the thread.

Chuck
