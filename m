From: kaushal <kaushal@rocsys.com>
Subject: Re: ftp without user intervention
Date: Fri, 19 Nov 2004 13:12:28 +0530
Message-ID: <1100850146.3528.3.camel@Kaushal>
References: <20041119070317.4376.qmail@web53009.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041119070317.4376.qmail@web53009.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rinku rathore <rinku_ques@yahoo.com>
Cc: Vger Kernel <linux-c-programming@vger.kernel.org>

hi rinku,
	AFAIK the kind of work that you want to do is called as "an automated
task".Although these tasks require user interaction still they can be
performed using the "expect" command.Infact it is a tool."man expect"
would give you some more clues.Hope that was your requirement.

cheers-
kaushal
rocsys technologies.

On Fri, 2004-11-19 at 12:33, rinku rathore wrote:
> Hello All,
>  
>  I wanted to transfer a file using ftp.But the problem
> is that I wanted to do it through a "c program",this c
> program should give the IP adrress to which we want to
> connect,now the same program give the user name And
> password to connect without the intervention of
> user(i,e., without manual entery of user name and
> password).
> Thanx in advace,if any body can help me,
> Regards ,
> Rinku Rathore.
> 
> 
> 
> 		
> __________________________________ 
> Do you Yahoo!? 
> The all-new My Yahoo! - Get yours free! 
> http://my.yahoo.com
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

