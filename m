From: Steve Graegert <graegerts@gmail.com>
Subject: Re: typecasting - explain
Date: Fri, 9 Sep 2005 11:46:35 +0200
Message-ID: <6a00c8d505090902462df47aa4@mail.gmail.com>
References: <dfrckc$ts5$1@sea.gmane.org>
Reply-To: graegerts@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfrckc$ts5$1@sea.gmane.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 9/9/05, _z33 <timid.Gentoo@gmail.com> wrote:
>   I'm not able to understand what exactly happens when I typecast a
> data type from one to other. What I had in mind was, that by typecasting
> you are making it clear to the compiler how to handle the data. For
> example, when you get a "void *" from malloc, the reason you typecast it
> to the required data type, is to make sure later the compiler doesn't
> complain or throw an error, when doing some pointer arithmetic on it. Am
> I wrong completely?

Casting in C means to change the interpretation of the bit pattern
found at the memory location denoted by variable x, which can also be
a pointer variable of course.  Therefore it is possible to cast a
pointer to a struct to another struct pointer of a different type and
access its fields.  Returned is what is found at the fields offset of
the structure:

	(struct s1 *)s2)->myint = 1;

When casting the pointer returned from malloc to the desired type, you
specify what this particular space in memory is used for.  If you make
some room for strings

	char *s = (char *)malloc(128 * sizeof(char));

you indicate that the bytes found at memory location s are interpreted
as characters and not as ints.  But it's fairly leagal to write

	int *i = (int *)malloc(128 * sizeof(int));

then assigning i a string is OK as shown in this short example:

	char *s;
	int  *i;

	s = (int *)malloc(128 * sizeof(char));
	i = (char *)malloc(128 * sizeof(int));

	s = "malloc is cool!";
	printf("s: %s\n", s);
	printf("s: %d\n", s);

	i = "malloc is cool!";
	printf("i: %s\n", i);
	printf("i: %d\n", i);

This piece of code prints:

	s: malloc is cool!
	s: 4350328
	i: malloc is cool!
	i: 4350328

You see, casting changes the interpretation of bits when they are
read.  The assigment of a particular type to a variable of another
type destroys the original type information (i.e. loss of precision).

>   If my conception is correct, then I'm having a serious problem in
> understanding typecasting of function pointers. First of all, I thought
> it is meaningless and the compiler won't allow it. However, to my shock
> I came across a posting today morning on a different newsgroup, claiming
> that it is in fact supported by the ANSI standard. Is it? If so, what
> does such a typecasting mean?

Yes function pointers are legal.  ANSI C99 says:

"J.5.7 Function pointer casts
1 A pointer to an object or to void may be cast to a pointer to a
function, allowing data to be invoked as a function (6.5.4).
2 A pointer to a function may be cast to a pointer to an object or to
void, allowing a
function to be inspected or modified (for example, by a debugger) (6.5.4)."

A function name is just a pointer to the memory location where the
function is found at runtime.  It can be queried, modified and cast to
other types.  It behaves like a variable.  Take a look at the
sigaction structure:

	struct sigaction {
		/* SIG_DFL, SIG_IGN or pointer to function */
		void (*sa_handler)(int); 
		... /* some other fields */
	};

You can define sigaction as follows:

	void handler(int signo) {
		doneflag = 1;
	}

	struct sigaction sa;
	sa.sa_handler = handler;
	...

Here, sa_handler is registered as a function to be called when the
specified signal occurrs.

Just handle function pointers as simple pointer variables.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
