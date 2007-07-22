From: Shriramana Sharma <samjnaa@gmail.com>
Subject: singleton pattern really necessary?
Date: Sun, 22 Jul 2007 12:02:03 +0530
Message-ID: <46A2F9E3.9050209@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

I was wondering, if a person wants there to be only one instance of a 
class, they can simply do something like:

class {
<class definition here>
} classInstance ;

which automatically creates a single instance of a class. Why go to the 
extent of locking the constructor, copy constructor, operator= etc? The 
only possible thing (that I can think of) that cannot be done is 
conveniently passing it as an argument to a function. Is there any other 
reason that would make a class-name necessary?

Shriramana Sharma.

