From: Jimmy Pan <dspjmt@gmail.com>
Subject: How does atomic operation work on smp
Date: Thu, 8 Nov 2012 15:01:24 +0800
Message-ID: <20121108070121.GA7492@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=9SIIqf6ub8hM6T38/1cJv6Bgh/GJL4Dql30Zj15IS1A=;
        b=WGvh/eryt40Dx+oqb/7vC0usMMAqlR2eMX/9Mlxo2geS9V0ZWbHZ8X4po0c3uIWDBL
         7C7nVPKOOaRgCpN2RRCV8QTki9evx6iYF9pE/H8l7YDRM4n6ZEcTe6Ux8xqye7AGkw9+
         XIdbacI3N/jQo0NyVxNhhcdRbsvS618gq3DMrd3WfXjBDO1RZmPo49ud9MdeWnhafkWo
         +kwfty7WWfWqlDaJSmzwGUi+LfUNnjKoA/uxmwsL/5WhZmaN7XW9s1BAT7R5o0lBoA+U
         0nPJ9S1JV+vUwLzieTEm20wPJ0Plwpipa358LA9s5fk72WSIcvK0kksh5zgDmyXnjWTI
         m/Vg==
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-newbie@vger.kernel.org, linux-c-programming@vger.kernel.org

I understand how atomic operation work on unary core processors, I think it just disables the interrupt and dominate the cpu until it finished.
While, how do we implement this on multi processor computers?
Suppose cpu A is performing an atomic operation on variable a. At the same time, cpu B is also performing the operation on a. In such the result may be overwritten.
Of course we can use spinlocks, but on the atomic operation's behalf, how does it gurantee to prevent such case?
Can anyone explain the crux of it? Thanks.

Jimmy Pan
