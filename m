From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Multithreading with C++ - solved
Date: Fri, 8 Apr 2005 10:04:36 -0400
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA367B@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

All,

Thanks for all of the suggestions.  Actually, Eric hit the nail on the head - I was forgetting to 
link to libpthread.  Knew I had to, remember thinking that I need to change my makefile and 
add libpthread to the list of libraries that I was linking to.  Would have bet money that I did 
this.  Oh well....

Now this bring up an interesting question - how can a program using pthread compile cleanly
when it is not linked to libpthread?  I would expect unresolved externals on all pthread functions?

George


-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of Huber, George K RDECOM CERDEC STCD SRI
Sent: Thursday, April 07, 2005 1:02 PM
To: linux-c-programming@vger.kernel.org
Subject: Multithreading with C++


All,

This may be a little off topic, but I though I would try here first.

I am writting a multi-threaded program and would like to have each 
thread `managed' by a class.  I have attempted to do this like this,
using the pthreads library:

<code>
====================begin cthread.h

class CThread
{
public:
    CThread(void*);
    ~CThread();

    ....

private:
    static CThread*     m_pThis;
    pthread_t             m_tid;
    static void*           threadfun(void*);

   ....
}

==================== begin cthread.cpp

CThread*  CThread::m_pThis = NULL;

CThread::CThread(void* arg)
{
    int      ret;

    m_pThis = this;
    if(0 != (ret = pthread_create(&m_tid, NULL, threadfun, arg)))
    {
         fprintf(stderr, "Thread creation failed");
   }
}   

void*  threadfun(void* arg)
{
     printf("Starting thread\n");
     ....
}

</code>

The code compiles without warnings or errors, except when I try and 
run the application I get a segmentation fault at the pthread_create.  
Trying to run under GDB, I am able to examine the value of the 
variables and they seem consisten with what I would expect

// stop on the pthread_create line in the constructor...

(gdb) print m_pThis
$1 = (CThread*) 0xfee756b0
(gdb) print this
$2 = (CThread*0xfee756b0
(gdb) print m_tid
$3 = 134514818               // to be expected because I have not initialized m_tid yet
(gdb) print &m_tid
$4 = (pthread_t*)0xfee756d8
(gdb) print threadfun
$5=&CThread::threadfun(void*)

// attempt the pthread_create line ....

Program received signal SIGSEGV, Segmenatation fault
0x0000000 in ?? ()
(gdb) where 
#0 0x00000000 in ?? ( )
#1 0x0804a6bb in CThread (this=0xfee756b0, args=0x0) at ....
#2 0x08049aad in daemon_main(argc=3, argv=0xfeec42d4) at ....
#3 0x08049193 in main(argc=3, argv=0xfeec42d3) at main.cpp: 83

Any idea on what is going on, or how to fix?

Thanks, 
George Huber

-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
