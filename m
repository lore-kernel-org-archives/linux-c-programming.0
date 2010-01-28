From: Randi Botse <nightdecoder@gmail.com>
Subject: function cast?
Date: Thu, 28 Jan 2010 13:09:57 +0700
Message-ID: <34e1241d1001272209j3c5ae625seb555dbc5889d8a2@mail.gmail.com>
References: <34e1241d1001272205y32e92727pab9ee3cf310dcbc7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=+FjWsHvMJubc/95mHF5b/y1iBoWumCxZS55eOSoWps4=;
        b=VQ0a+f8xEDHxjBnVWfJu5kNyoBrMsXjUQIAdmbGebXR9B2XGv8inuhjqYDvYT0zfU/
         ocjcId2mKua+o59p26XA7KYbLH+agaUWqH/U4CzA+uFWOWRTWWlbifiYkQ7ts6DrdF2e
         NRSDqcA/cx8d5Afx7FJuZECg2urPi8zfUoQmM=
In-Reply-To: <34e1241d1001272205y32e92727pab9ee3cf310dcbc7@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

(sorry for my first uncomplete email, please abandon the first mail)

Hi All,

Sometimes i see codes are written like this:

(void) printf(fmt);

- or -

(void) close(fd);

What these means? i think it is not necessary to put that 'void' on a
statement, or it just like when we cast a data type like:

double d = 93.43;
int i = (int) d;

but why those function need to be casted in a 'void' ?

Thanks,
