From: Shriramana Sharma <samjnaa@gmail.com>
Subject: various meanings of static
Date: Sat, 23 Jun 2007 11:38:44 +0530
Message-ID: <467CB8EC.8080209@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hello.

To my thinking, the keyword static is used for four different purposes 
in C++. I will explain this and I request your comments on that:

1. "static" is used in the declarations at file scope of variables and 
functions to make them "local" -- i.e. visible only within that file.

2. "static" is used in the declarations of variables inside functions to 
make them "sticky" -- i.e. not get destroyed when the function is exit. 
They "stick" around.

3. "static" is used in the declarations of variables inside classes to 
make them "classwide" -- i.e. common to all instances of that class, in 
contrast with other member variables which are unique to each instance.

4. "static" is used in the declarations of functions inside classes to 
make them "nothis" -- i.e. not take/require a silent "this" pointer to 
be passed, and hence be able to be called without an instance of that 
class to exist.

I am thinking of using # define-s to use these four words:

local, sticky, classwide, nothis

instead of static in my C++ programs to make them more meaningful. I 
believe that the above four are mutually distinct purposes of the single 
static keyword and whether a future C++ standard disambiguates these 
purposes or not (where I prefer it would) I can even now use these new 
clearer keywords.

Are there any other meanings to static? Or are there any objections to 
the above classification?

Thank you.

Shriramana Sharma.

