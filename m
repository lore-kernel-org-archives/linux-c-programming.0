From: "Venkatesh Joshi" <joshiv@cisco.com>
Subject: how to implement tail -n
Date: Mon, 24 Jan 2005 11:19:10 +0530
Message-ID: <009a01c501d8$6d504cf0$dc846840@apac.cisco.com>
References: <1106461572.1122.1.camel@KrishnaMohan> <20050123184550.B330@Imrashi.net.bd> <1106487378.1122.14.camel@KrishnaMohan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LinuxC <linux-c-programming@vger.kernel.org>

Hi,

I would like to know how to implement "tail -n" in C.

The "-n" option will be used to print the last n lines of a file -
rather than the default option of printing the last 10 lines of a file.

I wish to do this in a single pass. I can use lseek() to go to the end
of the file. How to traverse backwards from there ? Is there any
function that does this ?

thanks,
venkatesh
