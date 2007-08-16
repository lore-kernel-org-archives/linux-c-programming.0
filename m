From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: String comparison for fixed strings
Date: Thu, 16 Aug 2007 02:44:21 +0100
Message-ID: <18115.44021.857573.892223@cerise.gclements.plus.com>
References: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>
	<200708150918.52599.kratzers@pa.net>
	<18115.4550.134335.647087@cerise.gclements.plus.com>
	<3493.84.157.36.125.1187198815.squirrel@viridian.dnsalias.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3493.84.157.36.125.1187198815.squirrel@viridian.dnsalias.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Leslie P. Polzer" <leslie.polzer@gmx.net>
Cc: kratzers@pa.net, KhaOsh <ficheironegro@gmail.com>, linux-c-programming@vger.kernel.org


Leslie P. Polzer wrote:

> > 3. An actual loop is typically quicker than an "unrolled" loop (where
> > you just repeat the loop body) as it results in smaller code and thus
> > better cache coherency.
> 
> I'm not sure whether it was the OP's intention to talk about
> the (dis)advantages of unrolled code.

No, but Stephen mentioned that strcmp() "uses a do/while loop".
On a modern CPU, branches don't normally take any CPU cycles.

> > All things considered, strcmp() is likely to be faster.
> 
> Given these things:
> 
> 1. The null byte check is mandatory.
> 
> 2. The haystack string is not _considerably_ larger than the
>    needle string.

Huh? The question was about strcmp(), not strstr().

For strcmp(), you don't really gain much by having the string fixed. 
If you are performing the check often enough, the string will be
cached. If the check is infrequent, a single strcmp() function is more
likely to be cached than several fixed-string checks. The strings
themselves won't necessarily be cached, but a cache miss for data is a
lot less significant than a cache miss for code.

For strstr() with a fixed "needle", a pre-compiled finite automaton
will win. With a variable "needle", if the "haystack" is large enough,
even a dynamically-generated finite automaton will be faster than an
strncmp() loop.

-- 
Glynn Clements <glynn@gclements.plus.com>
