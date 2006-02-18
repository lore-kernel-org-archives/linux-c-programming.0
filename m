From: "James Colannino" <james@colannino.org>
Subject: glibc detected - free(): invalid next size
Date: Fri, 17 Feb 2006 20:59:27 -0800
Message-ID: <43F6A9AF.8010309@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hey everyone.  I have a quick question.  What does the following runtime 
error mean?

*** glibc detected *** free(): invalid next size (fast): 0x0804a1c0 ***

Does this mean that the program attempted to free memory from a pointer 
that wasn't allocated any memory?   I have a feeling that is what this 
means, but the message itself is cryptic.

On a related note, does anyone know of a good source that describes 
runtime errors such as this in detail?  It would help me greatly in my 
debugging experience.  Thanks :)

James

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/


