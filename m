From: ranjith kannikara <ranjithkannikara@gmail.com>
Subject: Help to edit inode content
Date: Tue, 12 May 2009 21:13:21 +0530
Message-ID: <20aa8c370905120843k5399d7a0w853386d84f767010@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=KqxMkNel+kCYLTsA3Y7NW8q4FbHREaUZScVEEyoBl3Y=;
        b=ZX6pukXiI9BIojfK0pX9G7Fwvjh1CbyU9hJixCa2WZPcnbW5pUtPXaQy806KtyRehO
         qPGE5GCjDZBS0aGEow4kdADwr/gilxWcLIQjH8e0wLrCvJ2+ZNeU/59Bw/pqDb7v9Y6U
         bgPYByeX9IZA+Se6/VydQEbrrRmr7qjW7uAhE=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,
I am a computer science engineering student. We have started a project
to make an application to recover deleted files from an ext3
filesystem. For that we have a doubt . Can we edit the inode content?
ie the recovery will be robust if we could edit the inode contents and
give the pointer address manually or through a code. The inode is
being created in the kernel mode and is it possible to edit those
contents if the code is allowed to have the kernel mode permissions..?

Regards
Ranju..

-- 
http://www.ranjithkannikara.blogspot.com/
