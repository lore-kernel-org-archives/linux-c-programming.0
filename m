From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: String assignement
Date: Wed, 26 Jan 2005 00:23:37 +0800
Message-ID: <41F67289.8020602@hq.ntsp.nec.co.jp>
References: <200501251604.42747.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200501251604.42747.hitoc_mail@yahoo.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: HIToC <hitoc_mail@yahoo.it>
Cc: linux-c-programming@vger.kernel.org

Hi!

I dont know much about c++ but after playing around with ur code,
i discovered that u gave the assign() method a wrong value for the 
second parameter...
why dont u try   "ed-bg+1" ??
(remove the '-1' if u like)

i think the second parameter is count or len... not the end index

-Ron

HIToC wrote:

>Hello all!
>
>I have a string CMD_LN that may contain a substring within angle brackets.
>I would like to assign another string IN_BRACKETS with the substring that is
>contained within the angle brackets of CMD_LN if it is present.
>
>I have written this code that should work:
>
>
>// A_brack.cpp
>
>#include <iostream>
>#include <string>
>
>int main(int argc, char* argv[])
>{
>	string			cmd_ln, in_brackets;
>	string::size_type	bg, ed;
>
>	cmd_ln = "Hello <all>, hello world!\n";
>
>	bg = cmd_ln.find('<');
>	ed = cmd_ln.find('>', bg);
>	if(bg != ed != string::npos) in_brackets.assign(cmd_ln, bg, ed);
>
>	cout	<<"Starting string:\t" <<cmd_ln <<'\n'
>		<<"Angle-brackets string:\t" <<in_brackets <<'\n'
>		<<"bg:\t" <<bg <<"\ned:\t" <<ed <<'\n'
>		<<cmd_ln[bg] <<' ' <<cmd_ln[ed] <<'\n';
>
>	return	0;
>}
>
>
>The output should be:
>Starting string:	Hello <all>, hello world!
>
>Angle-brackets string:	<all>
>bg:	6
>ed:	10
>< >
>
>
>But...it is not; this is the output of the program:
>
>Starting string:	Hello <all>, hello world!
>
>Angle-brackets string:	<all>, hel
>bg:	6
>ed:	10
>< >
>
>
>
>
>
>Thanks!
>
>  
>

