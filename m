From: "Nate Jenkins" <nate@uniwest.com>
Subject: Re: "double free or corruption" - how to solve this?
Date: Fri, 12 May 2006 14:46:21 -0700
Message-ID: <003d01c6760d$81f976e0$8001a8c0@NATE>
References: <75062f40605120111s2d27c8c0gb768c50b1ae34588@mail.gmail.com> <20060512101927.136dd5df@localhost.localdomain> <6a00c8d50605120145r3319e9c6hdb15c3630aeffadd@mail.gmail.com> <002801c67607$fdc5dfd0$8001a8c0@NATE> <6a00c8d50605121435l6e3c481ci50d74b93240a4750@mail.gmail.com>
Reply-To: "Nate Jenkins" <nate@uniwest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: linux-c-programming@vger.kernel.org



>> >> Hello Shriramana,
>> >>
>> >>
>> >> On Fri, 12 May 2006 13:41:12 +0530 "Shriramana Sharma"
>> >> <samjnaa@gmail.com> wrote:
>> >>
>> >> > One of my programs, which was working quite well till now, suddenly
>> >> > gives me the error:
>> >> >
>> >> > *** glibc detected *** double free or corruption (top): 0x0808a338 
>> >> > ***
>> >> > Aborted
>> >> >
>> >> > It is a pure C program compiled with GCC 4.02 -- I do not understand
>> >> > why it does not work suddenly. Please tell me what the above error 
>> >> > can
>> >> > be.
>> >>
>> >> Would be nice to run it from gdb, in order to get the backtrace when 
>> >> it
>> >> crashes. This should help you understand where and why :).
>> >
>> > Additionally, you can try valgrind, which reports typical programming
>> > errors like calling free() twice on the same object.
>> >
>> > \Steve
>> > -
>>
>> Steve,
>>
>> I just saw that utility the other day.  It looks interesting.  How do you
>> typically use it?  or grindcall-grindval?  Do you know of a good tutorial
>> you could point me/us to?
>
> Nate,
>
> The easiest way to use valgrind is to pass it the "apparently faulty"
> program including all arguments using the --tool switch:
>
> graegerts@kenji:~/vmware/haiku> valgrind --tool=memcheck ls -la
>
> Afterwards a summary is printed:
>
> ==11048== Memcheck, a memory error detector for x86-linux.
> ==11048== Copyright (C) 2002-2004, and GNU GPL'd, by Julian Seward et al.
> ==11048== Using valgrind-2.2.0, a program supervision framework for 
> x86-linux.
> ==11048== Copyright (C) 2000-2004, and GNU GPL'd, by Julian Seward et al.
> ==11048== For more details, rerun with: -v
> ==11048==
>
> [lengthy file listing omitted]
>
> ==11048==
> ==11048== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 23 from 1)
> ==11048== malloc/free: in use at exit: 14901 bytes in 21 blocks.
> ==11048== malloc/free: 446 allocs, 425 frees, 48474 bytes allocated.
> ==11048== For a detailed leak analysis,  rerun with: --leak-check=yes
> ==11048== For counts of detected errors, rerun with: -v
> graegerts@kenji:~/vmware/haiku>
>
> By entering "valgrind" in the console a list of available tools is
> listed, all of them obeying the --help switch:
>
> % valgrind
> valgrind: Missing --tool option
> Available tools:
>        helgrind
>        addrcheck
>        cachegrind
>        memcheck
>        callgrind
>        corecheck
>        lackey
>        none
>        massif
> % valgrind --tool=memcheck --help
>
> The valgrind homepage (http://valgrind.org) is a good starting point
> for documentation and description of related concepts.  Hope that was
> helpful.
>
> Bye
>
> \Steve
> -

Very helpful.  And speedy.  :)

Thanks.  That is what I assumed it might be like.  I will have to do some 
learning about that tool and others like it.  I am looking down the road, 
knowing that I have a memory leak to track down soon in a project I have 
been asked to fix.

Thanks again,

Nate



