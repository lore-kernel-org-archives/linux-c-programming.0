From: Seika van Olstroem <seivan@gmx.net>
Subject: Re: pointer to function ??
Date: Thu, 20 May 2004 14:00:05 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40AC9DC5.7080507@gmx.net>
References: <40AC868E.5040408@gawab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40AC868E.5040408@gawab.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nasir Hossain <nhossain@gawab.com>
Cc: linux-c-programming@vger.kernel.org

Nasir Hossain wrote:

> hi,
>
> can someone explain this to me :
>
> 0:    using namespace ldm;
>
> 1:    struct cmd_parse_t {
> 2:        char flag;
> 3:        void (*taskfunc)(ldm::diskio& dev, int argc, char** argv);
> 4:        bool readonly;
> 5:    };
>
> what does line 3 do ? is it a pointer to a function or something else ?

Exactly! It's a pointer to function.
Prototype looks like follow:

void taskfunc(ldm::diskio& dev, int argc, char** argv);

best regards,
SoV
