From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Returning pointer to array of structures
Date: Thu, 1 May 2003 01:49:21 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16048.28433.119139.292067@cerise.nosuchdomain.co.uk>
References: <20030429083122.GA22282@gre.ac.uk>
	<UP74EBBAEBHCKGTNLKMJPL95LFFDV.3ead0903@rafaelnote.ns1.lhost.com.br>
	<20030430082421.GH22282@gre.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030430082421.GH22282@gre.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Buchan <M.J.Buchan@gre.ac.uk>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Martin Buchan wrote:

> > Try the modifications above.
> >
> > - menuentry parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)
> > + void parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)
> 
> Thanks. Ive done as you suggested and it all works. 
> 
> As the way i had coded it before where i was returning the structure
> each time worked, I am assuming this is a better way to code it (seeing 
> as you guys have suggested it and i know diddly squat :-)
> 
> Why is this so?
> Is it just because i do not have the extra overhead of
> passing/returning the structure for each function call or is there
> something more fundamental?

The main issue is that it's unnecessary in this case. That lead me
(and probably others) to suspect that you might have misunderstood
what was happening and/or meant to do something else.

E.g. parseSection() calls parseSubmenu(), passing mePtr as an
argument. parseSubmenu() stores data in the elements of mePtr, and
also returns the first element (*mePtr, equivalent to mePtr[0]) as a
result. parseSection() then stores the result in *mePtr, even though
the value it's storing is bound to be exactly what's already there.

In general, there are two ways to return values from a function:

1. Return the value as the function's result.

2. Pass in a pointer to where you want the value to be stored, and
have the function store it there.

Option 2 is normally chosen if you want to return:

a) multiple values,
b) an array, or
c) large structures.

Option 1 is normally chosen if you only want to return a single, small
value (usually a primitive type such as int, float etc).

Case a) is due to C functions only being able return a single value. 
Case b) is because arrays are always passed by reference (a pointer to
the first element of the array). Case c) is for efficiency; returning
a result typically involves the callee copying it onto the stack, then
the caller copying it from the stack.

-- 
Glynn Clements <glynn.clements@virgin.net>
