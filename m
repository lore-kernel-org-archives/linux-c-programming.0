From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: setjmp/longjmp's enviroment
Date: Fri, 19 Nov 2004 15:45:39 +0000
Message-ID: <16798.5411.629187.776607@cerise.gclements.plus.com>
References: <20041119071438.64244.qmail@web53004.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041119071438.64244.qmail@web53004.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rinku rathore <rinku_ques@yahoo.com>
Cc: Vger Kernel <linux-c-programming@vger.kernel.org>


rinku rathore wrote:

> I wanted to know about "setjmp/longjmp",
> What I understood is setjmp will save the current
> environment of the program but cann't get much about
> hte enviroment can anybody give me detail about the
> environment.I get that it will save the fp,stack
> pointer, program counter what else it will store.

On x86, setjmp() stores the registers: EBX, ESI, EDI, EBP, ESP, EIP;
sigsetjmp() may additionally save the signal mask. It doesn't save the
FPU state.

Essentially, it saves the registers which need to be preserved across
a function call, so that a return from setjmp() via longjmp() appears
the same as a return from a normal function call (i.e. EAX, ECX and
EDX may contain garbage; the others must be preserved).

-- 
Glynn Clements <glynn@gclements.plus.com>
