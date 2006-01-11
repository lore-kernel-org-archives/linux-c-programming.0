From: =?ISO-8859-2?Q?Nikola_Vlahovi=E6?= <root.admin1@zg.t-com.hr>
Subject: Read from log file - daemon - how?
Date: Thu, 12 Jan 2006 00:23:37 +0100
Message-ID: <43C59379.4010907@zg.t-com.hr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

I would like to make daemon in C  for watching and processing log files 
(GPL of course :)))))
and I have some problems......

1) if I open some log file like /var/log/messages for read with fopen 
...how do I get new changes
    that are generated in time.....like new system messages or soemthing 
else......

2)if I open file for reading and don't append any kind of lock to that 
file (log is the file...) are there
   any implications....(problems for log-generating daemon or soemthing...)

3) what is prefered way , used functions , else.......to approach this 
problem......


my daemon would be used for creating large database of information on 
some kind of RD (like mysql)
from all kinds of log files, messages , httpd , mail and others.....and 
then processed and used for
creating automated defence policy methods based on this info , like 
creating IPTABLES entry for
host that is generating too much aggressive traffic like scanning, mail 
accout hacking , enumeration or
soemthing else.....

I intend to make such system for use in small or medium networks for 
automating defend procedure using
several hosts......

If one system detects attack and creates database entry and sends 
message , other system can use this info
and protect themselfs against attack , later database information can be 
used for creating attack statistics,
attack prediction, attacker habbits (usual times of attack and similar....)


tnx,
nikola.
