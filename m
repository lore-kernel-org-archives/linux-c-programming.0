From: ronkhu <ronkhu@ntsp.nec.co.jp>
Subject: Re: ipaddress from hostname
Date: Mon, 02 Jun 2003 08:33:18 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3EDA9B4E.3090403@hq.ntsp.nec.co.jp>
References: <EF836A380096D511AD9000B0D021B527013AD2E1@narmada.techmas.hcltech.com> <001a01c3236e$6249bc00$ed64a8c0@descartes> <000c01c32693$4d336e10$ed64a8c0@descartes> <002801c32759$5c6c9b60$a885bc3e@alanmari> <007901c32882$f08148d0$ed64a8c0@descartes>
Reply-To: ronkhu@ntsp.nec.co.jp
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

    #include <netdb.h>
    struct hostent *gethostbyname(const char *name);

    struct hostent {
        char    *h_name;
        char    **h_aliases;
        int     h_addrtype;
        int     h_length;
        char    **h_addr_list;
    };


 


