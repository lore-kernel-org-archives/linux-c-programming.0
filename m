From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Request help with function pointers
Date: Wed, 7 Mar 2007 16:49:13 +0000
Message-ID: <17902.60681.663240.880794@cerise.gclements.plus.com>
References: <45DD1BC9.9030902@gmail.com>
	<200702270948.38776.kratzers@pa.net>
	<45E5A0A1.8080607@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <45E5A0A1.8080607@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> > Remove the space in ". *" and "-> *".
> 
> Thank you very much -- that worked, but is there any good reason why I
> should not be allowed to put a space there? When I can use:
> 
> :: *
> 
> in the same programs without an error, why can't I use
> 
> . *
> 
> or
> 
> -> *

Because ".*" and "->*" are tokens, and you can't have a space in the
middle of an token, in the same way that you can't put a space in the
middle of "++", "+=", ">=" etc.

".*" looks like a combination of "." and "*", and "->*" looks like a
combination of "->" and "*", and in a sense they behave that way, but
".*" and "->*" are actually separate tokens, not a combination.

> (I like having my code neatly and generously spaced since I feel it
> looks cleaner.)
> 
> I get no problem if I space the . and -> in other cases like:
> 
> QWidget . show () ;
> 
> or
> 
> this -> show () ;

Here, "." and "->" are tokens. Putting a space between the "-" and ">"
in "->" would similarly result in an error, as would a space in the
middle of "th is". You can put a space between "(" and ")", though.

> So if there is no good reason for not being allowed to put a space
> between . and * or -> and *, I can report a bug against gcc asking for
> this error to be removed for being meaningless.

No, gcc is correct.

-- 
Glynn Clements <glynn@gclements.plus.com>
