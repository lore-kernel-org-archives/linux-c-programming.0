From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Pattern matching programming
Date: Fri, 20 May 2005 21:36:33 +0100
Message-ID: <17038.19025.312174.566505@gargle.gargle.HOWL>
References: <33128.200.91.100.219.1116437772.squirrel@www.crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <33128.200.91.100.219.1116437772.squirrel@www.crearium.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fabio@crearium.com
Cc: linux-c-programming@vger.kernel.org


fabio@crearium.com wrote:

> I am trying to code a small C program that basically takes a long text
> file with data that comes from a mysql server.
> 
> But I realize It is better to use regular expression. This is an examples
> of the text:
> 
> =1 <p> blah </p> <div foo>{$foobar}</div>blah.... <p>linux rulez</p>
> misc characters.... =2 blah blah <p> linux rulez again</p>.... <p>foo</p?blah

Don't try to parse anything as complex as HTML/SGML/XML using an
ad-hoc set of rules; use an existing library.

More generally, don't try to perform any non-trivial parsing without
familiarising yourself with the core theoretical concepts behind
formal grammars. A reasonable starting point is:

	http://en.wikipedia.org/wiki/Formal_grammar

If you can't locate an existing library for the language in question,
and you are using C or C++, the appropriate solution is almost
invariably to use lex (or flex) and yacc (or bison) to generate the
parser.

Using an ad-hoc approach (i.e. hand-coding a parser using the
functions in <regex.h> or, worse still, <string.h> or hand-coded
equivalents) is a recipe for producing a parser that is at worst
incorrect (i.e. will produce the wrong result in some cases) and at
best inefficient (it isn't hard to end up with a parser which is a
hundred times slower than an optimal lex-generated one).

-- 
Glynn Clements <glynn@gclements.plus.com>
