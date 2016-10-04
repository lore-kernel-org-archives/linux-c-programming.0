From: =?UTF-8?Q?Marcin_G=c5=82ogowski?= <marcin.glogowski@interia.pl>
Subject: How to disable application run
Date: Tue, 4 Oct 2016 11:51:20 +0200
Message-ID: <88e789ba-91be-e2ac-3bf4-f771052be870@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1475574682;
        bh=rnFKfJ/CLNCitFIxeGoauZxpqnf1pun8kvkOYPi/oZA=;
        h=X-Interia-R:X-Interia-R-IP:X-Interia-R-Helo:To:From:Subject:
         Message-ID:Date:User-Agent:MIME-Version:Content-Type:
         Content-Transfer-Encoding:X-Interia-Antivirus;
        b=uvZHrKp+BWJlNs1aFwmCh8u2/ysUlYM/9NAVVUkphaCKhSICVmQC8Z4x7oKF3fDQ8
         D04g3L5TQYxwjlmqnPXXFgGByZBIS+h14lK+RkknqyJSIFi5lPZQ1palmxmDrp7YCQ
         dbaSBsIgSBZew/4LNnCCoQYqF7/m7ILtZ8MVv4WE=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello guys,
I have to create Linux based solution to prevent running applications 
from the blacklist.
How can I achieve this? Which part of the Linux kernel is needed to 
achieve this?
I think it would be nice to create block device which will store black 
and white list, but I have no idea what part
of the kernel is responsible for this functionality.
It is not possible to kill the application after run - I have to find 
nicer solution.
Thank you much, regards CiN
