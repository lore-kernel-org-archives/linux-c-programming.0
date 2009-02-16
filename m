From: Bryan Christ <bryan.christ@gmail.com>
Subject: running out of file descriptors
Date: Sun, 15 Feb 2009 23:48:57 -0600
Message-ID: <444391460902152148u11d4a973ka5a630898405d1c6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=kIWjqTsFh3NXBEWtnimLizD0Vkn2hR6ZAtvQComPNiw=;
        b=dqrm4vQ7415gH2ENTGB2Yux8CMPow6UnBB8f/LfTOsWPwywnUVIKvNNE4Q5OeVDVyI
         4Ma5PteoWfjkL2kWxV2vPAcl7rIjNTlAd3wKeXg8WuowiWx94Cp6mPTkA7/3MTamen48
         jnjUHVqJ2LwpJHyu+ykupGnd47kZFdbmbUXUU=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I am writing a multi-threaded application which services hundreds of
remote connections for data transfer.  Several instances of this
program are run simultaneously.  The problem is that whenever the
total number of active user connections (cumulative total of all open
sockets tallied from all process instances) reaches about 700 the
system appears to run out of file descriptors.  I have tried raising
the open files limit via "ulimit -n" and by using the setrlimit()
facility.  Neither of these seem to help.  I am currently having to
limit the number of processes running on the system to 2 instances
allowing no more than 256 connections each.  In this configuration the
sever will run for days without failure until I stop it.  If I try to
add a third process or restart one of the process with a higher
connection limit, bad things will start happening at about 700 open
sockets.

Thanks in advance to anyone who can help.

-- 
Bryan
<><
