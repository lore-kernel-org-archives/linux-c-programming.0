From: Jeff Woods <kazrak+kernel@cesmail.net>
Subject: Re: named structure members
Date: Thu, 11 Sep 2003 04:50:39 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20030911044032.01ac2a60@no.incoming.mail>
References: <20030911110742.GD6863@3d-computers.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030911110742.GD6863@3d-computers.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Matthew Harrison <matth@3d-computers.co.uk>
Cc: linux-c-programming@vger.kernel.org

At 9/11/2003 12:07 PM +0100, Matthew Harrison wrote:
><snip>
>for(i = 0; i < n_values; ++i)
>         {
>                 strcpy(keyword, good_values[i]);
>
>                 switch (read_config_var(values_file, keyword, value))
>                 {
>                         case 0:
>                                 strcpy(config.?, value);
>                                 break;
>                         case -1:
>                                 printf("\nFile Error for [%s] \n", 
> values_file);
>                                 break;
>                         case -2:
>                                 printf("\nBad User Parm for [%s] \n", 
> keyword);
>                                 break;
>                         default:
>                                 printf("\nUnknown Error Occurred \n");
>                                 break;
>                 }
>         }
></snip>
>
>what i'm doing is stepping thru an array of different config options 
>calling the read_config_var on each one and checking the output. if the 
>output is good then i want to store the value in a member of a structure. 
>for example i want the config options to be stored like this:
>
>config.db_host = 'maiden.genestate.com'
>config.db_user = 'root'
>
>you get the idea. my question is how do i dynamically assign a name to a 
>structure member. I have good_values[i] which contains the current config 
>directive but if you look at line 8 of the example, you can see the 
>problem, how do i say config.good_values[i], when good_values[i] is not 
>itself a member.

It would help to understand better if you show us the declaration for the 
"config" structure.

If I understand what you're asking (and I'm not at all sure that I am) I 
think you want to use a C struct like an associative array from TCL or 
(IIUC) Perl.  C does not (directly) support associative arrays.  If you 
want that behavior, you have to code it explicitly.  Structures in C must 
have all the fields of the structure explicitly declared when the structure 
is defined.

>sorry for not being able to explain this very well but you can see what i 
>mean.

I'm not at all sure I understand what you're asking.  If I've guessed 
wrong, try rephrasing the question, or perhaps someone else will understand 
what you mean.

P.S.  Anyone trying to write or maintain C code should have a copy of K&R, 
preferably 2nd Edition [ 
http://www.amazon.com/exec/obidos/tg/detail/-/0131103628 or 
http://tinyurl.com/mziv ] these days.  It's a good tutorial (at least for 
someone experienced with other procedural languages) and a great reference 
manual on C.  Of course, it's a little terse so it takes multiple readings 
(like a love letter) to get the full flavor.

--
Jeff Woods <kazrak+kernel@cesmail.net>  


