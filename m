From: Glynn Clements <glynn.clements@virgin.net>
Subject: RE: value computed is not used ??
Date: Tue, 1 Jun 2004 20:09:28 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16572.54376.258083.671154@cerise.nosuchdomain.co.uk>
References: <E3E30069B061524E90BCEE4417E30661138500@monm207.monmouth.army.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <E3E30069B061524E90BCEE4417E30661138500@monm207.monmouth.army.mil>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Cc: linux-c-programming@vger.kernel.org


Huber, George K RDECOM CERDEC STCD SRI wrote:

> > > I understood everything in the above answer except for one issue ? Why is:
> > > int main(void) {
> > > The wrong prototype for main ? main() schould return `0' or `1' etc ?!?
> > > Thank you very much for taking the effort to explain and answer.
> > > Jeroen.
>   
> > the proper prototype for main is
> > int main(int argc, char **argv);
> > or possibly :
> > int main(int argc, char *argv[]);
> > which is semantically equivalent, but emphasises the fact that argv points
> > to an array of char*
> 
> I to am a little confused on why you state that int main(void) is an
> incorrect 
> prototype for main?  Quoting from the C99 - draft standard,
> 
> "The function called at program startup is named main.  The implementation
> declares
> no prototype for this function.  It shall be defined with a return type of
> int and with
> no parameters:
>     int main(void) {/* ... */}
> or with two parameters (referred to hear as argc and argv, though any names
> may be used, 
> as they are local to the function in which they are declared):
>     int main(int argc, char* argv[]) {/* ... *.}
> or equivalent, or in some other implementation-defined manner." (section
> 5.1.2.2.1)
> 
> This seems to imply that either prototype for main may be used.  Is this a
> new addition to the C99 standard, or am I missing something here.

If a function uses the C calling convention (which is true for almost
everything except for functions which are exported from Windows DLLs),
you can safely supply more arguments than the function expects. So
long as the run-time supplies argc and argv, either prototype will
actually work.

In practice, Unix systems tend to use:

	int main(int argc, char **argv, char **envp)

where envp is the array of environment variables (also available
through the global variable "environ").

So you can declare main() with any subset of these arguments, i.e. any
of:

	int main(void)
	int main(int argc)
	int main(int argc, char **argv)
	int main(int argc, char **argv, char **envp)

-- 
Glynn Clements <glynn.clements@virgin.net>
