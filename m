From: "William N. Zanatta" <william@veritel.com.br>
Subject: select() and pipes
Date: Thu, 28 Nov 2002 12:48:46 -0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3DE62CCE.2070003@veritel.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org


   Hi,

   I'm writing a tiny program which gets its input from a pipe. It works 
with apache like in this example...

------ httpd.conf-------

   CustomLog "|/path/my/bin"

------ httpd.conf-------

   On apache2 it works pretty well but on 1.3 series I'm experiencing 
some problemas and one of them is the CPU Load. The program's main() 
used to live in a infinite loop making a fgets() and checking for data 
availability on the returned buffer.

   Well, guessing this is the main reason for the CPU Load, I started 
with select() to check for data availability and I've found that the 
couple select() and the pipe as stdin will always return a ready to read 
status even if there's no data to be read.

   How does it work internally? How could I minimize the cpu load? 
Should  I use named pipes instead and tell apache to throw logs there?

   Thanks,

william

