From: "Luiz Fernando N. Capitulino" <lcapitulino@terra.com.br>
Subject: Re: array size 1 ?
Date: Tue, 20 Jul 2004 23:49:36 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040720234936.279eef15.lcapitulino@terra.com.br>
References: <40EF3BCD.7080808@comcast.net>
	<40F45DEF.8060307@techsource.com>
	<40F475FC.9090202@comcast.net>
	<002601c46e79$3da5f100$d3113b80@Viper>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002601c46e79$3da5f100$d3113b80@Viper>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Anshuman S. Rawat" <asr@cs.columbia.edu>
Cc: linux-c-programming@vger.kernel.org


 Hi Anshuman,

Em Tue, 20 Jul 2004 12:47:27 -0400
"Anshuman S. Rawat" <asr@cs.columbia.edu> screveu:

| Hi,
| What does an array of size 1 mean? or maybe I might be putting it wrong, so
| here's the declaration -
| 
| struct option_state {
|     int refcnt;
|     int universe_count;
|     int site_universe;
|     int site_code_min;
|     VOIDPTR universes[1];
| };
| 
| (code from ISC DHCP sources includes/dhcpd.h)
| 
| What does universes[1] mean here?

 I think is best to ask for the author, seems to me it is not usual.

-- 
Luiz Fernando
