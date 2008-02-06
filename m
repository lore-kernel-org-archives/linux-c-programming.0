From: "Christian Stalp" <christian.stalp@gmx.de>
Subject: sprintf with mips
Date: Wed, 06 Feb 2008 20:16:00 +0100
Message-ID: <20080206191600.243670@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

Hello out there,
are there any known problems with sprintf under mips? I spend some time to make this code runnable:

sprintf(insertvalues, " %d , ' %s ' , %d ", counter, "192.168.1.1", mytraffic->num_frames);
printf("input-string: %s\n", insertvalues);

This works properly under x86 but if I run this under mips, the string is empty! Even if the variable 'counter' is uninitialized or 'mytraffic->num_frames' (which is not the case, I can see the values if I dump them directly with printf) there should be at least that IP-address-string which should be inserted! This is weired. Has anybody an idea what the problem is here?

Thank you.

Gruss Christian


-- 
GMX FreeMail: 1 GB Postfach, 5 E-Mail-Adressen, 10 Free SMS.
Alle Infos und kostenlose Anmeldung: http://www.gmx.net/de/go/freemail
