From: jnf <xjnfx@doityourself.com>
Subject: Re: faults in dynamic libraries
Date: Sun, 16 Jun 2002 03:50:11 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020616105011.E5FAD3ED3@sitemail.everyone.net>
Reply-To: xjnfx@doityourself.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>, Tver Mit <Vukdev@mail.ru>
Cc: linux-c-programming@vger.kernel.org

not much better, but if one created a plugin manager type process that dealt with them all, it would keep the main process from dying if a plugin died? 

--- Glynn Clements <glynn.clements@virgin.net> wrote:
>
>Tver Mit wrote:
>
>> I write a programm that uses plugins (on dl* functions base). When plugin code is free of
>> bugs all is ok, but when plugin faults by any reason, my programm do so. I want my programm
>> to work even if plugin dies. I see two ways: 
>> 1. handling signals 
>> 2. run plugin in different thread or process
>> but then: 
>> in 1. what will be with resources, that plugin use ? 
>> in 2. it'll be about 15-20 plugins running - so there will be 15-20 processes. And how to synchronise them all?
>> 
>> Got any ideas, opinions?
>
>If a plugin shares its address space with the main program, a bug can
>corrupt that address space, killing the main program.
>
>Running plugins in a separate process is the only reliable mechanism,
>but it probably isn't practical. Even then, a plugin may still be able
>to interfere with the main process if they share system resources such
>as file descriptors.
>
>-- 
>Glynn Clements <glynn.clements@virgin.net>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

_____________________________________________________________
Sign up for FREE email from DoItYourself.com at http://doityourself.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
