From: Hossein Mobahi <hmobahi@yahoo.com>
Subject: Re: assignment makes pointer from integer without a cast?
Date: Sun, 12 Dec 2004 17:47:57 -0800 (PST)
Message-ID: <20041213014757.89052.qmail@web12706.mail.yahoo.com>
References: <1102899159.7251.14.camel@guru.puzzled.xs4all.nl>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1102899159.7251.14.camel@guru.puzzled.xs4all.nl>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Patrick

Your program has a few incorrect assignments. Is
prog_ptr going to hold a string? I guess so because
you want to print program name. So "int *prog_ptr" is
wrong, use "char *prog_ptr" instead, i.e. an address
pointing to the first character of a given string. 

Moreover, you do not need to use ampersand to obtain
prog_ptr's address because it is already a pointer
itself not an ordinary variable.

Eventually, you must pass a pointer to fprintf when
you use %s. So the * is incorrect (*prog_ptr returns a
character only, the first character of your string,
which is not what you want).

I'd rewrite your program as follows:

#include <stdio.h>

void usage(char *prog_ptr) /* not int* */
{
	fprintf(stdout,"progname is: %s\n",prog_ptr); /* not
*prog_ptr */
}
	
int main(int argc, char *argv[])
{
	char *prog_ptr; /* not int * */
	prog_ptr = basename (argv[0]);
	usage(prog_ptr); /* not &prog_ptr */
	return(0);
}


--- Patrick <patrickC@puzzled.xs4all.nl> wrote:
> #include <stdio.h>
> 
> void usage(int *prog_ptr)
> {
> 	fprintf(stdout,"progname is: %s\n",*prog_ptr);
> }
> 	
> int main(int argc, char *argv[])
> {
> 	int *prog_ptr;
> 	prog_ptr = basename (argv[0]);
> 	usage(&prog_ptr);
> 	return(0);
> }



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Helps protect you from nasty viruses. 
http://promotions.yahoo.com/new_mail
