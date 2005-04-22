From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Handling large files
Date: Fri, 22 Apr 2005 20:20:44 +0100
Message-ID: <17001.20108.68648.190269@gargle.gargle.HOWL>
References: <20050422170321.GA16959@cmi.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050422170321.GA16959@cmi.ac.in>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anindya Mozumdar <anindya@cmi.ac.in>
Cc: linux-c-programming@vger.kernel.org


Anindya Mozumdar wrote:

>    Recently I was dealing with large csv ( comma separated value )
>    files, of size around 500M.
> 
>    I was using perl to parse such files, and it took around 40 minutes
>    for perl to read the file, and duplicate it using the csv module.
>    Python's module took 1 hr. I am sure even if I had written c code,
>    opened the file and parsed it, it would have taken a lot of time.
> 
>    However, I used MySQL to create a database from the file, and the
>    entire creation took around 2 minutes. I would like to know how is
>    this possible - is it a case of threading, memory mapping or some
>    good algorithm ?

Good algorithm, probably.

When done correctly, parsing uses minimal CPU resources. Unless you
have a very fast hard disk or a very slow CPU, you should be able to
parse that CSV file as fast as you can read it from disk without
significantly loading the CPU.

The standard mechanism for parsing according to a regular grammar is
to use a deterministic finite automaton. The CSV format can be
described by a regular grammar.

There is a substantial amount of theory related to formal grammars and
the parsing of them. Rather than go into that here, I'll provide a
link to the Wikipedia page:

	http://en.wikipedia.org/wiki/Formal_grammar

The links on that page may provide useful information. Also, the
technical terms used on that page (and those it links to) will be
useful as search phrases for Google.

From the practical perspective, the usual mechanism for generating
code to parse according to a regular grammar is to use lex (or flex). 
lex reads a grammar description and generates the C source code for a
parser which will parse that grammar.

If you're concerned about performance, use the -b switch to generate
diagnostic information regarding backing-up, then modify the grammar
as necessary so as to eliminate backing-up.

The main limitation of regular grammars is that they cannot describe
languages (formats) which allow for "nested" constructs (e.g. most
programming languages). The most common such grammars are context-free
grammars, which can be handled using a mix of lex and yacc (or bison).

-- 
Glynn Clements <glynn@gclements.plus.com>
