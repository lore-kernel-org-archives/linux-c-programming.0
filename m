From: Daniel Hilst Selli <danielhilst@gmail.com>
Subject: Show application performance/errors from pseudo file
Date: Thu, 16 Oct 2014 16:50:04 -0300
Message-ID: <5440216C.3010207@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=gYQ077BPWD9OBgBSKu0RVSa+88BUmFhFO6syVPzijEI=;
        b=XFTzgYGvIO8CNskZks0EgZnk577z5K+H47KLVfiyv3LLTyhScZnpeWDRSuQjWSPzan
         1a7CoiCLw32HrDeWLhNl+AdYVfnNdwgw8L/A7aPXOWyBByb0fp2jMwodizWktx93emqF
         IEbcss9OXXeX3+ck1UODeIvGEZvFxJ1fK28x9NNy7vfhBCBRCBg1jVso6TN0Kt6c1K5W
         lS68bi7AUxOgsHHgcx3c/En8qVGXAlPOZbTal4ORutBGIx6xK3RBnPKXxAS3Fz3E/fJB
         OF8suto1axB7uIEaV2nfxx5psDoprOBhqR0sQfMUGFn9sEQvdipS5FreWYAJ6tNMef7v
         SO+A==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

I'm writing a new application and would be nice to have a pseudo file showing its status, just the way that procfs does with kernel.
I'm looking for sugestions, I want to `cat' files contents and have something similar to /proc/meminfo

First I think using named pipes, but, AFAIK, pipes would retain data writed until someone read it, what I thought is a kind of read
hook that only show data when asked for. Here are a few requisites,

- Don't retain data
- Don't generate disk I/O
- Vanish when application stops
- Work with a simple cat or something similar..

With that in mind I think about using unix domain sockets.. it seems to fit all requisites, for
the fourth requisite I could use netcat, that is almost cat,

Cheers
