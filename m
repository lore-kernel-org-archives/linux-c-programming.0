From: r_zaca <r_zaca@ig.com.br>
Subject: Re: Assignment  make pointers
Date: Mon, 13 Dec 2004 08:04:32 -0200
Message-ID: <20041213_100432_025782.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1102932272"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1102932272
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

  If you take a look in "man 3 basename", you'll see that basename function 
just returns a pointer to a char. In the case above you need to "cast" the 
pointer returned to be of type int. 
  Like: prog_ptr = (int *) basename (argv[0]); 
  I hope it will help you. 
  Good luck. 


Hello, 

New to the list and to C. Read O'Reilly's Practical C Programming and 
another C book and am now trying to evolve beyond helloworld.c. When I 
compile the snippet below, gcc-3.4.2 on Fedora Core 3 spits out: 
test2.c:11: warning: assignment makes pointer from integer without a 
cast 
test2.c:12: warning: passing arg 1 of `usage' from incompatible pointer 
type 

I just can't figure out why it does that and how to fix it since my 
pointer/casting/C knowledge is definitely lacking. The snippet does work 
ok. Anyone care to enlighten me? 

#include <stdio.h> 

void usage(int *prog_ptr) 
{ 
	fprintf(stdout,"progname is: %s\n",*prog_ptr); 
} 
	 
int main(int argc, char *argv[]) 
{ 
	int *prog_ptr; 
	prog_ptr = basename (argv[0]); 
	usage(&prog_ptr); 
	return(0); 
} 

--Message-Boundary-by-Mail-Sender-1102932272--

