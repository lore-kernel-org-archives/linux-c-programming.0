From: =?UTF-8?B?SnVsaWFuIFRob23DqQ==?= <frostisch@yahoo.de>
Subject: Descriptor Passing without unix domain sockets or streams ?
Date: Mon, 19 Apr 2010 21:30:16 +0200
Message-ID: <4BCCAF48.3060809@yahoo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s1024; t=1271705337; bh=FLvWkvTf6Iq+Xb8PyvyTAsxKJ8GUWX46Q6+FZbgFe3I=; h=Received:X-Yahoo-SMTP:X-YMail-OSG:X-Yahoo-Newman-Property:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:X-Enigmail-Version:Content-Type:Content-Transfer-Encoding; b=eoT9Jbd/urPzXKCxzDzITNUU8kQur/4W2inmONMuq0jBIjSAGtFfuwQA+tSuaK5tdOqoYi4ydFXZStPL2z7ullf0dc2Ukr1xnbJ6XJZrGbjh3BhUq1SVc1KPa21r5WUsdRATnUBSZl6ogTtiSChnNewhnAgfUfFBp4dfGFo9pUU=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: linux-c-programming@vger.kernel.org

Hello Mailing list,

i have a problem passing a file descriptor from one process to another.

I have two processes A and B. Both are running in different network and
filesystem namespaces, so it is impossible to use unix domain sockets o=
r
net sockets to pass a file descriptor from process A to process B.

The usage of STREAMS is also impossible, as you can see in
	http://fixunix.com/unix/84093-streams-pipes-ioctl-i_sendfd.html

[quotation begin]
	Linux doesn't have STREAMS, which are the System V way
	of doing this task. ...
[quotation end]

Are there additional possibilities for file descriptor passing like
using a named pipe or something like that or does anybody know
a good workaround for this problem ?

Thank you very much !!
  Julian Thom=C3=A9

	=09
___________________________________________________________=20
Telefonate ohne weitere Kosten vom PC zum PC: http://messenger.yahoo.de
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
