From: Neil Horman <nhorman@tuxdriver.com>
Subject: Re: argv[0]
Date: Fri, 13 Jan 2006 07:19:51 -0500
Message-ID: <20060113121951.GA19390@hmsreliant.homelinux.net>
References: <200601130016.23410.a.biardi@tiscali.it> <20060113105244.53bda39b@localhost.localdomain> <200601131252.26737.a.biardi@tiscali.it>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200601131252.26737.a.biardi@tiscali.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: a.biardi@tiscali.it
Cc: linux-c-programming@vger.kernel.org

On Fri, Jan 13, 2006 at 12:52:26PM +0100, a.biardi@tiscali.it wrote:
> On Friday 13 January 2006 10:52, you wrote:
> 
> > Hello Andrea,
> >
> > On Fri, 13 Jan 2006 00:16:23 +0100 a.biardi@tiscali.it wrote:
> > > Hi,
> > >
> > > Is there any C function that can tell me what argv[0] is, outside
> > > main()?
> > >
> > > I thought to use getpid() and then look at /proc/<pid>/cmdline
> > > but doesn't seem portable. Any hints?
> >
> > For instance, in main(), you can store argc and argv into global
> > const pointers that you can use anywhere else.
> >
> > Here's an example (see the attached files):
> >
> > $ gcc main.c elsewhere.c
> > $ ./a.out
> >
> > shows:
> > main: 1 0xbf8526f4 './a.out'
> > sample1: 1 0xbf8526f4 './a.out'
> > sample2: 1 0xbf8526f4 './a.out'
> >
> >
> > HTH,
> 
> Thanks, I know that. But I am developing a library, and have no access 
> to the real main().
> 
> I could ask the user of my library to place a call to an init() 
> function in main(), passing argv[0] along, but I don't like this 
> solution very much.
> 
> Assuming I don't have access to main(), is there any other way to 
> retrieve argv[0]?
> 
This probably isn't too much more portable than interrogating
/proc/<pid>/cmdline, but I expect that since argv is passed in on the stack to
main, you could probably compute the top of the applications stack, and find the
argv pointer that way.  You may have to make a few assumptions about the system
architecture, but it can be done.  Check out the backtrace function in glibc for
an example (at least on x86) of how finding the top of stack is done there.

Regards
Neil

> Thanks,
> Andrea.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
/***************************************************
 *Neil Horman
 *Software Engineer
 *gpg keyid: 1024D / 0x92A74FA1 - http://pgp.mit.edu
 ***************************************************/
