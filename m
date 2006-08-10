From: "Raseel Bhagat" <raseelbhagat@gmail.com>
Subject: Re: the pros and cons of "catch-all" header files
Date: Fri, 11 Aug 2006 02:25:26 +0530
Message-ID: <f68850780608101355s235899cbw48b908ffcd423db5@mail.gmail.com>
References: <Pine.LNX.4.64.0608100956590.13049@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0608100956590.13049@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: C programming list <linux-c-programming@vger.kernel.org>

Hi Robert

On 8/10/06, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   over the next few days, i'm going to have some general design-type
> questions as i try to restructure a project i'm working on, so i'm
> hoping i don't wander too far from the mandate of the list.

Goodie !!  I hope this will be as fun for us as it is for you !!

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

I use a similar design architecture in my project.
I think the convinience factor comes in when the project is REALLY
large and, more impostantly, spread out.

In fact, in my project, I have a a heirarchy of these "catchall" header files.
Eg. A module has a catchall file for all its sub-modules, A component
has a catchall header file for all its modules, an interface for is
components, a product for all its interface and components.... so on
and so forth.

I can't imagine being selective with the header files as I would end
up with tens of 100s of LOC of only header file declaration.
Not to mention the tediousness of the selection procedure.



-- 
Raseel.
http://osd.byethost8.com
http://raseel.livejournal.com
