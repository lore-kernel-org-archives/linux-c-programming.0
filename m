From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: g++ without typecast
Date: Fri, 11 Mar 2011 17:12:42 +0530
Message-ID: <AANLkTikM+tApusZWzpcVRXThYGsJdzek1BSA7DBG8yx=@mail.gmail.com>
References: <AANLkTi=GUjHMhXcWdaMbop+4f5Q9t549dOHECFvUAQtj@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=602bk1sohjJarpLs/KKZAtd7bl0NZSP36n185fuVBFo=;
        b=aZlIngESqCbHI1qCXQmdgklbhz7QCWG7Zk1AHCWdpAe4O/0t1Sc19z1Ho1LolRcqxe
         2yHXuQugO/5iKf/3XVO5SP0mcmaf5JWkkx64M/swpmFUBENaZTjiWN3L+O8F+gkIyG2j
         26wkYv4H8FClGfyWGzjZNkWK9r4Hd+rlTeGK0=
In-Reply-To: <AANLkTi=GUjHMhXcWdaMbop+4f5Q9t549dOHECFvUAQtj@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

This program will compile using gcc. But fails using g++ compiler ( we
need explicit type casting=A0 here).

Is there any flag or anyother way thru which we could compile this
using g++ ( without explicit type cast )

#include <stdio.h>
int main()
{
=A0=A0=A0=A0 unsigned int addr=3D0xffff;
=A0=A0=A0=A0 int *ptr;
=A0=A0=A0=A0 ptr=3Daddr;
=A0=A0=A0=A0 return 0;
}
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
