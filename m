From: dalgoda@ix.netcom.com (Mike Castle)
Subject: Re: Why does linking a.so with b.so require execs to be linked both -la
 and -lb?
Date: Mon, 11 Aug 2003 16:50:21 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <tmml01xphg.ln2@thune.mrc-home.org>
References: <m3k79jj4av.fsf@bfnet.com>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

In article <m3k79jj4av.fsf@bfnet.com>,
David Wuertele  <dave-gnus@bfnet.com> wrote:
>Why is that?  Why should daveprog, which never uses any functionality
>AT ALL from libDaveB.so, have to link to it?

Consider what would happen if everything was using static libraries
instead.

In my opinion, it should be a consistent command line between static and
dynamic linking, with adding -static the only difference.

mrc
-- 
     Mike Castle      dalgoda@ix.netcom.com      www.netcom.com/~dalgoda/
    We are all of us living in the shadow of Manhattan.  -- Watchmen
fatal ("You are in a maze of twisty compiler features, all different"); -- gcc
