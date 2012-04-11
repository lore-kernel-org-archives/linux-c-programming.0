From: Bogdan Cristea <cristeab@gmail.com>
Subject: Re: close socket and TCP RST
Date: Wed, 11 Apr 2012 20:42:44 +0200
Message-ID: <5706767.2IZuFMGXdL@desktop>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com> <20357.34865.112925.808959@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=fZUIPBYtjzH7OinZuwmZavPFpqnAy2cLxB6MzBVM+hU=;
        b=W6CVNz0cMuQEiAAs3ArddHgYdoGNCB3BV3dWtIzu95WL+hWdUObnBd7BKib1CFTljw
         6CoyR0KSX3PTa7GIWtejqzX3VbYI1gX35ha1XMNZji7ttWIqxVyk3wBWNbJjl7dGImZK
         4YfZGLPA3NHUZj96ngDmLblWnyJKyTePdUFafFO1IkPr5XpgUCr1E8gblEKWrgLgK7kp
         n9KZSh47Gg+kwdArz43qi51P6g/rYESnWX7v4vnTs19LXewlAduyp834MALH8B62Ems3
         tgjeGlk3Aa4478To0MKPArjEd+Xb24TQroNAH9JV3Y3/fy2BRhci4og7/eW6mM+EXdbI
         o8fA==
In-Reply-To: <20357.34865.112925.808959@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

On Wednesday 11 April 2012 14:33:37 you wrote:
> In many cases, shutdown() is not necessary. Normally, one side knows
> whether the other side will send more data. E.g. for (non-pipelined)
> HTTP, the client sends a request, the server sends a response, then
> closes the connection.

It is exactly what he does, but the question is how to close the connection so 
that the client receives the last message. 
He is using for this:

 err = setsockopt(sockfd, SOL_SOCKET, SO_LINGER, &lin, sizeof(lin));

but for some reason it does not work as it should.
-- 
Bogdan 
