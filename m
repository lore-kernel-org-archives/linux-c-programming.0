From: S <talk2sumit@gmail.com>
Subject: LKM function call on kernel function call?
Date: Tue, 5 Jul 2005 16:23:18 +0800
Message-ID: <1458d9610507050123124d6cb@mail.gmail.com>
Reply-To: S <talk2sumit@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux prg <linux-c-programming@vger.kernel.org>

Is it possible to code a loadable module having function1(), which
would be called, everytime a particular function of the kernel is
called? If not, atleast a way this could be done without re-compiling
the whole kernel and rebooting the system?

Example:

My LKM:
-------------

init_module() {
...
}

function1() {
...
}

cleanup_module() {
...
}


I want function1() to be called, everytime the function
ide_do_rw_disk() of ide-disk.c is called. I do not want to re-compile
the complete kernel to do this.

Thanks in advance,

Regards,
S
