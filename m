From: "Suma Choudhary" <sumac@myw.ltindia.com>
Subject: fork + signal
Date: Thu, 28 Jul 2005 19:21:21 +0530
Message-ID: <s2e93048.003@EMAIL>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hi all
I have this doubt of what happens when a process is still on the way of forking(+ maybe exec further) a child and there comes a sigchld signal.
(Of course assuming that theres a signal handler for the sigchld signal.)

hopeful of getting an answer
regards
suma
