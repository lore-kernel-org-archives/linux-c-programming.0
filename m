From: Wrazlov <wrazlov@gmx.net>
Subject: non-blocking server?
Date: Fri, 17 Jan 2003 22:31:31 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200301172219.14911.wrazlov@gmx.net>
Reply-To: wrazlov@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,
the last time I tried to write a server in C I had the problem that it had to 
wait for Bytes to arrive at the open port which blocked the process.
A solution would be, of course, threading of the server-process or using 
signals, but I want this code to be used in a windows-environment, too.
Is that possible? Does the standard-c-library provide some kind of signals or 
thread-programming for all systems?
   
  wrazlov
-- 
"What do you get if you multiply six by nine?"
