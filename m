From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: value computed is not used ??
Date: Tue, 1 Jun 2004 22:58:27 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <c9iqhv$akj$1@sea.gmane.org>
References: <E3E30069B061524E90BCEE4417E30661138500@monm207.monmouth.army.mil> <16572.54376.258083.671154@cerise.nosuchdomain.co.uk>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

> > I to am a little confused on why you state that int main(void) is an
> > incorrect
> > prototype for main?  Quoting from the C99 - draft standard,
> >
> > "The function called at program startup is named main.  The
implementation
> > declares
> > no prototype for this function.  It shall be defined with a return type
of
> > int and with
> > no parameters:
> >     int main(void) {/* ... */}
> > or with two parameters (referred to hear as argc and argv, though any
names
> > may be used,
> > as they are local to the function in which they are declared):
> >     int main(int argc, char* argv[]) {/* ... *.}
> > or equivalent, or in some other implementation-defined manner." (section
> > 5.1.2.2.1)
> >
>
> If a function uses the C calling convention (which is true for almost
> everything except for functions which are exported from Windows DLLs),
> you can safely supply more arguments than the function expects. So
> long as the run-time supplies argc and argv, either prototype will
> actually work.
>
> In practice, Unix systems tend to use:
>
> int main(int argc, char **argv, char **envp)
>
> where envp is the array of environment variables (also available
> through the global variable "environ").
>
> So you can declare main() with any subset of these arguments, i.e. any
> of:
>
> int main(void)
> int main(int argc)
> int main(int argc, char **argv)
> int main(int argc, char **argv, char **envp)
>

All right, you win.
It just strikes me as a bad habit to declare main without at least argc and
argv.
Proof reading is about idioms, the more you part from proven practices, the
easier it is to write bug ridden code, and the more tedious it becomes to
verify said code at code review level.
For example, for loops written with the <= operator are quite likely to
contain off by one errors.  It catches my eye instantly, and I tend to be
rewarded often !  Same remark with casual do/while loops.
int main(void);  strikes me as 'beginners C code' and trips me off.

So there is nothing wrong with the prototype, just like there was nothing
wrong with rest on the small program : it compiles, and performs correctly,
but you will all admit that my other remarks were still making valid points.

Chqrlie.





