From: Krishna Mohan <gkmohan@rocsys.com>
Subject: pointer initialization of string constant
Date: 23 Jan 2005 11:56:11 +0530
Message-ID: <1106461572.1122.1.camel@KrishnaMohan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LinuxC <linux-c-programming@vger.kernel.org>

Dear All, 
Plz see the following code. It gives segmentation fault. ofcourse, it's
right as char *ptr = "abc" sets pointer to the address of the "abc" 
string (which may be stored in read-only memory and thus unchangeable).
My doubt : when i run gdb and execute p ptr either after or before
printf, pbc has been displayed. I'm getting segmentation fault only at
the end, it seems, because when i run ./a.out  "pbc is not displayed"
but prompted segmentation fault error. why is it so? How does
segmentation fault raises, though pointer-pointing contents has been
changed & even displayed using gdb. Will U plz explain in detail
(internals).

main()
{
        char *ptr = "abc";
        ptr[0] = 'p';
        printf("%s\n",ptr);
}

Thanx in advance. 
Krishna Mohan

