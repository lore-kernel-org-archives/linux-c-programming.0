From: elathan@phys.uoa.gr
Subject: Re: mixing C/C++
Date: Tue, 25 Nov 2003 15:12:28 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1069765948.3fc3553ce0ef8@webmail.uoa.gr>
References: <20031124111050.GI1819@pcmag.gr> <200311242218.40158.steven_shaw@iprimus.com.au> <20031124175501.GA1022@velka.phys.uoa.gr> <200311251221.39488.steven_shaw@iprimus.com.au> <1069757381.3fc333c52bf2b@webmail.uoa.gr> <16323.16426.473841.162971@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16323.16426.473841.162971@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: Steven Shaw <steven_shaw@iprimus.com.au>, linux-c-programming@vger.kernel.org

Quoting Glynn Clements <glynn.clements@virgin.net>: 
> It works fine for me: 
[snipped] 
> 		wrap_foo_dump(f); 
> 		wrap_bar_dump2(f); 
> 	 
> 		return 0; 
> 	} 
 
Up to that point yes. But if you try to call dump3() (exactly with the code you 
have pasted) you wan't get "Taz Hello", but "Bar Hello". This strange behaviour 
will not happen, if you subistute the virtual methods with ordinary ones. 
 
Regards, 
Elias 
 
