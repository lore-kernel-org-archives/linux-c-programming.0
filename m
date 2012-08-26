From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: "reboot" detection ...
Date: Sun, 26 Aug 2012 15:34:03 +0530
Message-ID: <CAGZFCEFLx9nu4Dcm2iX5bTC+R5GcF63Kp+TW4XUvg8EcGoM5PQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-newbie-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=UQbtSFAuIcr9hoOpi+y5JxIB3BgVYcR9NR1hLj83VOI=;
        b=yNIHSji4CZ2TASX8n7ZzZQBt7xyY2oXCh9uOfwt8f14KrjvbU6x1jOrEvosqFz/UW7
         iy0upUfX4u92y9/C/gybuq7azV2nWzOavjq9SlPhpxt0lxSj3gEbYOlVKwIvIlE3WocW
         ejYAT07voSnG50iCU+SaKQY0Fe3Icd5fQzNyFn7qfrnhM4A05VjFTzuZaHjprW0pL+DR
         FrPShzhuHntp1MXvWJdd2rHYmJqwj393BTKsB9/Z+5HfkVMONhoiWsplEbseabW1LtmH
         SsasEDf0w+0XNxbAclYx6W914SyzRSfg8zLbZ0mCB5iXnMs6pUrhIFTTSezJO5MwGNoz
         2zgw==
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org, linux-newbie <linux-newbie@vger.kernel.org>

Hi,

Is there any way to find that the machine is rebooting.  ?

Say,  i issued  a "reboot" command in one of the Konsole shell. Is
there any way to detect this trigger in kernel space or in userspace ?
Any clue is really appreciated .

Thanks,
Ratheesh
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
