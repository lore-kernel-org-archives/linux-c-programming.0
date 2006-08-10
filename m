From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: the pros and cons of "catch-all" header files
Date: Thu, 10 Aug 2006 22:02:37 +0100
Message-ID: <17627.40685.357061.263211@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0608100956590.13049@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0608100956590.13049@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

>   over the next few days, i'm going to have some general design-type
> questions as i try to restructure a project i'm working on, so i'm
> hoping i don't wander too far from the mandate of the list.
> 
>   on this current project, there is frequent use of what i call
> "catchall" header files.  rather than have individual source files
> pull in just those header files they need, a monster "catchall.h" file
> is created that contains almost all project-related inclusions, so
> that source files need only:
> 
>   #include "catchall.h"
> 
>   sure, it's convenient, but there are also some obvious downsides.
> the simple question -- is there a defensible rationale for this
> approach?  i personally don't like it and would prefer source files to
> be more selective, but the argument i keep hearing is, "it's more
> convenient."
> 
>   thoughts?

The pro is that it's convenient.

The con's are that it might include too much, e.g. introduce type or
macro names which conflict with identifiers which your source files
use.

How much of a problem this is depends upon how "clean" the header is. 
Including system headers, defining (as opposed to declaring)
variables, and leaving parameter names in function prototypes will all
create additional problems.

Also, a single large header reduces modularity, and makes it harder to
re-use distinct subsystems from the code.

-- 
Glynn Clements <glynn@gclements.plus.com>
