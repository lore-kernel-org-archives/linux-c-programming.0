From: B S Srinidhi <srinidhi-c@deeproot.co.in>
Subject: Re: Compile error caused by case of filename extension
Date: Sat, 25 Mar 2006 14:05:30 +0530
Message-ID: <1143275731.18472.44.camel@avirat>
References: <200603251333.50127.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603251333.50127.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hi,

On Sat, 2006-03-25 at 13:33 +0530, Shriramana Sharma wrote:
[..]
> $ gcc -o TESTING TESTING.C
> /tmp/ccEnQk4o.o:(.eh_frame+0x11): undefined reference to 
> `__gxx_personality_v0'
> collect2: ld returned 1 exit status
> 
> But if I change the input file name extension to testing.c or even TESTING.c 
> (small letters) no problems were got. Why is this?
> 

From the man page of gcc(1):

file.cc
file.cp
file.cxx
file.cpp
file.CPP
file.c++
file.C
    C++ source code which must be preprocessed. Note that in .cxx, the
last two letters must both be literally x.  Likewise, .C refers to a
literal capital C.

That means, gcc will consider a source file with name TESTING.C to be a
C++ source code. Thus trying to include / link with some special
libraries. 

To compile your TESTING.C, use something like:

$ g++ -o TESTING TESTING.C

It 'll compile correctly.

Hope this helps.

Srinidhi.
-- 
ASCII ribbon campaign ( )         B S Srinidhi
 - against HTML email  X          http://srinidhi.deeproot.co.in
             & vCards / \         DeepRoot Linux

