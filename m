From: Florian Lindner <mailinglists@xgm.de>
Subject: Correct handling of signal
Date: Thu, 20 Aug 2015 10:14:22 +0200
Message-ID: <mr428v$ct2$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,

I'm developing a scientific application that can be used standalone as well 
as a library.

We use connection files to exchange information about socket based 
connection. Upon an unclean exit these connection linger around, causing 
trouble on the next startup.

I implemented a signal handler to clean up on unclean exit:

  signal(SIGSEGV, precice::utils::terminationSignalHandler);
  signal(SIGABRT, precice::utils::terminationSignalHandler);
  signal(SIGTERM, precice::utils::terminationSignalHandler);
  signal(SIGINT,  precice::utils::terminationSignalHandler);

void terminationSignalHandler(int signal) { 
// use boost filesystem to clean up 
}

Since I'm a rather high level programmer I haven't had much contact with 
signals, some questions:

1) Can I assume the application to be in a condition to actually do 
something when these signals are called? I have doubts especially about 
SIGSEGV regarding corruption of internal data structures.

2) Can multiple signal handler be installed for one signal? Or do subsequent 
invocations of signal(...) overwrite the handler for the resp. signal? If we 
are used as a library and host application has installed own signal handler, 
how can we omit overwriting them?

3) If there are multiple handler for one signal, can we remove our handler 
from the chain and re-emit the signal? Or should be just use std::exit or 
std::abort?

4) Is this the right way to go for the problem described? Any comments 
welcome!

Best Regards,
Florian


