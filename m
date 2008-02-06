From: "Manning, Gary L" <gary.l.manning@intel.com>
Subject: RE: sprintf with mips
Date: Wed, 6 Feb 2008 11:45:55 -0800
Message-ID: <012863478A62344593C56CC9991EAC48014B6E3B@fmsmsx417.amr.corp.intel.com>
References: <20080206191600.243670@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <20080206191600.243670@gmx.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Stalp <christian.stalp@gmx.de>, linux-c-programming@vger.kernel.org

How is insertvalues defined?

Gary

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of
Christian Stalp
Sent: Wednesday, February 06, 2008 11:16 AM
To: linux-c-programming@vger.kernel.org
Subject: sprintf with mips

Hello out there,
are there any known problems with sprintf under mips? I spend some time
to make this code runnable:

sprintf(insertvalues, " %d , ' %s ' , %d ", counter, "192.168.1.1",
mytraffic->num_frames);
printf("input-string: %s\n", insertvalues);

This works properly under x86 but if I run this under mips, the string
is empty! Even if the variable 'counter' is uninitialized or
'mytraffic->num_frames' (which is not the case, I can see the values if
I dump them directly with printf) there should be at least that
IP-address-string which should be inserted! This is weired. Has anybody
an idea what the problem is here?

Thank you.

Gruss Christian

