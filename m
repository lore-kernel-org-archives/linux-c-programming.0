From: Ozgur Sefik Altunyurt <altunyurt@itu.edu.tr>
Subject: Re: how to the filename
Date: Thu, 14 Apr 2005 14:31:25 -0700
Message-ID: <425EE12D.90801@itu.edu.tr>
References: <1113472539.5952.62.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1113472539.5952.62.camel@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux prg <linux-c-programming@vger.kernel.org>

kaushal wrote:

>Hello all,
>
hi

>	How can I get the filename/pathname given the open file descriptor?Does
>fstat provide this feature internally?Can somebody give the code snippet
>for this.
>
sorry no code snippet :)

IINW a way of doing this may be by getting the process id (PID) of the 
program that opened the file and getting the relevant file name from the 
/proc/$(PID)/fd/$(FILE_DESCRIPTOR)
or in a more technical way you may use "current->files->fd[fd]" 
structure (please refer to asm/current.h and linux/sched.h )
which IMHO requires some more extra working on linux/{proc_fs.h, fs.h, 
sched.h}..
by the way i don't know exactly how you can get the filename from  the 
file descriptor :)
i'm just suggesting..

Ozgur

