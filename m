From: Ricardo Catalinas Jimenez <th1nk3r@server01.org>
Subject: -fomit-frame-pointer + -g
Date: Sun, 10 Oct 2004 13:07:17 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041010110717.GA3207@jehuty.server01.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

hi everybody,

my system is configures with the CHOST, CFLAGS & CXXFLAGS to use the useful
'-fomit-frame-pointer' flag. But when I want to debug one of my binaries, I
add manualy to the compilation process the '-g' flag.

My computer is an ia32 where the '-fomit-frame-pointer' is incompatible for
debuging.


I looked on the web but I didn't find if when I use both options what happend.

So when I do: gcc -o test test.c -g -fomit-frame-pointer

What happend, can I debug correctly?

If not, what I have to do? Should I disable the '-fomit-frame-pointer'
manually every time I want to debug?

Thanks in advande.
-- 
Ricardo Catalinas Jimenez    Madrid, Spain.
th1nk3r(at)server01(dot)org  citizen01@jabber.org 
My gpg public key at: http://www.server01.org/pubkey
