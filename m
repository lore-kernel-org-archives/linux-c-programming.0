From: a.biardi@tiscali.it
Subject: Re: argv[0]
Date: Fri, 24 Feb 2006 14:59:25 +0100
Message-ID: <200602241459.25477.a.biardi@tiscali.it>
References: <200601130016.23410.a.biardi@tiscali.it> <6a00c8d50601130426u2a9640evc14ee8c3d61c7925@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50601130426u2a9640evc14ee8c3d61c7925@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

On Friday 13 January 2006 13:26, you wrote:

> On 1/13/06, a.biardi@tiscali.it <a.biardi@tiscali.it> wrote:
> > Hi,
> >
> > Is there any C function that can tell me what argv[0] is, outside
> > main()?
> >
> > I thought to use getpid() and then look at /proc/<pid>/cmdline
> > but doesn't seem portable. Any hints?
>
> The arguments are pushed on the stack upon process creation.  Once
> the process is running there is little chance to get hands on them
> except for the /proc approach.
>
> 	\Steve
>

Just in case anybody needs it, I think I found something inside=20
errno.h (GNU-only):

/* The full and simple forms of the name with which the program was
   invoked.  These variables are set up automatically at startup based
   on  the value of ARGV[0] (this works only if you use GNU ld). */
extern char *program_invocation_name, *program_invocation_short_name;=B6

Bye,
Andrea.
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
