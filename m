From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: ftp without user intervention
Date: Fri, 19 Nov 2004 15:52:55 +0000
Message-ID: <16798.5847.865452.936957@cerise.gclements.plus.com>
References: <1100850146.3528.3.camel@Kaushal>
	<20041119074719.93363.qmail@web53001.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041119074719.93363.qmail@web53001.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rinku rathore <rinku_ques@yahoo.com>
Cc: kaushal <kaushal@rocsys.com>, linux-c-programming@vger.kernel.org


rinku rathore wrote:

> I tried to man expect but is is giving "No manual
> entry for expect".Can you help me more.

"expect" is a modified Tcl interpreter, which is specifically intended
for automating interactive tasks. It provides similar functionality to
the "chat" program, but is more powerful (as you have the Tcl language
available).

Both chat and expect allow you to write scripts where commands are
executed in response to receiving specific data.

The chat program is most commonly used to script dial-up PPP logins
(i.e. wait for the server to send a "Login:" prompt then send the
username in response, etc).

Expect was designed for more complex cases. One common use is to
script the "ftp" program.

-- 
Glynn Clements <glynn@gclements.plus.com>
