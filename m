From: Marius Nita <marius@cs.pdx.edu>
Subject: Re: strange gcc warning
Date: Mon, 13 Jan 2003 13:35:22 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030113133522.A2782@cs.pdx.edu>
References: <20030113212508.B1128@neutrino.particles.org> <20030113180750.78660.qmail@web8005.mail.in.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030113180750.78660.qmail@web8005.mail.in.yahoo.com>; from mshanks79@yahoo.co.in on Mon, Jan 13, 2003 at 10:07:50AM -0800
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shanks <mshanks79@yahoo.co.in>
Cc: linux-c-programming@vger.kernel.org

On Mon, Jan 13, 2003 at 10:07:50AM -0800, Shanks wrote:
> > On Mon, Jan 13, 2003 at 09:57:55AM -0800, Shanks wrote:
> > > my_print(int errno)
> > 
> > errno is defined in errno.h. You shouldn't use a new variable with this
> > name.
> Yes i am aware of errno being defined in errno.h
> But isn't my definition local to my func.
> Any technical reason why i am getting such a gdb output(pasted in prev mail)

Steven Smith already explained everything in detail...

The reason 'locality' doesn't matter here is that errno is a macro. It
actually gets substituted by the preprocessor before the compiler ever
gets the chance to parse your program. It's like saying:

#define foo *bar

int print_foo(int foo) {
  printf("%d\n", foo);
}

your function will become

int print_foo(int *bar) {
  printf("%d\n", *bar);
}

so saying print_foo(9) is obviously a segfault error: you'll end up
dereferencing address 9, which is most likely not what you want :)
