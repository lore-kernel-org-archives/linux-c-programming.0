From: "Matthew Studley" <matthew.studley@uwe.ac.uk>
Subject: what causes SIGTERMs?
Date: Tue, 8 Jul 2003 14:17:55 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi All

I wonder whether you could help me?  I have a problem; I'm running an
application I've written in C under Slackware 7.1  Occasionally it receives
a SIGTERM.

* In what circumstances do processes get sent a SIGTERM?

* Am I correct that this is unlikely to be issued in response to a bug in my
code?

* How can I find which process is issuing the SIGTERM against my code?

* Are there any changes I can make to the execution environment / logging /
gcc compilation options to help me find out why this is happening?

If anybody can give me some ideas, or suggest directions to investigate, I'd
be hugely thankful!

Just as a bit of background; the platform is a robot on which I have
recently fitted some new hardware.  The SIGTERM problem started at roughly
the same time.  If I catch the SIGTERM, and do nothing apart from continue
my application... I then catch more SIGTERMs, followed by a SIGKILL!

regards

Matt

==============================================
Matthew Studley

The Intelligent Computer Systems Centre
Faculty of Computing, Engineering and Mathematical Sciences
Coldharbour Lane, Frenchay
BS16 1QY
United Kingdom



