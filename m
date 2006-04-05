From: "openbsd shen" <openbsd.shen@gmail.com>
Subject: How can found a hiden module?
Date: Wed, 5 Apr 2006 11:32:54 +0800
Message-ID: <6ff3e7140604042032w66899cdfvaafbb96720e941d3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Use this codes:

int init_module() {
      if (module.next)
                module.next = module.next->next;
      ......

I can hide the next module use this code, but who can tell me how I
can found the hide module in system?
