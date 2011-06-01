From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: macro to print filename
Date: Wed, 1 Jun 2011 21:37:42 +0530
Message-ID: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=RLO26YvADeMs/TLPRptxuXjzqX4C1e5q6dpNkIRFHQ8=;
        b=KNuJPxH6849+/lruLauqf2PHW5AhTJI/AmNensdV++2zHvCZZlIaU6v3GDxzkQc9d8
         Ota+fpCWtUTDmetDRAwod6e53lAI0nfNuSCRA3Lfr79u78RH5dlKyfj4d8GtebREMB5s
         P9F+o/qVVe5LT0K3f2peqpxLittsNiY/dWg1w=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

__FILE__ macro prints relative path name of the file. I need only
filename. How to extract this ?

I dont want to use any string library - since it includes more
Processing and needs to store the character array in executable. IS
there any method at preprocessing level to do this .
