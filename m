From: leo mueller <llug.dan@googlemail.com>
Subject: ioctl() to get information of wlan mode (a/b/g/n) ?
Date: Fri, 18 Sep 2009 14:11:47 +0200
Message-ID: <c93f91ee0909180511k5bb4f2dcu4f3509dcd3281a66@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=OYNFY1rz4dn9TtvxO0Xn4GGKgRbOYmcA1u59399CUhU=;
        b=YIimNegK/jElrcaVPFliDQCVynt7WXsBtEWDv+8dkhD1Jl2KCfulFStMGqBQXpOmIh
         MzdWbSGN9gBjzBcpcT/Xqf6y2QySjL6cPSkJWlHrnNhXvgFPpZnyW1VuokrO6JfFYJ1I
         5Tre1oJrGNKES4fDrs0LCJw6rkUi1NBUq6zzw=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

hi all,

is there a possibility to determine in which wlan mode my card/driver
currently works?
like an ioctl()-call or sth... ? is it also possible to fetch wlan
statistics (rx/tx) via ioctl()?
if yes, which params are neccessary?

big thx & nice weekend
