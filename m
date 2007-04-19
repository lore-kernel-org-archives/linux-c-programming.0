From: Shriramana Sharma <samjnaa@gmail.com>
Subject: -ffunction-sections -Wl,--gc-sections trick and class members
Date: Thu, 19 Apr 2007 20:08:40 +0530
Message-ID: <46277EF0.900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

I learnt from the good people on this list that usage of:

-fdata-sections -ffunction-sections -Wl,--gc-sections

will ensure that only those sections of object modules get linked to the 
target which are actually used in the target.

Recently I was musing on whether I can use this when I recompile the Qt 
4 libraries for static linking. But the thing is that the Qt libraries 
are already very optimized in this aspect -- in that there is a separate 
source file per class and consequently a separate object file per class.

However I was wondering whether even then I could do my 
hyper-optimization because I will be using only a small number of 
functions in each class. It is highly unlikely that I (or anyone else) 
is going to use all member functions of a class.

Then I thought how I could possibly prevent linking a function which was 
part of a class definition. To my understanding at runtime whenever a 
class is loaded into memory (I'm not talking about the individual 
instances) its members including functions are all loaded into memory. 
If a particular function is not present for loading, wouldn't that be a 
fatal error?

So the long and short of it is, are these options useful to filter out 
unused class members or not?

Thanks as always,

Shriramana Sharma.
