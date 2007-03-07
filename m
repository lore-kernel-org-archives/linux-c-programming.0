From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: Re: execv fails with EFAULT
Date: Wed, 07 Mar 2007 18:44:03 +0530
Message-ID: <45EEBA9B.9030903@sun.com>
References: <45EEA7F8.5080908@sun.com>
 <6a00c8d50703070446s26ddb847uae5697ed797a2ff0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <6a00c8d50703070446s26ddb847uae5697ed797a2ff0@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Steve Graegert wrote:

> On 3/7/07, Prasanta Sadhukhan <Prasanta.Sadhukhan@sun.com> wrote:
>
>> Hi,
>>
>> When I tried the following program
>> void test4()
>> {
>>     printf("doing execv\n");
>>     if(execv("/bin/ls", "-l") =3D=3D -1)
>>         printf("exec failed with errno %d\n", errno);
>>     else
>>         printf("exec succeed\n");
>> }
>
>
> Prasanta,
>
> A NULL terminated array of arguments must be passed to execv(2) as th=
e
> prototype indicates: int execv(const char *path, char *const argv[]);
>
> For example:
>
> #include <unistd.h>
>
> char *cmd[] =3D { "ls", "-l", NULL };
> int result =3D execv ("/bin/ls", cmd);
>
> An error of EFAULT usually means that an argument points to an illega=
l=20
> address.
>
>     \Steve

Thanks Steve... If I have a string like this sprintf(str,=20
"-Xparameter:%d %s, value, command"), how to make it NULL terminated. I=
s=20
this declaration char *cmd[] =3D {str, NULL} and invocation
execv(path, cmd) correct?

Regards
Prasanta

>
> --=20
>
> Steve Gr=E4gert <steve@graegert.com>
> Jabber    xmpp://graegerts@jabber.org
> Internet  http://eth0.graegert.com, http://blog.graegert.com
> -
> To unsubscribe from this list: send the line "unsubscribe=20
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
