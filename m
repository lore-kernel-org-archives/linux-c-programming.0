From: Steve Graegert <graegerts@gmail.com>
Subject: Re: variable length function
Date: Tue, 14 Jun 2005 21:14:14 +0200
Message-ID: <6a00c8d505061412142f93e234@mail.gmail.com>
References: <20050614174356.58804.qmail@web52910.mail.yahoo.com>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050614174356.58804.qmail@web52910.mail.yahoo.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

On 6/14/05, Ankit Jain <ankitjain1580@yahoo.com> wrote:
> hi
> 
> if somebody can tell me what is exactly variable
> length functions and how the compilers are able to
> identify them.............?
> 
> also, if somebody can tell me how can i perform the
> operation of printf from scanf?
> 
> also, if what is the default return type and value of
> main function in C in gcc, ansi C and turbo C?


Question 1:
I suppose you mean functions with variable argument lists, which are
usually indicated by three dots (...) in their synopsis like the
following:

	void func(const char *fmt, ...)

A typical example is the family of printf() functions.  Variable
length means that the number of arguments the function can take is not
fixed.  As with printf(), you can pass a myriad of arguments to a
function with a variable argument list (as long as the function is
able to process them).

A typical application of this kind of functions is to dump error
messages.  At first you create wrapper that takes the variable
argument list, processes it and call a function that does all the
work:

	void log(const char *fmt, ...) {
		va_list args;
		
		va_start(args, fmt);      /* initialize */
		__process_msg(fmt, args); /* process this message */
		va_end(args);             /* clean up */
	}
	
	void __process_msg(const char *fmt, va_list args) {
		int error = errno;
		
		vfprintf(stderr, fmt, args); /* here: output to stderr */
		if (error != 0) {
			fprintf(stderr, ": %s", strerror(error));
			putc('\n', stderr);
		}
	}

As you can see, a couple of functions/macros and data types help to
process the variable argument list.  Consult man va_start or something
similar to read more on that topic.  Processing a variable argument
list is easy, but the implementation is highly complicated.


Question 2:
There is nothing magic with variable argument lists and compilers. 
Some sophisticated library functions do all the processing.  The
compiler is not involved in this process.


Question 3:
Please refer to message
<20050605122105.1865.qmail@web52905.mail.yahoo.com> where your
question has already been discussed (or answered at least).


Question 4:
ISO C99 suggests the return type of main() to be of type int.  There
is a never ending debate among some professionals whether void is
equally legal.  Some compilers behave like ANSI C that allows
declaration of type void but return int implicitly.  In other words:
stick to int.


Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> || <http://www.technologies.de/~sg/>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
