From: "Theewara Vorakosit" <thvo@ksc.th.com>
Subject: Pthread consume 100% CPU
Date: Mon, 19 Aug 2002 21:20:38 +0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001101c2478b$97519e50$1e226c9e@eternity>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Dear All,
    I developer multithread programming on linux using pthread. I use C++
language. I implement my thread as a class. Here is my class:

static void *thread_func(void *rv)
{
 ((Thread *) rv)->run();
 return NULL;
}

int Thread::start(void)
{
 int retval;

 sigfillset(&newset);
 pthread_sigmask(SIG_BLOCK, &newset, &oldset);
 pthread_attr_init(&attr);
 retval = pthread_create(&(this->pt), NULL, thread_func, this);
 pthread_sigmask(SIG_UNBLOCK, &newset, &oldset);
 return retval;
}

int Thread::join(void)
{
 int retval;
 pdebugl();
 retval = pthread_join(this->pt, NULL);
 pdebugl();
 return retval;
}

To create thread, inherited this class, new it and call start method. After
call pthread_create, there are 3 processes of my program, right? I call
method join, and exit from my main. My program exits normally. However,
there is thread process still running at 100% reported by top. I also get
command prompt from my shell. Would you please tell what cause this problem?
Thanks,
Theewara

