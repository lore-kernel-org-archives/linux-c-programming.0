From: "William N. Zanatta" <william@veritel.com.br>
Subject: GCC and Memory Organization
Date: Tue, 09 Apr 2002 12:07:08 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3CB3039C.4070404@veritel.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "'linux-c-programming@vger.kernel.org'" <linux-c-programming@vger.kernel.org>

Hello brothers,

   I have a question on memory organization...
   In my Computer Architeture classes, I've learned something like that 
there are two ways to organize data in memory.
   The first one puts it in a linear mode like:

      +---------------+
12k  | z | z |   |   |
      |---------------|
8k   | y | y | z | z |
      |---------------|
4k   | x | x | x | y |
      +---------------+

   And the second way is a non-linear, a block mode like:

      +---------------+
12k  | z | z | z | z |
      |---------------|
8k   | y | y | y |   |
      |---------------|
4k   | x | x |   |   |
      +---------------+

   The second way should be faster than the first one for memory 
management, right?! That a kindda obviuos as it wouldn't be necessary to 
scan all the block to find the next entry. Also it can be expensive 
since the 4k block is allocated for only 2k of real data.

   My question is, how does GCC works with this? Does it have any switch 
for optimizing (or not) the code?? What's the default action???

   Thank you, keep it hard!

William Zanatta

