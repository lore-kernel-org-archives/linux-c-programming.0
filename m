From: "nomit kalidhar" <nomit_kalidhar@infosys.com>
Subject: using sh in execl command in C
Date: Mon, 6 Jan 2003 12:08:55 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <426C1E9EBA27D411839000D0B74752F80562C4B3@punmsg02.ad.infosys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hello,

 

I have the following snippet in C

 

Main()

{

 

            

            execl("/usr/bin/sh","Name","-c","ls",NULL);

 

}

 


in the execl instead of "Name" I can specify any thing it does not affect the program. I wanted to what is the field where the "Name" is used for.

 

 

Regards

Nomit
