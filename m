From: Ivan Deras <ideras@uv.unitec.edu>
Subject: Re: Debugging a Process ...
Date: Mon, 28 Oct 2002 04:14:18 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3DBD0DFA.8000107@uv.unitec.edu>
References: <3DB86A25.5000109@uv.unitec.edu> <20021026074421.GA328@cam.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3DB86A25.5000109@uv.unitec.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steven Smith <sos22@cam.ac.uk>
Cc: linux-c-programming@vger.kernel.org

This is very helpful for me ... Thanks ...

Steven Smith wrote:

>>I want to know how to debug a process in Linux, i know that in Windows i 
>>can use Windows-API to attach a debugger process to the debugged 
>>process, but in Linux i don't know ...
>>    
>>
>If you want to attach an existing debugger, look at the documentation
>for that debugger (in gdb, it's ``gdb <program_name> <pid of program>'').
>If you're thinking of writing your own, have a look at man ptrace.
>This isn't the clearest of documents, so you may want to have a look
>at the source to a few programs which use it, like gdb, strace, or
>ltrace, before starting on your own.
>
>Steven Smith,
>sos22@cam.ac.uk.
>  
>

