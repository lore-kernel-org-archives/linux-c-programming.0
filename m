From: "Mark Farnell" <mark.farnell@gmail.com>
Subject: using the correct tool to time my parallel program
Date: Sat, 9 Jun 2007 17:08:17 +1200
Message-ID: <aaf549e0706082208n4b5df24x544e0edcf43ef3dc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=KMAPCxqhV1+31HkvV45f/C22MZ1VmIFXpRbH/tvBYhNmJ4PIf7341mKidlODjUmgt5GcnwXsl1lYiL1+FLY8SSbLtOopi55Tfk13xqFfj0Gk6TBBYifz3ErN79uPkAJGns7kiKNaHnsWpYlBdz0ohiSntJnL3sJvYhtXJZwxa9k=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

I have a parallel program, which calls some message passing functions
which block.  Then I attempted to use times() (with struct tms) to
time the program.

the struct tms gives me the "program time" and the "system time" as
well as the child process time (if any).  However does it also include
the time spent when my program is blocked (i.e. network time).

This is important because although I use gprof to separate the CPU
time spent by my program vs libraries, when I calculate the total time
spent, I really need to include the time spent waiting for message
from network (network time).

Therefore is times() really appropriate for my purpose?  If not, what
other functions can I use instead? (such as gettimeofday?)

Thanks!

Mark
