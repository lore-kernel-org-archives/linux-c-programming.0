From: Shriramana Sharma <samjnaa@gmail.com>
Subject: include guards
Date: Fri, 15 Jun 2007 09:13:59 +0530
Message-ID: <46720AFF.6070402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hello.

To prevent header files from being included more than once in the same 
translation unit, we use include guards like

# ifndef FOO_H
# define FOO_H
...
# endif

Recently I came to know that I can use simply:

# pragma once

instead of the above group of sentences and the desired effect is still 
accomplished.

This leads me to think of two things:

1. why use the ifndef-define-endif method when the pragma once method is 
simpler and cleaner?

2. why should we need to use either method at all? If it is a 
universally undesirable behaviour that the same header file is included 
in a translation unit more than once, then an intelligent compiler (or 
preprocessor) itself can by default take of this, right?

I understand that to write portable code that compiles on 
not-so-intelligent compilers, we may need to do something manually, so 
question 2 is answered, but question 1 still stands...

Shriramana Sharma.

