From: "Anshuman S. Rawat" <asr@cs.columbia.edu>
Subject: array size 1 ?
Date: Tue, 20 Jul 2004 12:47:27 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <002601c46e79$3da5f100$d3113b80@Viper>
References: <40EF3BCD.7080808@comcast.net> <40F45DEF.8060307@techsource.com> <40F475FC.9090202@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,
What does an array of size 1 mean? or maybe I might be putting it wrong, so
here's the declaration -

struct option_state {
    int refcnt;
    int universe_count;
    int site_universe;
    int site_code_min;
    VOIDPTR universes[1];
};

(code from ISC DHCP sources includes/dhcpd.h)

What does universes[1] mean here?

Thanks.
-Anshu


