From: HIToC <hitoc_mail@yahoo.it>
Subject: String assignement
Date: Tue, 25 Jan 2005 16:06:52 +0100
Message-ID: <200501251604.42747.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello all!

I have a string CMD_LN that may contain a substring within angle brackets.
I would like to assign another string IN_BRACKETS with the substring that is
contained within the angle brackets of CMD_LN if it is present.

I have written this code that should work:


// A_brack.cpp

#include <iostream>
#include <string>

int main(int argc, char* argv[])
{
	string			cmd_ln, in_brackets;
	string::size_type	bg, ed;

	cmd_ln = "Hello <all>, hello world!\n";

	bg = cmd_ln.find('<');
	ed = cmd_ln.find('>', bg);
	if(bg != ed != string::npos) in_brackets.assign(cmd_ln, bg, ed);

	cout	<<"Starting string:\t" <<cmd_ln <<'\n'
		<<"Angle-brackets string:\t" <<in_brackets <<'\n'
		<<"bg:\t" <<bg <<"\ned:\t" <<ed <<'\n'
		<<cmd_ln[bg] <<' ' <<cmd_ln[ed] <<'\n';

	return	0;
}


The output should be:
Starting string:	Hello <all>, hello world!

Angle-brackets string:	<all>
bg:	6
ed:	10
< >


But...it is not; this is the output of the program:

Starting string:	Hello <all>, hello world!

Angle-brackets string:	<all>, hel
bg:	6
ed:	10
< >





Thanks!

-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
