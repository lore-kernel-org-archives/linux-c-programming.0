From: "Jose Luis Alarcon Sanchez" <jlalarcon@bunniwerks.zzn.com>
Subject: Re: How to execute a process in background by exec functions?
Date: Sun, 11 Apr 2004 19:23:07 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <595C8BEA66A041C4C9C3F0C81AAA92D5@jlalarcon.bunniwerks.zzn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jowillia@vt.edu
Cc: linux-c-programming@vger.kernel.org

---- Begin Original Message ----
The single quotes need to be double quotes 
so the call should look like 

execl("/bin/ls", "ls", 0);  
---- End Original Message ----


  Now it works fine!

  Thanks you very much, John. You're very kind.

  Regards.

  Jose.


http://www.lordofunix.org

Registered Linux User #213309.
Memories..... You are talking about memories. 
Rick Deckard. Blade Runner.


Get your Free E-mail at http://bunniwerks.zzn.com
___________________________________________________________
Get your own Web-based E-mail Service at http://www.zzn.com
