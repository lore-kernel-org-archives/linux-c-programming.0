From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: warning message on macro.
Date: Fri, 17 Aug 2012 12:22:35 +0530
Message-ID: <CAGZFCEE1bJ8zTDfxjnjhuy75Ly64gh38zhJOX491fUYWZROMcA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-newbie-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ndgBMO5GaOQWaAm85SbZrIm/d1f2we3tk1uOvyPeEXM=;
        b=DWg6poXGka88STODhDR6vQjqjbTiieab3nkLC/sr7J/KfQ89l+ysa0+mZQj0XYF4aZ
         bUGGoYAu1U2GDmVdKH+FWZCcA6KCT5ck086TpfQVb5ZBNCCsSPf/9u5rEtzgd7NKQ+8f
         IeZqA94zHop6Fkywrs6qRM7fJ2Th91+qd7WH0RPvhlC2nmBsw13wJvTUa0jDfKw5+Lhe
         wvdUw4NY4Kasvj+6Z8wWDWRUI9Q7p/aIG+RwJx8g/TOyCMzOFuEg90Y53yO2uIIw2osg
         jl9L+PmB6BJysROHbM7FnpnOFwOBDU6v2IQXypEG54BGPO4U4y9XgEZqoD8UTEJ8tblL
         DE4w==
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org, linux-newbie <linux-newbie@vger.kernel.org>

i defined a  variable in a driver Makefile as

DRIVER_NAME = e1000-kod


But when i compile , it shows following warning

<command-line>: warning: missing whitespace after the macro name

1. How can i suppress only this warning. ? I do need all other warnings .

Thanks,
Ratheesh
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
