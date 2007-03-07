From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: execv fails with EFAULT
Date: Wed, 7 Mar 2007 13:46:25 +0100
Message-ID: <6a00c8d50703070446s26ddb847uae5697ed797a2ff0@mail.gmail.com>
References: <45EEA7F8.5080908@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=U3LThFB7tidxfrQ1WkXZcdbOZrAMzIVBSR9duDMjN4EvLSOmo1B44ehySKoQNMkytRhM6oTqqr6EubiskF6KgDUU2U/KQB/eEzvpiCdQLRN8p+2HIOOk3tDOHSmF9cskqvGysrWmwvqT0YdO7Eaikn/NqAD5WiF8JZTm2FjkSTY=
In-Reply-To: <45EEA7F8.5080908@sun.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@sun.com>
Cc: linux-c-programming@vger.kernel.org

On 3/7/07, Prasanta Sadhukhan <Prasanta.Sadhukhan@sun.com> wrote:
> Hi,
>
> When I tried the following program
> void test4()
> {
>     printf("doing execv\n");
>     if(execv("/bin/ls", "-l") =3D=3D -1)
>         printf("exec failed with errno %d\n", errno);
>     else
>         printf("exec succeed\n");
> }

Prasanta,

A NULL terminated array of arguments must be passed to execv(2) as the
prototype indicates: int execv(const char *path, char *const argv[]);

=46or example:

#include <unistd.h>

char *cmd[] =3D { "ls", "-l", NULL };
int result =3D execv ("/bin/ls", cmd);

An error of EFAULT usually means that an argument points to an illegal =
address.

	\Steve

--

Steve Gr=E4gert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
Internet  http://eth0.graegert.com, http://blog.graegert.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
