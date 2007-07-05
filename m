From: Eugene Rosenzweig <eugene259@internode.on.net>
Subject: Re: C/C++ File Parser
Date: Fri, 06 Jul 2007 01:20:52 +1000
Message-ID: <f6j28g$pna$1@sea.gmane.org>
References: <11445958.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <11445958.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

mudassir wrote:
> Hi All,
> 
> I am in search of a snippet that could parse a C/C++ source file and
> give out as output different information on it. For example
> 
> 1. Signature of function defined in a file.
> 2. Name of Global Variables declared.
> 3. Files dependencies..(#include).
> 
> Can you help?
> 
> thanks,
> mudassir. 

Some parser engines out there would have ANSI/K&R C grammar already
available for you to integrate into your program. Have a look at some in
this list: http://en.wikipedia.org/wiki/List_of_Parsers

