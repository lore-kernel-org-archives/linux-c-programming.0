From: Hemant Mohan <hemantm@pune.tcs.co.in>
Subject: Re: Memory Leak issue
Date: Mon, 18 Nov 2002 11:27:21 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OF805226EB.26EFA4FA-ON65256C75.0020557C@pune.tcs.co.in>
References: <OF7DE96D1E.50C4E532-ON65256C73.002605A2@pune.tcs.co.in> <15830.55936.935730.39210@cerise.nosuchdomain.co.uk>
Reply-To: hemantm@pune.tcs.co.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15830.55936.935730.39210@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

As I am working in a multi threaded environment, I think the garbage 
collector approach may be the best one.  
Can I use a time based approach for the garbage collector, I free the memory 
if that memory is not used for a certain period of time.
Also can you suggest some URLS which can help me in designing the garbage 
collector.

Thanks,
Hemant



On Sunday 17 November 2002 05:23, Glynn Clements wrote:
> Hemant Mohan wrote:
> > Is it possible to have a C function return a char*, and have void
>
> arguememnts
>
> > without the caller having to free the memory??
> > I mean something like this:
> >
> > char* foo(void)
> > {
> >    char *ret;
> >    .....
> >    .....
> >
> >    return(ret);
> > }
> >
> > int main()
> > {
> >    ....
> >    char * temp;
> >    temp = foo();
> >    /* here I don't want to do a free(temp) */
> >    .....
> >
> > }
> >
> > To my understanding in this case the function foo will have to internally
>
> to
>
> > do a malloc for ret before doing any processing on it. And it will not be
> > able free this memory.  This implies that the calling function will have
>
> to
>
> > free the return pointer of foo somewhere to prevent any memory leakeage.
>
> Is
>
> > there any alternative solution to return a char* ?
>
> If you can be sure that you only need to use last result from foo(),
> you can return a pointer to statically allocated memory, e.g.
>
>      char *foo(void)
>      {
>           static char buff[...];
>           ...
>           return buff;
>      }
>
> Or you can dynamically allocate the memory but store it in a static
> pointer, e.g.
>
>      char *foo(void)
>      {
>           static char *ptr;
>           if (ptr)
>                free(ptr);
>           ptr = malloc(...);
>           ...
>           return ptr;
>      }
>
> These won't leak memory, but you have to ensure that you have finished
> using the result from the previous call to foo() before calling it
> again. That rules out using this approach in multi-threaded programs.
>
> A few library functions work this way, e.g. gethostbyname(),
> gethostent(), getmntent(), getpwent() etc. However, it requires the
> caller to either use the return value before control is passed to
> anything which might need to call the function again, or to copy the
> data.
>
> If you need the data to remain valid indefinitely, then the simplest
> approach is to have foo() allocate the data with malloc() and make the
> caller responsible for free()ing it when it's no longer needed.
>
> However, if you need to do this a lot, and keeping track of the memory
> is likely to be a lot of work, then it may be worth considering a
> garbage-collecting allocator. This is the mechanism which is used by
> most high-level languages. Here, data is dynamically allocated, and is
> freed automatically when it's no longer used.
>
> The tricky part is in determining when data is no longer used. The
> need for the garbage collector to make this decision normally imposes
> certain rules upon the overall program. Consequently, garbage
> collection is normally only used where the effort involved in
> "manually" tracking dynamically-allocated memory would be so high that
> a garbage-collecting allocator is the only feasible solution.


