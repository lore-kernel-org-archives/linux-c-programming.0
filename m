From: David Wuertele <dave-gnus@bfnet.com>
Subject: Why does linking a.so with b.so require execs to be linked both -la
 and -lb?
Date: Mon, 11 Aug 2003 14:02:48 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <m3k79jj4av.fsf@bfnet.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

#  I'm creating a shared library like this:
libDaveA.so: $(LIB_OBJECTS)
	$(CXX) -shared -ldl -rdynamic -o $@ $^ -lDaveB -lDaveC -lDaveD -lDaveE

#  And I have some executables that use the shared lib:
daveprog: daveprog.cpp
	$(CXX) -o $@ $^ -lDaveA

The executable doesn't use any of the functions from libDaveB.so,
libDaveC.so, libDaveD.so, or libDaveE.so.  It only uses functions from
libDaveA.so.  But when I compile with the above makefile, gcc
complains:

  /usr/tools/lib/gcc-lib/mipsel-linux/2.96/../../../../mipsel-linux/bin/ld: warning: libDaveB.so.0, needed by /usr/local/lib/libDaveA.so, not found (try using -rpath or -rpath-link)

Why is that?  Why should daveprog, which never uses any functionality
AT ALL from libDaveB.so, have to link to it?

Dave

