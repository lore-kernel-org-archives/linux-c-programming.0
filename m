From: Christopher Quinn <cq@htec.demon.co.uk>
Subject: stack segment...
Date: Tue, 15 Oct 2002 21:10:53 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3DAC764D.3070807@htec.demon.co.uk>
References: <DDFD9B60F648D411AD670000F80822EA01C2707A@mail7.monmouth.army.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "'linux-c-programming@vger.kernel.org'" <linux-c-programming@vger.kernel.org>

can anyone say how to interogate the system for the top of the stack address?
asm/processor.h defines TASK_SIZE
and asm/page_offset.h  gives PAGE_OFFSET
which comes to 0xC0000000.
but i doubt i can portably use these.

thanks,
chris

