From: Massimiliano Cialdi <cialdi@firenze.net>
Subject: Re: const char * vs char[]
Date: Tue, 23 Mar 2004 15:19:02 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040323151902.000048da.cialdi@firenze.net>
References: <20040323130118.00005637.cialdi@firenze.net>
	<000701c410dc$fb457820$0c81640a@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000701c410dc$fb457820$0c81640a@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On Tue, 23 Mar 2004 10:44:36 -0300
"Mariano Moreyra" <moremari@aca.org.ar> wrote:

> I think that the problem is not a difference between "char*" and
> "char[]" The problem is that stampa is receiving a "char[]" and you
> are passing a"const char*" as the arg.
> The "qualifiers from pointer targer type" refers to the "const" part
> of the"const char*" declaration I belive.
> If you declare stampa like this:
> 
> void stampa(const char s[]);
> 
> you won't have this warning anymore.
so what is a synonym of char[]? Maybe "char (const *)"?

thanks
-- 
Massimiliano Cialdi
cialdi@firenze.net
m.cialdi@oksys.it
