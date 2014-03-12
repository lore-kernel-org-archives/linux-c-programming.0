From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: ASLR and -fpic
Date: Wed, 12 Mar 2014 16:17:29 +0530
Message-ID: <CAGZFCEE3+2yXqKDSAvx-9s=P-15KYGjYJpEa+mNXT9wnzc9sJQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=g5DyDopVEC8RarOxknSxXYLfMIfQqdESeJ2mnd93Hfc=;
        b=m05iHrUy+TFDps58zd6EsYsNNyM7pVSd9eVvd0XoU1e7Mr3WLxbwuEzSYt7Fqw4KPF
         ADEVuVU+khtgCPZd3mCR2SFCCk1OGgU/IPyytcbZlQj36qgSMlr8jZPtt66IfodYwNzE
         E8rOCLMvpzDQKRbG83YGuCGuRqxJKoLy7MKQ32VazDeWn//2L+skK3kyfXa8wbb1/WLJ
         zFbaK90kAzJer/E0moTGi309isnyycSt3is4l1flW6KIoE03jtmrWW44NpK2qyzSW+lh
         EMj4TKEFsWxJKL5CGLfAOIn1kp0hH+EhThXi6GOuVn/cPWK2esioXtC4gfiFjqurhBSR
         Zf3g==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

If we need ASLR  feature, should we compile executable with -fpic ?






-Ratheesh
