From: "Daniel." <danielhilst@gmail.com>
Subject: Hiding inter-library dependencies.
Date: Tue, 16 Aug 2016 11:14:16 -0300
Message-ID: <CAF3SDA7nNWNCrfY3MT8PfU6kU7E8JjLnPXcohJL896_o3hGWcQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=VV5ygzfcb/qz/1DTnlb4KQHr3+FBPr0tACUfg6mZ+e4=;
        b=ryP3sfKo7G0sEcw5XxIH6UV9z/OznalaXRc0YP72DJW2o88qB2/kc5e9bbpxDeWeiK
         DxhBHCv+MkeXE3qZstl/Xef0oJsYFg/dV0VuAtVmzWfysjOoM9lZl5Q+FsT6Bf5AmOlF
         mTfbw/u6R15gIWaQVCb0JoxdL3TmEtMRTFuY5ZzHLMyaSr0GsURR9Oy4f48tXKMTtLNO
         I9vVtlIWwcgwwCqdKLvXt4sfBezO8zNXvYS8rPll1BGO86Xre4I59S1wLCq8kBCiQO9C
         3AjzRAhxLZU2yTH1KUElzi3r22O2Mv1/qSIOExT9q8/gpPHBHV1msV1Zv+XIwXgVqQF1
         XUsw==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hi everybody!

Suppose that I have 3 shared files,
and two target machines M1 and M2.

libA.so, libB.so and libC.so.

libB.so is linked against libA.so only when compiled
to M1, but not in M2.

libC.so is aways linked against libB.so

So we have:

M1: libA.so <- libB.so <- libC.so <- executable.
M2:                   libB.so <- libC.so <-executable

I want to hide libA.so need while linking libB,
so that libC has not to pass -lA to linker depending
on machine. And to
hide libB and libA while linking to libC, so that
the user need to pass only -lC. Is that possible?

For example, linking in M1 would be:
cc -fPIC -shared -o libA.so libA.c
cc -fPIC -shared -o libB.so libB.c -lA
cc -fPIC -shared -o libC.so libC.c -lB (no need to -lA is the point here)
cc -o executable executable.c -lC (no need to -lB -lA is the point here)

And for M2 would be:
cc -fPIC -shared -o libB.so libB.c
cc -fPIC -shared -o libC.so -lB
cc -o executable executable.c -lC

In both cases (machines) the compilation of executable and libC
is done by the same command line.


Cheers,


-- 
"Do or do not. There is no try"
  Yoda Master
