From: yuyichao-mit <yuyichao@mit.edu>
Subject: extra slash in current path
Date: Thu, 23 Jun 2011 09:14:18 -0400
Message-ID: <BANLkTi=y1roManmZGMLBXSFbBVqK_KqDZg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:from:date
         :x-google-sender-auth:message-id:subject:to:content-type;
        bh=BTfWBojZjPO5fsPb3Oq7ojGEhChbb0ebAgZjSFX/Y1E=;
        b=Bjvwm0NQ4SwlHmBr/IHN5TXG1+kM5M+vSm2bSmuDeiePCmDUbwZOvK6xfLPAOSo/qy
         UC3g/6kzguuHCFKueL9pAD+if8C3SI2s90wX4klgzmwv2SZwMgeELmKaU6tqNGI43lwb
         eDTO6lDfiREQ+lraZLA3g4fYnKgkSpgUdttGY=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

The problem is like this:

$ cd /
$ pwd
/

$ cd /
$ pwd
//

$ cd ///
$ pwd
/

Why can there be a extra slash (and exactly one) in current path? Is
this designed on purpose?
This is not really a big deal but I think it can confuse some program.

Thanks.

Yichao
