From: gumbold <gumbold@bonbon.net>
Subject: data structure question
Date: Sun, 15 May 2005 12:32:04 +0300
Message-ID: <42871714.5060007@bonbon.net>
Reply-To: gumbold@bonbon.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi

why somebody wants to write such thing
struct abc {
    __u16 a;
    __u16 b;
    char abc[0];
} __attribute__((packed));
Specialy for zerod array of chars.
