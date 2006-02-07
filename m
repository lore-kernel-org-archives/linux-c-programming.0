From: Senthil Nathan V <pingtosen@gmail.com>
Subject: Re: pthread_mutex_destroy call in nptl-2.3.4 thread libraries
Date: Tue, 7 Feb 2006 10:20:32 +0530
Message-ID: <8d1265000602062050ob8b939dybf4fa1035d1991e@mail.gmail.com>
References: <8d1265000602060818n6a1c499che2828236645252f4@mail.gmail.com>
	 <8d1265000602060820t247b6f18kf79f72e3bb131cb8@mail.gmail.com>
	 <6a00c8d50602060903i6aee9348i39e359aaa59f4617@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50602060903i6aee9348i39e359aaa59f4617@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org
Cc: Steve Graegert <graegerts@gmail.com>

On 2/6/06, Steve Graegert <graegerts@gmail.com> wrote:
> On 2/6/06, Senthil Nathan V <pingtosen@gmail.com> wrote:
> > Hi All,
> >    I am learning multi-threaded programming in Linux. Locking a
> > deleted mutex is possible in nptl threads.
>
> Don't know what you mean here.  Locking a destroyed (thus,
> uninitialized mutex) returns EINVAL.

 Thanks for reply Steve. I meant locking a initialized and destroyed mutex.

>
> >  Now my query is :
> >  * Is there any possible way to check for destroyed mutex ?
>
> Are you looking for a function that lists destroyed mutexes?  If so,
> there is none.  If not, calling pthread_mutex_destroy() will fail if
> the mutex is invalid (probably destroyed).  pthread_mutex_lock()
> returns EINVAL if called for a destroyed (and unitialized) mutex.

In the sample program mentioned below, pthread_mutex_lock on a
_destroyed_ mutex is successful. Neither the return value nor the
errno variable is set to EINVAL

#include <unistd.h>
#include <stdio.h>
#include <pthread.h>
#include <errno.h>

#define THCNT   5

pthread_mutex_t mut;

void* destroy()
{
        int rv=-1;

        rv=pthread_mutex_destroy(&mut);
        printf("%d: destroy the mutex rv = %d errno = %d\n",
pthread_self(), rv, errno);

        rv=pthread_mutex_lock(&mut);
        printf("%d: Lock on destroyed mutex rv = %d errno = %d\n",
pthread_self(), rv, errno);

        rv=pthread_mutex_unlock(&mut);
        printf("%d: Unlock on destroyed mutex rv = %d errno = %d\n",
pthread_self(), rv, errno);

        pthread_exit(NULL);
}


int main()
{
        int rv=-1,i=0;
        pthread_t th[THCNT];
        pthread_mutexattr_t mattr={0};

        rv=pthread_mutexattr_init(&mattr);
        if(rv==0)
                rv=pthread_mutexattr_settype(&mattr,PTHREAD_MUTEX_ADAPTIVE_NP);
                if(rv!=0)
                {printf("attr setting: %d", rv);return 0;}

        rv=pthread_mutex_init(&mut, &mattr);
        if(rv==0)
                printf("Mutex successfully initialized rv = %d errno =
%d\n", rv, errno);
        else
                printf("Mutex initialization failed rv = %d errno =
%d\n", rv, errno);

        pthread_mutexattr_destroy(&mattr);

        for ( i= 0 ; i< THCNT ;i++)
                pthread_create(&th[i], NULL, destroy, NULL);

        for ( i= 0 ; i< THCNT ;i++)
                pthread_join(th[i],NULL);

        return 0;
}

Output:
----------
Mutex successfully initialized rv = 0 errno = 0
1084229984: destroy the mutex rv = 0 errno = 0
1084229984: Lock on destroyed mutex rv = 0 errno = 0
1084229984: Unlock on destroyed mutex rv = 0 errno = 0
1094719840: destroy the mutex rv = 0 errno = 0
1094719840: Lock on destroyed mutex rv = 0 errno = 0
1094719840: Unlock on destroyed mutex rv = 0 errno = 0
1105209696: destroy the mutex rv = 0 errno = 0
1105209696: Lock on destroyed mutex rv = 0 errno = 0
1105209696: Unlock on destroyed mutex rv = 0 errno = 0
1115699552: destroy the mutex rv = 0 errno = 0
1115699552: Lock on destroyed mutex rv = 0 errno = 0
1115699552: Unlock on destroyed mutex rv = 0 errno = 0
1126189408: destroy the mutex rv = 0 errno = 0
1126189408: Lock on destroyed mutex rv = 0 errno = 0
1126189408: Unlock on destroyed mutex rv = 0 errno = 0

I am using nptl-2.3.4 library. Is pthread_mutex_lock() not returning
EINVAL, when locking on destroyed mutex  or am I doing any mistake in
the program ?

> Additionally, pthread_mutex_init __may__ return EBUSY if you try to
> reinitialize a mutex which has been previously intialized, but not yet
> destroyed.  You may want to combine these calls to detect a destroyed
> mutex, although I do __not__ recommend it.
>
>         \Steve
>
> --
>
> Steve Graegert <graegerts@gmail.com>
> Software Consultant {C/C++ && Java && .NET}
> Office: +49 9131 7123988
> Mobile: +49 1520 9289212
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-regards,
  Senthil Nathan V
