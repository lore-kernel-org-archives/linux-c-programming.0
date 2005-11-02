From: fabio <fabio@crearium.com>
Subject: Misc debugging questions
Date: Wed, 02 Nov 2005 05:03:02 -0600
Message-ID: <43689CE6.9090301@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello,

I would like to know what represents the addresses found in objdump of a 
binary? Are these the address where the file will be eventually mapped 
to? or are these addresses the organization inside the binary file?

When a file is executed the address space assigned to it is equal from 
process to process, is this information contained in the binary file or 
it is generated/assigned by the operational system?

In general terms, what does a ELF executable file contain? anyone can 
point to a website with a graphical view of this format?

Thanks,



