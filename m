From: Steve Graegert <graegerts@gmail.com>
Subject: Re: variable length function
Date: Wed, 15 Jun 2005 08:33:06 +0200
Message-ID: <6a00c8d50506142333197a5b0@mail.gmail.com>
References: <20050614174356.58804.qmail@web52910.mail.yahoo.com>
	 <6a00c8d505061412142f93e234@mail.gmail.com>
	 <17071.37179.269117.890201@gargle.gargle.HOWL>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17071.37179.269117.890201@gargle.gargle.HOWL>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Ankit Jain <ankitjain1580@yahoo.com>, linux-c-programming@vger.kernel.org

On 6/15/05, Glynn Clements <glynn@gclements.plus.com> wrote:
> 
> Steve Graegert wrote:
> 
> > > also, if what is the default return type and value of
> > > main function in C in gcc, ansi C and turbo C?
> 
> > Question 4:
> > ISO C99 suggests the return type of main() to be of type int.  There
> > is a never ending debate among some professionals whether void is
> > equally legal.  Some compilers behave like ANSI C that allows
> > declaration of type void but return int implicitly.  In other words:
> > stick to int.
> 
> The value returned from main is used as the process' exit code. If you
> declare main() as returning void, and return from it, the process is
> likely to have a random exit code (e.g. whatever happens to be in the
> EAX register upon return from main()).

Yes, another important issue.  The most reliable way to return a valid
and correct value I am aware of is returning a value explicitly. 
You're right. just declaring int does not imply the return code to be
the expected one, though being valid.  It is __not__ guaranteed that
the return type is not some random integer value unless it is returned
explicitly.

Another point that comes to mind are compilers with distinct calling
conventions for int and void functions and job control for example. 
This can cause headaches when main() does not push a return value on
the stack, as being the case with void, and the caller tries to pop an
int which obviously is not found.  It __may__ lead to subtle crashes
later on.


Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> || <http://www.technologies.de/~sg/>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
