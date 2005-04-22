From: Anindya Mozumdar <anindya@cmi.ac.in>
Subject: Handling large files
Date: Fri, 22 Apr 2005 22:33:21 +0530
Message-ID: <20050422170321.GA16959@cmi.ac.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

   Recently I was dealing with large csv ( comma separated value )
   files, of size around 500M.

   I was using perl to parse such files, and it took around 40 minutes
   for perl to read the file, and duplicate it using the csv module.
   Python's module took 1 hr. I am sure even if I had written c code,
   opened the file and parsed it, it would have taken a lot of time.

   However, I used MySQL to create a database from the file, and the
   entire creation took around 2 minutes. I would like to know how is
   this possible - is it a case of threading, memory mapping or some
   good algorithm ?

   I would be thankful to anyone who can give me a good answer to the
   question, as I cant think of a way myself to solve the problem.

Anindya.
