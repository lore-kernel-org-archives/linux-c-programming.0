From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: memory address represented as a string
Date: Sun, 26 Jul 2009 13:36:38 +0530
Message-ID: <ea11fea30907260106j74614d49j2ece27b9c05d9a40@mail.gmail.com>
References: <2a46ebd60907260039g290268b7i3183ee785994b86@mail.gmail.com> 
	<f662f0210907260059l36076e16rb29f75640445bc7a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=+5e2HWsCLT1Mi7p10bvtkVNE2oKAea0YbKM/xu+fvO8=;
        b=vIuIcevupoPEbRZzuKsVaTST8vFZT3cKx5WkNlYOBQTTZU+DqXiKWqLrSg9baT53oe
         VqvqFH7uCmGxKM6tsTC3hIN0mJGzyR8yBT3iYqTKuqRcV5s/Vu7r6CVvBsHc7sUxzm4y
         Ifno1zfXpOnUdgoNgg/F5bX9v3xXiSRQMn6Tk=
In-Reply-To: <f662f0210907260059l36076e16rb29f75640445bc7a@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Aneesh Bhasin <contact.aneesh@gmail.com>
Cc: Saurabh Sehgal <saurabh.r.s@gmail.com>, linux-c-programming@vger.kernel.org

On Sun, Jul 26, 2009 at 1:29 PM, Aneesh Bhasin<contact.aneesh@gmail.com=
> wrote:
> Hi Saurabh,
>
> On Sun, Jul 26, 2009 at 1:09 PM, Saurabh Sehgal <saurabh.r.s@gmail.co=
m> wrote:
>>
>> Hi all,
>>
>> I had a quick question:
>>
>> Let's say I design a function with the signature:
>>
>> void * foo( char * addr ) ; ,
>>
>> where addr is a string that represents a valid memory address =A0...
>> so the way someone can call this function is ...
>>
>> char * addr =3D "0xae456778" // assume this is a valid memory addres=
s on
>> the machine
>
> This=A0means that addr points to a memory location where the string
> stored is "0xae456778"
>
>
>>
>> foo( addr ) ;
>>
>> Is it possible to take this address in string form, and assign it to
>> an actual pointer of void * type ?

/tmp> cat test.c
#include<stdio.h>

int *addr(char *address)
{
  int ptr;
  ptr=3Dstrtoul(address, 0 , 16);
  if (ptr=3D=3D-1)
    {
      perror("strtoul failed:");
    }
  return (int *)ptr;
}

int *foo()
{
  char c[10];
  int *ptr=3Dmalloc(sizeof(int));
  sprintf(c,"%p",ptr);
  *ptr=3D100;
  return addr(c);

}

int main()
{
  int *p=3Dfoo();
  printf("%d\n",*p);
  return 0;
}
/tmp> gcc test.c
test.c: In function =91foo=92:
test.c:17: warning: incompatible implicit declaration of built-in
function =91malloc=92
/tmp> ./a.out
100

Thanks -
Manish


>
> Yes, you can parse each individual character of the hex-format string
> and convert it to its integral equivalent (you can find many samples
> of this on internet...) and assing this value to a void * and then
> return it back..
>
> Hope that helps..
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Thanks -
Manish
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
