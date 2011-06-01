From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: macro to print filename
Date: Wed, 01 Jun 2011 21:08:51 +0200
Message-ID: <op.vwevg1xb3l0zgt@mnazarewicz-glaptop>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
 <op.vweraiul3l0zgt@mnazarewicz-glaptop>
 <BANLkTinEDc3DLbaFezBxL=QQ0Nie83+NAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:cc:subject:references
         :date:mime-version:content-transfer-encoding:from:message-id
         :in-reply-to:user-agent;
        bh=c8pil8nZ+8XO59nLnCCsGTlDN0BudvMPSsYDa7ktDaY=;
        b=oMBjH//YJNQIZdLbskA9e3HESCZNYcD3mddr7eYxUrai1eQG5vqYWx2AQXljWxE/PC
         6HmWC6f7xTeiOZz1Ab2iUgEBSQfjYXU1N0+J8IYzJmKEMjn+Nq6ZcTIBLNblkrar+A6x
         FIoCdjLkPyFpzENfyzUr//viwfqwvcO953MZY=
In-Reply-To: <BANLkTinEDc3DLbaFezBxL=QQ0Nie83+NAQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Zhongye Jia <jia.zhongye@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, 01 Jun 2011 20:45:06 +0200, Zhongye Jia <jia.zhongye@gmail.com>  
wrote:
> I do not think this can be done in *compiling* time, neither macro in
> c nor template in c++, so would you be so kind to offer the solution
> by using template or just give  some tips? Since I'm not that good at
> c++ :)

I was thinking along the lines of:

template<unsigned offset>
struct _filename {
	static const char *const val = __FILE__[offset] == '/'
		? __FILE__ + offset + 1
		: _filename<offset-1>::val;
};

template<>
struct _filename<0> {
	static const char *const val = __FILE__;
};

static const char *const filename = _filename<sizeof(__FILE__) - 1>;

I'm a bit rusty so I dunno if that'll work in this format.

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz    (o o)
ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
