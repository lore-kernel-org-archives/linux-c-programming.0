From: Shanks <mshanks79@yahoo.co.in>
Subject: Re: strange gcc warning
Date: Mon, 13 Jan 2003 22:00:31 -0800 (PST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030114060031.7262.qmail@web8005.mail.in.yahoo.com>
References: <20030113182613.GA11191@cam.ac.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030113182613.GA11191@cam.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Smith <sos22@cam.ac.uk>
Cc: linux-c-programming@vger.kernel.org

Thanks Steven for the clean and detailed explanation.
It all makes sense now... 

-Shanks.

--- Steven Smith <sos22@cam.ac.uk> wrote:
> > void
> > my_print(int errno)
> Defining a parameter to shadow a global variable is always a bad idea,
> but it's an especially bad idea for errno. In multi-threaded programs,
> and programs compiled with a certain set of flags, errno is actually a
> preprocessor macro.  Usually, when using glibc, errno expands to
> (*__errno_location()), and so your prototype expands to void
> my_print(int (*__errno_location())).  gcc interprets this as a pointer
> to a function returning an int pointer, which was probably not what
> you expected.
> 
> > {
> >     printf("ERRNO: %d\n", errno);
> Now, this expands to ``printf("ERRNO: %d\n", (*__errno_location()));".
> __errno_location is a function pointer returning an int *, and so
> this calls the first argument, and then dereferences the returned
> value.
> 
> > }
> > 
> > int
> > main()
> > {
> >     int a = 10;
> >     errno = 0;
> >     my_print(a);
> a is now implicitly converted to a pointer to function returning int
> *.  When the code is run, my_print tries to call a function at address
> 10 in memory, and crashes.
> 
> > }
> 
> Steven Smith,
> sos22@cam.ac.uk.

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
