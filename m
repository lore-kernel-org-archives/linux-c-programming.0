From: Cesar Rincon <crincon@et.com.mx>
Subject: Re: compiling programs which use pthreads
Date: Sun, 25 Jan 2004 03:44:54 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040125094454.GD1361@et.com.mx>
References: <1075023389.27269.12.camel@qa.intotoind.com> <40138B0E.8060406@home.se>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40138B0E.8060406@home.se>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Ipsissima verba David Erman:
> 
> You need to link with  -lpthread. I.e.
> 
> gcc foo.c -lpthread

You should probably define _REENTRANT as well, e.g.

 gcc -D_REENTRANT -o foo foo.c -lpthread

so you get a per-thread errno and thread-safe "*_r" functions
(getlogin_r(), gethostbyaddr_r(), gethostbyname_r(), and many others).
See the "Feature Test Macros" section of the glibc manual, and of
course the "POSIX Threads" section for all the gory details.

 -CR

-- 
Ceterum censeo: SCO delenda est.
