From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Copying a class copies the member functions?
Date: Sun, 08 Apr 2007 20:50:54 +0530
Message-ID: <46190856.1010207@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Apropos my recent questions regarding passing by reference etc the 
following question comes to mind:

When a class instance is created, does this also create a copy in memory 
(from the class prototype) of the member functions or only of the data 
members?

Regarding static member functions I realize there is no meaning to have 
an instance of the member function for each instance since the function 
does not relate to an instance of the class.

But even regarding non-static functions, I don't see any meaning in 
having an instance of the function for each member of the class, since 
all such functions would do basically the same thing, though with their 
parent instance only.

So what's the fact here? Is there any need for new copies of member 
functions with each new instance of a class being created? *Are* such 
new copies created by good compilers like GCC?

Thanks again for all your good and patient responses.

Shriramana Sharma.

