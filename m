From: "Daniel." <danielhilst@gmail.com>
Subject: Chaining signals
Date: Tue, 6 Sep 2016 15:35:06 -0300
Message-ID: <CAF3SDA5U-JgzWPMww=yNjXkPeaLOvrTSr8HjchyZdj-LFqdreg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=9Q6fnL13ialbft3x+UG3y1650lNKf8u55cmvzJOPamQ=;
        b=B2xyD5Q6sH7jlrGb/Ode/0su8WZHzfLSqCj2m1Uw9CrVpx8cmM4IDl1aHJImTJ2hRF
         WtLhoMeTqCMF6SwFyuUO++JAYO1T3xBXXfTAtMHXrOfaCJ6gCUEDBIrwJz540exIdfRU
         LtiKwCD1MGqraN2wFMuQe6qE2Q/7q50x569wq8voO4tqWe1GDF8ueW1Pv0gPa9yvpNzR
         WNdiWD/rjUnz6UneqjMLMtbRBmJJz1a9s64uN49dmlYZzasEJ/MZOMw6XP8hWX946Ecc
         RJfbDf0xZawgLivzD5qqbvmph+cBWa/zP8k15ZyjeMacK0t3oaXp4wiOl6cWNjKjSblc
         wJLw==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hi everybody.

I'm dealing with a library that may be used by JNI/Java code. That
library setup some signals. The problem is that the JVM set some
signals too.

If the JVM signal handlers are setted before my, I want to be sure
that they are called after my handler. I'm using sigaction() function,
passing a static struct sigaction to the third parameter and in my
handler I call oldsigaction.sa_sigaction(1th, 2th, 3th) where 1th 2th
and 3th are the parameters that my handler received? Is that right!?
Is that safe? Here is some sample code:

PS: Doesn't take the backtrace stuff too serious, remember is just an
example, focus on sigaction calling.

http://pastebin.com/ejmYM4T6

The other option is, if my handler is setted after JVM's handler, so
that I need to be sure that JVM will chain its signals to me. I'm
willing to use libjsig.so as said here:
http://www.oracle.com/technetwork/java/javase/signals-139944.html


-- 
"Do or do not. There is no try"
  Yoda Master
