From: <krishna.vamsi@wipro.com>
Subject: Anonymous structures
Date: Fri, 4 Aug 2006 20:58:37 +0530
Message-ID: <16D08C962563664288C2B2EC23C47FCB2364A0@BLR-SJP-MBX01.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,

Can I pass anonymous structures as function arguments, 

Struct A{ int a; int b};

F(struct A a)
{
}

Int main()
{
	f({a,b})
}

If I can how can I do that ?

-Vamsi
