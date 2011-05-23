From: Fawad Lateef <fawadlateef@gmail.com>
Subject: Hi, Needs suggestions for finding and fixing stack/memory corruption
 when calling a function
Date: Mon, 23 May 2011 15:41:22 +0100
Message-ID: <BANLkTimdU05oVtTdOr7TXdrUvc2NJ7KVyQ@mail.gmail.com>
References: <BANLkTingN-61wOzWKk7iwxFgo0W2YAzUQQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:content-type;
        bh=jJc/82AJC5DhNvZDEKC9k7/uaD4zvxWppCG3b71Qv6k=;
        b=PIJldcgLaAoJRfovZQK5aIjzSDbUpx+z3OrXF+ju2A+obgyYoM+E7XEWBL9nDtswp7
         dHB4EYnvow5bjHYyX1qSve2evPL8zQjMRo8e1R6Eyqal5p2HxbH4wPnjKH0QOz/seUEa
         c1xY+cJTaRh67uPJ6fVCapc79HruuSXOxxhSw=
In-Reply-To: <BANLkTingN-61wOzWKk7iwxFgo0W2YAzUQQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello,

I need some suggestions about how-to approach, find and fix a memory
corruption issue which is happening in a C/C++ very complex and large
code (code evolved over several years). Code is running on AT91SAM9260
(armv5l architecture; single processor with preemption enabled) and
completely in Linux user-space.

The problem is:

-- We are calling a function which has three integer arguments.
With-in that function 2nd and 3rd arguments always gets corrupted
while 1st argument is fine. Just before calling that function printing
arguments is fine.

Now it will be good if I can get some suggestions about whats
happening and how-to look into this problem. I am thinking that there
is some memory/stack corruption happening somewhere.

Thanks in advance.

-- Fawad Lateef
