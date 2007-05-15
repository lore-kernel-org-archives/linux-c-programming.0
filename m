From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: class Q_CORE_EXPORT QFlag
Date: Tue, 15 May 2007 17:54:28 +0100
Message-ID: <17993.58820.723294.37880@cerise.gclements.plus.com>
References: <46372A8E.5090201@gmail.com>
	<6a00c8d50705040504p4fadca4vd62b074c2696c7e6@mail.gmail.com>
	<4648AF81.1070702@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4648AF81.1070702@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Steve Graegert <graegerts@gmail.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> Thanks Leslie and Steve. It did not occur to me that it would be 
> something MOC takes care of.
> 
> I need to read up on what these mangled __ symbols mean. I have seen 
> some in glibc sources (just perused a few files) especially things like 
> __throw -- probably flags to the C++ compiler indicating what a 
> particular class or function or whatever behaves like, yes?

Identifiers beginning with an underscore are reserved for the
"implementation", i.e. the compiler and/or standard libraries (libc
and libm). Specifically:

         -- All  identifiers  that  begin  with  an  underscore and
            either an uppercase letter or  another  underscore  are
            always reserved for any use.

         -- All  identifiers  that  begin  with  an  underscore are
            always reserved for use as identifiers with file  scope
            in both the ordinary and tag name spaces.

Most of them will be documented in the Info files for gcc and glibc.

-- 
Glynn Clements <glynn@gclements.plus.com>
