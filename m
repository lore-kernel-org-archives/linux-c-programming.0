From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: File size events.
Date: Mon, 13 Sep 2010 19:41:29 +0530
Message-ID: <AANLkTin9vEu5ouV6Qopk7U_zG8=Z_gwHebZsZxxUzjXh@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=C1Dy5HE7b87VHi29Mna+APrTGrsHBvS82etrtrG/Fb0=;
        b=nPs94kiCT6CZTzHUWXhDXx6+kiVhn54Yv50Q6xhMjTMuQYqdIzogLOW3BnI9bjSS4R
         Qb64hZVb0BKCNzPvWsnInFrrm3oFU6VkhjFhpw/v1+VoflStCoOCdq2ddPrFu3VIHT6Z
         N7KEwW7Mkqe+211DfAOrlOZJl1s2RyDO4dNF0=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

I have an application which keep on writing to one file /tmp/rat.txt.
I would like to handle an event when the file size exceed 20kb . How
to get this event ? Is there an event chain , i could register with ?
is there any other easy mechanism ?
