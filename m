From: Martin Buchan <M.J.Buchan@gre.ac.uk>
Subject: Re: segfault with strdup
Date: Tue, 20 May 2003 14:52:54 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030520135254.GD674@gre.ac.uk>
References: <20030520112034.GZ674@gre.ac.uk> <200305201316.h4KDGUhG007842@grinch.txt.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200305201316.h4KDGUhG007842@grinch.txt.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: "Jason P. Winters" <jason@txt.com>

On Tue, May 20, 2003 at 06:15:58AM -0700, Jason P. Winters wrote:
>  
> > The place where it is seg faulting is
> > 
> > uri = xmlGetProp(cur, "name");
> > mePtr[i].appname = strdup(uri);  /* HERE */
> 
> Well, I don't have a lot of time to spend on it, but here are a
> couple of observations:
> 
> First and formost: you're not testing the result of xmlGetProp for
> null. This is probably your "problem", as you then try and dup a
> null string.  Bad habit, that. :}

Point taken :-)
Now i am testing for NULL but i still get the same problem. However,
i do not think this is the probelm because if i step thru the
program with ddd, just before it segfaults at the line 

mePtr[i].appname = strdup(uri);

If i hover the mouse over the previous line:

uri = xmlGetProp(cur, "name");

It shows me that the value of uri is "Netscape Navigator"

Also, if this was the case (and i wish it was cos then i could fix
it :) then that would apply to the directory where the code works in
as well as any other directory.??

thanks for pointing out testing for NULL though.

Martin
