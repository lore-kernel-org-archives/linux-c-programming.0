From: "Srinivas G." <srinivasg@esntechnologies.co.in>
Subject: how to specify multiple input files for "objcopy" command
Date: Wed, 18 Feb 2009 16:10:35 +0530
Message-ID: <F5BA82141F7AA94885B9643C77EEA5F21043AF@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org, linux-apps@vger.kernel.org
Cc: hjl@lucon.org

Dear All,

I am able to create a elf32-i386 format output file with "objcopy"
command by giving the binary file as input. The command is as follows.

# objcopy -I binary -O elf32-i386 -B i386 testing_file.cubin obj_out.o

	Where testing_file.cubin is binary object file which is
generated from nvcc compiler.

However, I am NOT able to generate the ONE output file from MULTIPLE
input files. Could any one suggest me for specifying the multiple input
files?

Is there any other command which does the same?

Thanks in advance.

With Regards,
Srinivas G
