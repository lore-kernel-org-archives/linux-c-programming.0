From: =?ks_c_5601-1987?B?wMzBvrnO?= <anapple.orange@gmail.com>
Subject: FW: [Lustre-discuss] Troubles compile lustre with --enable-quota
Date: Wed, 14 May 2008 23:31:47 +0900
Message-ID: <2039394F805246DAB0C6CD9A43FD6950@OrangeMini>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject:date:message-id:mime-version:content-type:content-transfer-encoding:x-mailer:x-mimeole:thread-index:from;
        bh=26C/t/Q++2JpainnOiQnfLCqsTfqwqLbz5jRavtt694=;
        b=Z90Y3nxuAXWf5eBIycrfPrrPjgPcjb9briB34GHk3f6GiKPPpcT3Kkds0zm1a1jfKfKJ66uZE8K81kXthKrC08fVQPY/otbdswUue/hBs5l33u4eX79eKO4B11jOmD99zngPZvU2iNCCStrz8D95l3d2SbBpNgWSRcnF38i30jU=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

 

-----Original Message-----
From: lustre-discuss-bounces@clusterfs.com [mailto:lustre-discuss-
bounces@clusterfs.com] On Behalf Of Johann Lombardi
Sent: Friday, September 21, 2007 11:01 PM
To: Patrick Winnertz
Cc: Lustre-discuss
Subject: Re: [Lustre-discuss] Troubles compile lustre with --enable-quota

On Fri, Sep 21, 2007 at 03:52:16PM +0200, Patrick Winnertz wrote:
> quota_ctl.c:236: error: 'Q_QUOTAON' undeclared (first use in this 
> function)
> quota_ctl.c:236: error: (Each undeclared identifier is reported only 
> once
> quota_ctl.c:236: error: for each function it appears in.)
> quota_ctl.c:236: error: 'Q_QUOTAOFF' undeclared (first use in this

Is CONFIG_QUOTA enabled in your kernel config file?

Johann

_______________________________________________
Lustre-discuss mailing list
Lustre-discuss@clusterfs.com
https://mail.clusterfs.com/mailman/listinfo/lustre-discuss

