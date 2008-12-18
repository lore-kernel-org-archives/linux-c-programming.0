From: XComp <xcomp@arcor.de>
Subject: Problem with ucontext_t struct in signal handler
Date: Thu, 18 Dec 2008 10:11:59 -0800
Message-ID: <0C323BC7-E8EF-4CFB-99AE-9A7A890A6191@arcor.de>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming@vger.kernel.org

Hello everyone,
I want to switch between user contexts using a signal handler  
(something like a preemptive scheduler for userlevel threads). I've  
found several sources, which say that it's not a good idea to use  
setcontext or swapcontext in a signal handler. Nevertheless there also  
exists at least one sample code of such an preemptive scheduler, which  
seems to work well, at least on my machine (Ubuntu 8.04 with linux  
kernel 2.6.24-22): www.seas.upenn.edu/~cse381/context_demo.c

// [...]
static ucontext_t thread_context;
static ucontext_t scheduler_context;

int thread_finished;
int i;

static void simple_function(void) {
	// do nothing but counting
	for (i = 0; i < 1000000000; ++i) { }

	if (i == 1000000000) {
		printf("\n[Thread Function]\t1st counting worked fine...");
	} else {
		printf("\n[Thread Function]\tError: Counting didn't finished  
(%d)...", i);
	}

	thread_finished = 1;
}

static void other_function() {
	// thread_finished is a global variable, which is set to 1, if the  
thread function is finished
	while(thread_finished != 1) { swapcontext(&scheduler_context,  
&thread_context); }
}

static void signal_handler_function(int sig_nr, siginfo_t* info, void  
*old_context) {
	if (sig_nr == SIGPROF) {
		// saves the thread context
		thread_context = *((ucontext_t*) context);

		// swaps back to scheduler context
		setcontext(&scheduler_context);
	}
}
// [...]

I ran into the following problem which belongs to the code above. I  
interrupted simple_function several times by using a ITimer. But the  
for-loop doesn't finish successfully everytime. Often the if condition  
is false. But it does not cancel after the first signal is raised.  
I've found out that using the third parameter old_context for storing  
the old context is the reason. But I don't know why. So I thought  
there might be a problem in the kernel. Am I right? I was afraid to  
post the whole code, so I hope that this code snippet is enough.
I would appreciate if someone can give me a comment whether this  
strange behaviour is because of a wrong thinking of mine or because of  
a error in the kernel which needs to be fixed.

Thanks a lot!
Matthias
