From: Mingliang <longapple@gmail.com>
Subject: Is there a way to force suspended process's memory to swap space?
Date: Tue, 14 Apr 2009 00:03:35 -0800
Message-ID: <56b13acf0904140103x52978583hdf00ba46d5fa3c73@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=h2fIQ422wjVQ4HAbktZBuOaLTYOR8ld5nqzC/AgwkFY=;
        b=VpPTw7IKi7I4OBMomwuJopGD5ziNc6zChIgaSgBjSSJ625a1pUOSu4LM5WDL+nYuRp
         tg/zuMvgTm4M8iYTzYVjAuUTrInThRxT+vqtNe1qJxMFa59s88o8G/8D+kr+0CgFh4XQ
         snxj+ZdW5GanMxIxMrM9u9XrOGImQUctO3yi8=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

For example, my process continuously consumes 30MB memory.
$ ps aux|grep job
joe      17941  0.0  0.3 33104 31096 pts/16  S    15:50   0:00 ./job 30
                                           ^^^^^^^

Now I stop it
$kill -STOP  17941
[1]+  Stopped                 ./job 30

$ ps aux|grep job
joe      17941  0.0  0.3 33104 31096 pts/16  T    15:50   0:00 ./job 30

So it doesn't consume CPU time any more, BUT is there also a way to
swap out the 30MB memory?
Can it be accomplished manually (some signal, maybe?) or is it only
the kernel who can make decision?

Any of your suggestion is much appreciated.

Regards,
Joe
