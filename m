From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Returning pointer to array of structures
Date: Tue, 29 Apr 2003 10:30:34 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16046.17978.731081.8548@cerise.nosuchdomain.co.uk>
References: <20030429083122.GA22282@gre.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030429083122.GA22282@gre.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Buchan <M.J.Buchan@gre.ac.uk>
Cc: linux-c-programming@vger.kernel.org


Martin Buchan wrote:

> I am trying to populate an array of structures with data read in from an
> xml file (using libxml2). I have a few methods which parse separate chunks
> of the xml file, populate the array, call the next method passing it
> whatever is in the array so far, and then returning the array back to the
> original caller.I am not getting any errors but the array is never
> populated when i return it to the calling function ( and most
> importantly main() ).
> 
> Here is my struct and some of my code.

> The printf statements in the methods print out the stuff i expect it
> to except for the one that prints out "SECOND SUBMENU:" and also
> the final printf statement in main() shows the array always being
> empty. This tells me i am not returning my pointer properly but i
> cant see what im doing wrong. Can anyone see what i am trying to do
> and/or where the error lies?

You aren't returning a pointer, you're returning a structure. 
Moreover:

a) you always return the first element of the array (*mePtr is
equivalent to mePtr[0]), and

b) you always store the returned structure in the first element of the
array.

This isn't an error in itself, but the overall structure of the code
means that you are effectively doing:

	mePtr[0] = mePtr[0];

repeatedly. As this is redundant, it seems likely that you meant to do
something else.

I'm not familiar with libxml2, so I can't comment on that aspect of
it. But that's probably irrelevant; your problem seems to be a
fundamental misunderstanding about the nature of pointers and arrays.

Maybe you should try taking a small section of code, and explaining
what you think it does.

OTOH, this is almost certainly an error:

	 uri = xmlGetProp(cur, "name");
	 xmlFree(uri);
	 mePtr[i].appsubmenu = uri;

Assuming that xmlFree() is a "destructor", you shouldn't be calling it
until you have actually finished with "uri". Given that you are
storing "uri" for later use, you probably either shouldn't be calling
xmlFree() at all, or you should be copying the string itself (e.g. 
with strdup()), and not just the pointer.

-- 
Glynn Clements <glynn.clements@virgin.net>
