From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Request help with function pointers
Date: Wed, 28 Feb 2007 21:02:49 +0530
Message-ID: <45E5A0A1.8080607@gmail.com>
References: <45DD1BC9.9030902@gmail.com> <200702270948.38776.kratzers@pa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200702270948.38776.kratzers@pa.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Stephen Kratzer wrote:
> Remove the space in ". *" and "-> *".

Thank you very much -- that worked, but is there any good reason why I
should not be allowed to put a space there? When I can use:

:: *

in the same programs without an error, why can't I use

. *

or

-> *

(I like having my code neatly and generously spaced since I feel it
looks cleaner.)

I get no problem if I space the . and -> in other cases like:

QWidget . show () ;

or

this -> show () ;

So if there is no good reason for not being allowed to put a space
between . and * or -> and *, I can report a bug against gcc asking for
this error to be removed for being meaningless.

Thank you.

Shriramana Sharma.



