From: jnf <xjnfx@doityourself.com>
Subject: this is abnormal, right?
Date: Tue, 16 Jul 2002 01:14:20 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020716081420.82CE836F9@sitemail.everyone.net>
Reply-To: xjnfx@doityourself.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hi, me again- ive got a question, i have this program ive been working on, ive hooked a function it calls (_exit()), so that it sets the stack frame to my liking, and continues execution at what would be the epilogue in main for exit() (addl $0x10, %esp, leave, ret), now sitting past ebp is the address of my liking, which happens to the top (?bottom?) of the stack, or the begining of my code (or what would be my code), currently where control should be handed to (and is) is filled with 0x41's, now shouldnt the program crash here? it keeps chugging along sending my cpu usage to 100% and crashing the box, if i go into gdb and set a breeak point where it starts executing (or beyond [0xbffff5e0 || >]) it gets there, no matter where it is, this is abnormal, right?


_____________________________________________________________
Sign up for FREE email from DoItYourself.com at http://doityourself.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
