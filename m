From: XComp <xcomp@arcor.de>
Subject: Re: Problem with ucontext_t struct in signal handler
Date: Thu, 18 Dec 2008 23:29:26 -0800
Message-ID: <40DE47A0-6538-4713-A44E-02984FAF5DC0@arcor.de>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

On 18.12.2008, at 18:51, Glynn Clements wrote:

>
> XComp wrote:
>
>> I want to switch between user contexts using a signal handler
>> (something like a preemptive scheduler for userlevel threads). I've
>> found several sources, which say that it's not a good idea to use
>> setcontext or swapcontext in a signal handler. Nevertheless there  
>> also
>> exists at least one sample code of such an preemptive scheduler,  
>> which
>> seems to work well, at least on my machine (Ubuntu 8.04 with linux
>> kernel 2.6.24-22): www.seas.upenn.edu/~cse381/context_demo.c
>>
>> // [...]
>> static ucontext_t thread_context;
>> static ucontext_t scheduler_context;
>>
>> int thread_finished;
>> int i;
>>
>> static void simple_function(void) {
>> 	// do nothing but counting
>> 	for (i = 0; i < 1000000000; ++i) { }
>>
>> 	if (i == 1000000000) {
>> 		printf("\n[Thread Function]\t1st counting worked fine...");
>> 	} else {
>> 		printf("\n[Thread Function]\tError: Counting didn't finished   
>> (%d)...", i);
>> 	}
>>
>> 	thread_finished = 1;
>> }
>>
>> static void other_function() {
>> 	// thread_finished is a global variable, which is set to 1, if  
>> the  thread function is finished
>> 	while(thread_finished != 1) { swapcontext(&scheduler_context,   
>> &thread_context); }
>> }
>>
>> static void signal_handler_function(int sig_nr, siginfo_t* info,  
>> void  *old_context) {
>> 	if (sig_nr == SIGPROF) {
>> 		// saves the thread context
>> 		thread_context = *((ucontext_t*) context);
>>
>> 		// swaps back to scheduler context
>> 		setcontext(&scheduler_context);
>> 	}
>> }
>> // [...]
>>
>> I ran into the following problem which belongs to the code above. I
>> interrupted simple_function several times by using a ITimer. But the
>> for-loop doesn't finish successfully everytime. Often the if  
>> condition
>> is false.
>
> It seems likely that either the registers or the stack (wherever "i"
> is stored) is getting trashed. What is "i" in the cases where the test
> fails?

You find a sample output below. It seems to work in some cases. So you  
might be right with the stack. But why? I mean... there is nothing  
else but the for-loop. Or do I have the wrong idea of how the stack  
works?! Can a stack be overflown by a simple for-loop? Is an alternate  
signal stack needed? I thought it doesn't because the current stack  
should be big enough.

>
>
>> But it does not cancel after the first signal is raised.
>> I've found out that using the third parameter old_context for storing
>> the old context is the reason. But I don't know why.
>
> Note that the old_context parameter to the signal handler won't be
> pointing to any of your context "slots". When a signal occurs, the
> current context will be saved in a ucontext_t on the current context's
> stack, and the old_context argument will point to that.

I'm not sure whether I understood this correctly. What do you mean  
with slots?

>
>
> It needs to be borne in mind that a ucontext_t isn't "the context"
> itself. It's merely a structure for storing information about a
> context, either for receiving information (e.g. getcontext) or
> providing it (e.g. setcontext).
>
>> So I thought there might be a problem in the kernel. Am I right?
>
> I don't think so.

Because of the fact that ucontext_t is part of the C library? I  
thought that it might be a kernel issue because of the signal handling  
which is implemented in the kernel.
>
>
>> I was afraid to post the whole code, so I hope that this code
>> snippet is enough.
>
> It would help if it was accurate (e.g. the signal handler refers to
> "context" which isn't declared anywhere; is this supposed to be the
> old_context parameter?) and more complete.

I posted the complete code below. Sorry for the little mistake.

>
>
>> I would appreciate if someone can give me a comment whether this
>> strange behaviour is because of a wrong thinking of mine or because  
>> of
>> a error in the kernel which needs to be fixed.
>
> I suspect the former.
>
> -- 
> Glynn Clements <glynn@gclements.plus.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c- 
> programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Sorry, the context variable in the signal handler should be called  
old_context. Here you have the complete code sample:

#include <stdlib.h>
#include <unistd.h>

// signal handling
#include <signal.h>
// context switch
#include <ucontext.h>
// timer
#include <sys/time.h>

// upper bound of the for loops inside thread_function
#define UPPER_BOUND 100000000
// number of seconds for setting the interval used by the timer
#define QUANTUM_SEC 0
// number of microseconds for setting the interval used by the timer  
(0 - 99999)
#define QUANTUM_MICRO_SEC 100000

#define STACKSIZE 4096

static ucontext_t thread_context;
static ucontext_t scheduler_context;

int thread_finished;
int i;

static void thread_function(void) {
        printf("\n[Thread Function]\tFunction starts...");

        for (i = 0; i < UPPER_BOUND; ++i) {
                // do nothing but counting
        }

        if (i == UPPER_BOUND) {
                printf("\n[Thread Function]\t1st counting worked  
fine...");
        } else {
                printf("\n[Thread Function]\tError: 1st counting  
didn't finished (%d)...", i);
        }

        thread_finished = 1;

        printf("\n[Thread Function]\tFunction finishes...");
}

static void scheduler_function() {

        printf("\n[Scheduler Function]\tScheduler starts...");

        // thread_finished is a global variable, which is set to 1, if  
the thread function is finished
        while (thread_finished != 1) {
                swapcontext(&scheduler_context, &thread_context);
        }

        printf("\n[Scheduler Function]\tScheduler finishes...");
}

static void signal_handler_function(int sig_nr, siginfo_t* info, void  
*old_context) {

        if (sig_nr == SIGPROF) {
                printf("\n[Signal Handler]\tSIGPROF was raised at  
%d...", i);

                // saves the thread context
                thread_context = *((ucontext_t*) old_context);

                // swaps back to scheduler context
                setcontext(&scheduler_context);
        } else {
                printf("\n[Signal Handler]\tA different signal was  
raised...");
                return;
        }

}

int main(int argc, char **argv) {

        printf("\n[Main Function]\t\tProgram starts...");

        thread_finished = 0;

        char thread_stack[STACKSIZE];
        char scheduler_stack[STACKSIZE];

        // initializing scheduler context
        if (getcontext(&scheduler_context) == 0) {
                scheduler_context.uc_stack.ss_sp = scheduler_stack;
                scheduler_context.uc_stack.ss_size =  
sizeof(scheduler_stack);
                scheduler_context.uc_stack.ss_flags = 0;
                scheduler_context.uc_link = NULL;
                printf("\n[Main Function]\t\tscheduler_context was  
initialized...");
        } else {
                printf("\n[Main Function]\t\tError while initializing  
scheduler_context...");
                exit(-1);
        }

        // initializing thread context
        if (getcontext(&thread_context) == 0) {
                thread_context.uc_stack.ss_sp = thread_stack;
                thread_context.uc_stack.ss_size = sizeof(thread_stack);
                thread_context.uc_stack.ss_flags = 0;
                thread_context.uc_link = &scheduler_context;
                printf("\n[Main Function]\t\tthread_context was  
initialized...");
        } else {
                printf("\n[Main Function]\t\tError while initializing  
thread_context...");
                exit(-1);
        }

        // sets the signal handler for swapping to the scheduler context
        struct sigaction scheduling_interuption_handler;
        scheduling_interuption_handler.sa_sigaction =  
signal_handler_function;
        scheduling_interuption_handler.sa_flags = SA_RESTART |  
SA_SIGINFO;
        sigemptyset(&scheduling_interuption_handler.sa_mask);
        if (sigaction(SIGPROF, &scheduling_interuption_handler, NULL)  
== -1) {
                printf("\n[Main Function]\t\tAn error occurred while  
initializing the signal handler for swapping to the scheduler  
context...");
                exit(-1);
        }

        // sets the timer which sends SIGPROF periodically
        struct itimerval timeslice;
        timeslice.it_value.tv_sec = QUANTUM_SEC;
        timeslice.it_value.tv_usec = QUANTUM_MICRO_SEC;
        timeslice.it_interval = timeslice.it_value;

        if (setitimer(ITIMER_PROF, &timeslice, NULL) == 0) {
                printf("\n[Main Function]\t\tThe timer was  
initialized...");
        } else {
                printf("\n[Main Function]\t\tAn error occurred while  
executing setitimer...");
                exit(-1);
        }

        // sets the thread function
        makecontext(&thread_context, thread_function, 0);

        // this function handles the swapping part
        scheduler_function();

        printf("\n[Main Function]\t\tProgram finishes...");
}

----

The possible output for these settings is:

[Main Function]                Program starts...
[Main Function]                scheduler_context was initialized...
[Main Function]                thread_context was initialized...
[Main Function]                The timer was initialized...
[Scheduler Function]        Scheduler starts...
[Thread Function]        Function starts...
[Signal Handler]        SIGPROF was raised at 30811962...
[Signal Handler]        SIGPROF was raised at 62309593...
[Signal Handler]        SIGPROF was raised at 93262549...
[Thread Function]        1st counting worked fine...
[Signal Handler]        SIGPROF was raised at 24910729...
[Signal Handler]        SIGPROF was raised at 55303135...
[Signal Handler]        SIGPROF was raised at 86507356...
[Thread Function]        Error: 2nd counting didn't finished  
(86507356)...
[Thread Function]        Function finishes...
[Scheduler Function]        Scheduler finishes...
[Main Function]                Program finishes...

So you see that the for-loops quits right after a signal was caught. I  
am really in a dead end now. Do you see any parts of my code, which  
might be wrong?

