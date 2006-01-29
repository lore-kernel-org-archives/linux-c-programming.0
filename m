From: James Colannino <james@colannino.org>
Subject: Debugging
Date: Sat, 28 Jan 2006 22:21:46 -0800
Message-ID: <43DC5EFA.7010001@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hey everyone.  I have a small program that I had written a while ago in 
C to help me study for my Spanish class.  I decided to rewrite some code 
recently being that I have a little more experience, and found that the 
program does not function properly when I compile with -O2 optimizations 
(I'm using GCC.)  It works as it should, however, when there are no 
optimizations.  How exactly should I go about debugging this and 
figuring out what code is causing the problem?  I could compile it with 
the -g option and feed it to GDB, but then doesn't debugging not work 
very well when you've done optimizations?  Is -O2 a low enough level of 
optimization that I shouldn't have a problem?  Debugging is one of the 
many things I know extremely little about, so I'm very in the dark 
here.  Any input would be greatly appreciated :)  Thanks very much in 
advance.

James

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"If Carpenters made houses the way programmers design programs, the first woodpecker to come along would destroy all of civilization." --Computer Proverb

