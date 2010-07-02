From: "Hicham Mouline" <hicham@mouline.org>
Subject: dlopen(3) many threads global variable
Date: Fri, 2 Jul 2010 18:14:08 +0100
Message-ID: <i0l6p0$2g2$1@dough.gmane.org>
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello,

There is a .so shared dynamic library the main source file of which contains 
a global variable.

In my main funtion, I call dlopen() on the same .so file from 16 different 
threads. I do nothing to ensure the call is not done at the same time.

Very roughly speaking (and please can you provide precision if possible), 
the executable code of the .so file is loaded into the main process virtual 
memory after the dlopen has succeeded. (Note the main binary is not linked 
against the .so file)

Will there be 16 copies of the executable code from the .so file in the 
process?

IN particular, will there be 16 copies of the global variable?

Regards, 



