From: Qiuyang Wu <Qiuyang.Wu@synopsys.com>
Subject: pread/pwrite bug on linux (RHEL)?
Date: Mon, 2 Mar 2009 13:10:46 -0800
Message-ID: <293BC70BB130E648A6631DB2F05B6E10019D6B21B3@US01WXMBX1.internal.synopsys.com>
References: <b9ec419f0903021120g62814b6embe8eeaf354f8b535@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-apps-owner@vger.kernel.org>
In-Reply-To: <b9ec419f0903021120g62814b6embe8eeaf354f8b535@mail.gmail.com>
Content-Language: en-US
Sender: linux-apps-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>, "linux-gcc@vger.kernel.org" <linux-gcc@vger.kernel.org>, "linux-apps@vger.kernel.org" <linux-apps@vger.kernel.org>
Cc: "qiuyang.wu@gmail.com" <qiuyang.wu@gmail.com>


Hi All,

Are there any known bugs with pread/pwrite on RHEL Linux when the disk partition is close to full?

Reduced a complex application fatal down to a simple program just opens a regular file and performs 1M sequential pwrite() of size 8KB blocks; at every 100th write, does a pread() to load the very first 8KB block and validate its content still matching what was originally written.

What I observed are the following when running on different machines and writing/reading to a disk partition nearly full with slightly more than 1GB of free space according to 'df' (the program is the only process accessing the disk) -

* Linux 2.6.9-55.ELsmp #1 SMP Fri Apr 20 16:36:54 EDT 2007 x86_64 x86_64 x86_64 GNU/Linux  (RHEL4)

BEHAVIOR: pwrite() works for many iterations, then pread() suddenly returns data of the requested size but filled with 0's, and strerror shows errno="No such file or directory", condition
      if(size_to_read != pread(fd, buf, size_to_read, ...)) ...
is not triggered and application has to check errno immediately after every call to pread.

CONCLUSION: serious bug, why does pread() return the expected size filled with 0? and why doesn't pwrite() fail earlier so application has a chance to bail out and stop pushing more data to the file?

* Linux 2.6.18-8.el5 #1 SMP Fri Jan 26 14:15:14 EST 2007 x86_64 x86_64 x86_64 GNU/Linux (RHEL5)

BEHAVIOR: pwrite() works for much fewer iterations, then pread() errors out again with errno="No such file or directory", and condition (size_to_read!=pread(...)) is asserted at the meantime, which is slightly better but application still very hard to recover.

CONCLUSION: Bug, still, pwrite() should error out earlier if not enough space to commit data, instead of fail on pread() as it's often catastrophic for application to handle.

Interestingly, with Suse Linux Enterprise which has an older kernel version, the behavior seems much more defensive and sane

* Linux 2.6.5-7.244-smp #1 SMP Mon Dec 12 18:32:25 UTC 2005 x86_64 x86_64 x86_64 GNU/Linux

BEHAVIOR: pwrite() works for a few iterations and errors out with errno="Disk quota exceeded" before pread() fails, application easily traps and handles without data lose.


Any pointers either to any known bugs or anything I might be missing are highly appreciated!

Thanks
Qiuyang

