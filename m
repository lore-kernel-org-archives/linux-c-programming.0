From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Function pointers to inline functions
Date: Fri, 4 May 2007 14:40:10 +0100
Message-ID: <17979.14266.175484.318241@cerise.gclements.plus.com>
References: <4613DBC2.8060708@gmail.com>
	<6a00c8d50704041133u30d98daavec529753606fc7e9@mail.gmail.com>
	<46322C77.8070803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46322C77.8070803@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> I did some experimentation with pointers to inline and static inline 
> functions. Please unpack the attachment and run the build script.
> 
> You will observe that the nm files only differ in the last four lines, 
> and that too in only three of them.
> 
> The difference is that the executable built from the source with just 
> "inline" has the functions square, cube and fourthpower marked as "W" 
> which according to man:nm means that "The symbol is a weak symbol that 
> has not been specifically tagged as a weak object symbol".
> 
> In the same place, the executable built from the source with "static 
> inline" has the same functions marked "t" which denotes a local symbol 
> in the code section.
> 
> I actually expected static inline to make the entries for the functions 
> disappear but OK, I'm calling pointers to those functions, so they won't 
> disappear. But at least shouldn't they become weak objects, like they do 
> for "inline"?

There's no point in making them weak if they're local.

> Though I do not profess to fully understand what a weak object is, (upon 
> which matter I would like to learn more) it sounds like an object which 
> does not have a full separate existence. If an inline function is such a 
> weak object, how come a static inline one is not tagged as one?

A weak symbol is one which is only used as a last resort. If another
library defines a non-weak version of the same symbol, it will be used
in preference to the weak version.

-- 
Glynn Clements <glynn@gclements.plus.com>
