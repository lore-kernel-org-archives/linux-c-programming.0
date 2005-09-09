From: _z33 <timid.Gentoo@gmail.com>
Subject: Re: typecasting - explain
Date: Fri, 09 Sep 2005 15:52:08 +0530
Message-ID: <dfrnos$tnv$1@sea.gmane.org>
References: <dfrckc$ts5$1@sea.gmane.org> <6a00c8d505090902462df47aa4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505090902462df47aa4@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Steve Graegert wrote:
> 
> 	char *s;
> 	int  *i;
> 
> 	s = (int *)malloc(128 * sizeof(char));
> 	i = (char *)malloc(128 * sizeof(int));
> 
> 	s = "malloc is cool!";
> 	printf("s: %s\n", s);
> 	printf("s: %d\n", s);
> 
> 	i = "malloc is cool!";
> 	printf("i: %s\n", i);
> 	printf("i: %d\n", i);
> 
> This piece of code prints:
> 
> 	s: malloc is cool!
> 	s: 4350328
> 	i: malloc is cool!
> 	i: 4350328
> 

   The illustration was too simple and good, for me to understand.
   Thanks :)

> You see, casting changes the interpretation of bits when they are
> read.  The assigment of a particular type to a variable of another
> type destroys the original type information (i.e. loss of precision).
> 

   destroys the original type information? Couldn't understand this part.
   You are still able to recover the string, regardless of what kind of 
datatype you store in. The only disadvantage I that, this obscures the 
logic of the program.

> Yes function pointers are legal.  ANSI C99 says:
> 
> "J.5.7 Function pointer casts
> 1 A pointer to an object or to void may be cast to a pointer to a
> function, allowing data to be invoked as a function (6.5.4).
> 2 A pointer to a function may be cast to a pointer to an object or to
> void, allowing a
> function to be inspected or modified (for example, by a debugger) (6.5.4)."
> 
> A function name is just a pointer to the memory location where the
> function is found at runtime.  It can be queried, modified and cast to
> other types.  It behaves like a variable.  Take a look at the
> sigaction structure:
> 
> 	struct sigaction {
> 		/* SIG_DFL, SIG_IGN or pointer to function */
> 		void (*sa_handler)(int); 
> 		... /* some other fields */
> 	};
> 
> You can define sigaction as follows:
> 
> 	void handler(int signo) {
> 		doneflag = 1;
> 	}
> 
> 	struct sigaction sa;
> 	sa.sa_handler = handler;
> 	...
> 
> Here, sa_handler is registered as a function to be called when the
> specified signal occurrs.
> 
> Just handle function pointers as simple pointer variables.

   Have still one silly question ---
     since you say function pointers are similar to simple pointer 
variables, and that's why the typecast works, what would the following 
code mean?

   void handler1 (int a) {

     /* body of handler - 1 */
     printf ("HANDLER - 1 \n");

   }

   void handler2 (int a) {

     /* body of handler - 2 */
     printf ("HANDLER - 2 \n");

   }

   struct sigaction sa;
   sa.sa_handler = (handler2 *) handler1;

   Is this possible? if so, what does it mean?


_z33
-- 
I love TUX; well... that's an understatement :)

