From: Tver Mit <Vukdev@mail.ru>
Subject: faults in dynamic libraries
Date: Thu, 13 Jun 2002 13:45:24 +0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1746252115.20020613134524@mail.ru>
Reply-To: Tver Mit <Vukdev@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all.
I write a programm that uses plugins (on dl* functions base). When plugin code is free of
bugs all is ok, but when plugin faults by any reason, my programm do so. I want my programm
to work even if plugin dies. I see two ways: 
1. handling signals 
2. run plugin in different thread or process
but then: 
in 1. what will be with resources, that plugin use ? 
in 2. it'll be about 15-20 plugins running - so there will be 15-20 processes. And how to synchronise them all?

Got any ideas, opinions?

________________
Good hunt.

 Tver                          mailto:Vukdev@mail.ru

