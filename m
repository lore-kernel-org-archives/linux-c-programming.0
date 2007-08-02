From: Gary Hughes-Fenchel <ghughesf@tibco.com>
Subject: Problem linking with -D_FILE_OFFSET_BITS=64
Date: Thu, 02 Aug 2007 11:05:40 -0500
Message-ID: <f8svck$g5d$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

I see this same problem on a 32 and 64 bit machine. When I build a 
dynamic library I see the following error message ("reallysmall" is the 
name of the executable my test program is attempting to build):

/usr/bin/ld: reallysmall: hidden symbol `stat64' in 
/usr/lib64/libc_nonshared.a(stat64.oS) is referenced by DSO

collect2: ld returned 1 exit status


When I build a static lib (using ar rv) I see no such problem. If I 
remove the -D_FILE_OFFSET_BITS=64 from the compilation the problem goes 
away. Does anyone know what is happening? I have a small test program I 
could send along if it would help.

(I apologize in advance if this is the wrong group to be sending this 
question to. There does not seem to be an active libc group around.)


Gary Hughes-Fenchel

