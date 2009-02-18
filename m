From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: how to specify multiple input files for "objcopy" command
Date: Wed, 18 Feb 2009 17:42:08 +0000
Message-ID: <18844.18544.222174.801370@cerise.gclements.plus.com>
References: <F5BA82141F7AA94885B9643C77EEA5F21043AF@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <F5BA82141F7AA94885B9643C77EEA5F21043AF@mail.esntechnologies.co.in>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Srinivas G." <srinivasg@esntechnologies.co.in>
Cc: linux-c-programming@vger.kernel.org


Srinivas G. wrote:

> I am able to create a elf32-i386 format output file with "objcopy"
> command by giving the binary file as input. The command is as follows.
> 
> # objcopy -I binary -O elf32-i386 -B i386 testing_file.cubin obj_out.o
> 
> 	Where testing_file.cubin is binary object file which is
> generated from nvcc compiler.
> 
> However, I am NOT able to generate the ONE output file from MULTIPLE
> input files. Could any one suggest me for specifying the multiple input
> files?
> 
> Is there any other command which does the same?

You can use "ld -r ..." to link multiple object files into one.

-- 
Glynn Clements <glynn@gclements.plus.com>
