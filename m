From: "qhwang" <qhwang@ieeta.pt>
Subject: Re: out of memory
Date: Wed, 8 Oct 2003 17:31:17 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <00a301c38db9$997edc40$70ab88c1@ieeta.pt>
References: <31E38B53D182D51195FA00508BE3A33402CE4C9B@zwnbc004.cala.nortel.com> <008901c38dad$e7ba22e0$70ab88c1@ieeta.pt> <3F842BC0.6070503@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ronkhu@ntsp.nec.co.jp
Cc: linux-c-programming@vger.kernel.org

> hmmm... how about making use of software tools? like gdb? how about
> other profilers?
> r u sure memory storage had been properly deallocated within emhht?

I have already used gdb for debugging but the problem is still there. In the
function emhht, there are 8 2D pointers to structure allocated and released.
Seven structures have two double type members, 1 has four double type
members. The factual sizes of pointers are 32x32. My computer reports that
the double type is 8 bytes. So, bascially the amount of memory each time
needed is (7*8*2+8*4)*32*32=144 KB. If there structure are not released,
there should be a big mess. But they are really released in my program. And
there is no reportedly illegal memory operation when I set MALLOC_CHECK_=1
for checking.

QingHua

