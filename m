From: Nir Dremer <mailing@dremer.org>
Subject: Re: development tools for interpreting code
Date: Tue, 21 Dec 2004 19:02:38 +0200
Message-ID: <1103648558.11010.13.camel@localhost>
References: <cq9icd$cpa$1@sea.gmane.org>
	 <1103646950.11010.7.camel@localhost>  <cq9kfq$ip8$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <cq9kfq$ip8$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: soraberri <421246@posta.unizar.es>
Cc: linux-c-programming@vger.kernel.org


Do you mean that during development time you have a problem to reach to
a specific method/... implementation?

if so what you need is tagging support.

taggings will enable you to jump to implementation without openning the
folder/file manually.

i'm not familiar with kdevelop in specific, my suggestion is to check
it's help for taggings or even to check ctags/etags command lines using
man.

hope i helped.


On Tue, 2004-12-21 at 17:53 +0100, soraberri wrote:
> Nir Dremer wrote:
> > as far as i understood the problem you're compiling your code without
> > debugging information.
> > 
> > in order for the debugger to know where the sources files are located
> > debugging information should be compiled into the executable/library.
> > 
> > common debugging flags are: -ggdb -g2.
> > 
> > check "man gcc" for more details.
> > 
> > 
> > On Tue, 2004-12-21 at 17:17 +0100, soraberri wrote:
> > 
> >>Hi all,
> >>
> >>In this stage of my learning I am basically trying to understand some 
> >>code that others have develop. The code is about bluetooth tools but 
> >>this is unrelevant at this moment. Rigth now I'm using Kdevelop for this 
> >>task with the source that I want to understand loaded into a new 
> >>project, and I always find the same problem which I will describe you in 
> >>terms of an example:
> >>
> >>at some point of the code I find a call to a function or a typedef name 
> >>(for exmple str2ba) and I would like to find the header file or even the 
> >>source file where this function (or type) is defined. I can only use the 
> >>Grep:str2ba command found under "Find in files..." dialog but sometimes 
> >>this is not suitable because I have to tell manually the path from the 
> >>starting point of the search, and if I don't know exactly the rigth 
> >>folder, the number of results searched can be too many for examining. I 
> >>guess it may be a better way, since the program compiles and has the 
> >>appropiate includes (#include <header>), so the compiler must know where 
> >>the function is defined.
> >>
> >>So, every suggestions would be wellcome,
> >>
> >>thaks in advance
> >>
> >>-
> >>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> >>the body of a message to majordomo@vger.kernel.org
> >>More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>
> > 
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> 
> well, maybe this is not the problem. In Kdevelop I have 
> --enable-debug=full flag in configuration options, and the option 
> "debug" checked at ->Build.
> Furthermore, my problem is not about compiling, is about reading code, 
> because I want a way to reach directly to the piece of code where 
> particular definitions are made.
> 
> regards
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

