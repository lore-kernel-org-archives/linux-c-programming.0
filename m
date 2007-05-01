From: Shriramana Sharma <samjnaa@gmail.com>
Subject: class Q_CORE_EXPORT QFlag
Date: Tue, 01 May 2007 17:24:54 +0530
Message-ID: <46372A8E.5090201@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

I see many usages in the Qt sources like:

class Q_CORE_EXPORT QFlag
{
	<blah blah blah>
} ;

Isn't the word immediately next to the keyword class supposed to be the 
class name? Q_CORE_EXPORT etc are certainly not class names. What are 
they and how are they allowed in between the word class and the class name?

I searched my "Thinking in C++" for this but did not turn up an answer. 
Please help.

Thanks as always,

Shriramana Sharma.

