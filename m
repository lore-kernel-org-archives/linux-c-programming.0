From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: static variables and functions in header files
Date: Tue, 27 Aug 2002 15:17:07 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15723.35299.232003.638370@cerise.nosuchdomain.co.uk>
References: <20020827071753.14590.qmail@relay1.home.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020827071753.14590.qmail@relay1.home.ro>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alina Valea <avalea@home.ro>
Cc: linux-c-programming@vger.kernel.org


Alina Valea wrote:

> Has anybody ever declared variables and functions as static
> in header files (that will be included in several .c files)?
> I've just seen this in a project and it puzzled me. Is it OK
> to do it?

It won't usually cause any problems, but it's seldom a good idea.

What's the point in declaring identically-named (but distinct)
variables in each source file which includes a particular header?

In general, header files should only contain declarations; definitions
belong in the actual source (.c) files.

-- 
Glynn Clements <glynn.clements@virgin.net>
