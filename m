From: a.biardi@tiscali.it
Subject: Re: argv[0]
Date: Fri, 13 Jan 2006 12:52:26 +0100
Message-ID: <200601131252.26737.a.biardi@tiscali.it>
References: <200601130016.23410.a.biardi@tiscali.it> <20060113105244.53bda39b@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060113105244.53bda39b@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Friday 13 January 2006 10:52, you wrote:

> Hello Andrea,
>
> On Fri, 13 Jan 2006 00:16:23 +0100 a.biardi@tiscali.it wrote:
> > Hi,
> >
> > Is there any C function that can tell me what argv[0] is, outside
> > main()?
> >
> > I thought to use getpid() and then look at /proc/<pid>/cmdline
> > but doesn't seem portable. Any hints?
>
> For instance, in main(), you can store argc and argv into global
> const pointers that you can use anywhere else.
>
> Here's an example (see the attached files):
>
> $ gcc main.c elsewhere.c
> $ ./a.out
>
> shows:
> main: 1 0xbf8526f4 './a.out'
> sample1: 1 0xbf8526f4 './a.out'
> sample2: 1 0xbf8526f4 './a.out'
>
>
> HTH,

Thanks, I know that. But I am developing a library, and have no access 
to the real main().

I could ask the user of my library to place a call to an init() 
function in main(), passing argv[0] along, but I don't like this 
solution very much.

Assuming I don't have access to main(), is there any other way to 
retrieve argv[0]?

Thanks,
Andrea.
