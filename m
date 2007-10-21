From: Shriramana Sharma <samjnaa@gmail.com>
Subject: threads and kernel
Date: Sun, 21 Oct 2007 18:51:58 +0530
Message-ID: <471B5276.9010800@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hello, my knowledgeable friends! :)

1.

As I understand it, the kernel is always running and whenever an app 
asks for a system resource the kernel does the needful. However, in my 
process tree I see no process named linux or kernel. I only see the init 
process at the root of the tree. Does the init process represent the kernel?

2.

When an app does a system call, would some form of IPC between the 
process of that app and the kernel process (assuming there is one) be 
involved?

3.

When an application uses a library, the app and the library are 
processed in DIFFERENT threads in which of the following cases:

1. the library is statically linked
2. the library is dynamically linked
3. the library is loaded using dlopen

My guess is "none of the above", am I right?

These are NOT homework questions! :)

Thanks, as always.

Shriramana Sharma.

