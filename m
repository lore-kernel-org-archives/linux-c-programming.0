From: Nasir Hossain <nhossain@gawab.com>
Subject: pointer to function ??
Date: Thu, 20 May 2004 15:51:02 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40AC868E.5040408@gawab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Linux-C-Programming (E-mail)" <linux-c-programming@vger.kernel.org>

hi,

can someone explain this to me :

0:    using namespace ldm;

1:    struct cmd_parse_t {
2:        char flag;
3:        void (*taskfunc)(ldm::diskio& dev, int argc, char** argv);
4:        bool readonly;
5:    };

what does line 3 do ? is it a pointer to a function or something else ?


