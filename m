From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: literal constant..
Date: Tue, 3 Feb 2004 15:07:19 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16415.47399.788755.954825@cerise.nosuchdomain.co.uk>
References: <20040203121616.2402884f.vadiraj@mail.cyberneme.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040203121616.2402884f.vadiraj@mail.cyberneme.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj C S <vadiraj@mail.cyberneme.com>
Cc: linux-c-programming@vger.kernel.org


Vadiraj C S wrote:

>   I just joined the group. I have a doubt here, might sound simple
>   but need to be cleared well,
> 
> what is the diff between the following statements..
> 
>   char *c="c" ;
> 
>   char c[1] = "c" ;

The first statement creates a pointer variable, c, which is
initialised to point at the string literal "c", which is itself stored
in the read-only data segment.

The second statement creates an array variable, c, which is intialised
with the single character 'c'. Note that the array should have been
declared to hold two bytes, to include the terminating NUL character.

More generally: if you need to ask this question, you need to spend
more time learning the basics of C before trying to program in it.

-- 
Glynn Clements <glynn.clements@virgin.net>
