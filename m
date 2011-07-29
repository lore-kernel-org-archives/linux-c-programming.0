From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: c++ code - not getting compiled !!!!!!!!!
Date: Fri, 29 Jul 2011 11:31:54 +0530
Message-ID: <CAGZFCEFvwrbscViED2ZEC3Yh9p4EstTLkxxfQD8FJZS03OpsLw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=k1uAsqqmhuD8kpfKyp8nThk9L6gjjkavfwdYjKeAROk=;
        b=nwYscdqy622isbLmwKFIGOuYQAEAX8eF0DwIdfDrAxnL2gBnNuuJFbzVUV68sow3iC
         UBkAxhG58wz9LkTgZkwy9K28JyZ5ez0LrsObff8aIOEJJg+K8sgMN7RU+tsRABQr7NtV
         4Q7lPFcNray1DCHgWRpsT6mdzzwoDKgvrKJH8=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

#include <iostream>

using namespace std;

int main()
{
    int i;

    cout << "Enter value of i " << endl;
    cin >> i;

    if (i < 5)
        goto Sri;

    int j = 6;
    cout << "j = " << j << endl;

    cout << "Outside Sri" << endl;
    return 0;

Sri:
    cout << "Inside Sri" << endl;
    return 0;
}
