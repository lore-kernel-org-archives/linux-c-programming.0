From: "Daniel." <danielhilst@gmail.com>
Subject: Is defined() macro portable or GNU only?
Date: Wed, 30 Sep 2015 16:25:44 -0300
Message-ID: <CAF3SDA7TQOz9Vzk+iVzLn2SgxW22R-jARjJ+yzvYkSYXnzzM+A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=HYqCXf9ZWN4fdQkwEZDt9n6kbKTwV+frRzaC1snJabU=;
        b=XMdbZ7jgvBlLzKneWEK9cZiVZ3nJetDWn6hiqKGAwQQvrlTOtueuze82SpDWVVLEKQ
         /HrQ+8+LlFyqXmXPvnXNLMVNCPWguAOcYmplWlWaak4UNpwx+lbnzGEFM44Dcn7rbXJm
         TDPH6si2OwLNCgj6iT4FIeG9VdfsFtCnMrIMB6U68HgJS1M0bMnWNXRtw6QW+NCpw0B8
         6quUyLzAuGMWcr+foCGugryP+BZHSTYn/ZeVk1xbH0tsgETgrtO5PXZYBQPjGpwBTSxg
         sy42XphdNyq0Elukb2S7RZHtqEYuZH3I5GLn6xjNb5H1pqMSsJZlvCkcEjUFRR+6xNP6
         cPwA==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hi all,

I used to check definitions with #ifdef, but in cases where
multiple macros are checked I use #if defined(foo) && defined(bar).
Is this defined() check portable/standard? Or is some kind of
extension added by GCC?

Regards,
- dhs
-- 
"Do or do not. There is no try"
  Yoda Master
