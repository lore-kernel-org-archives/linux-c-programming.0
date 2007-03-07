From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: execv fails with EFAULT
Date: Wed, 7 Mar 2007 14:50:53 +0100
Message-ID: <6a00c8d50703070550g54ddc92ct393e87b0d3a20d87@mail.gmail.com>
References: <45EEA7F8.5080908@sun.com>
	 <6a00c8d50703070446s26ddb847uae5697ed797a2ff0@mail.gmail.com>
	 <45EEBA9B.9030903@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=LBfc+rrdG0aw24CIvvJF/0Z1R5AY3GJZ+Zo0hJqpWtGDQz8eBp1BiDAO++OOcAmB77i6bg9kdqJEn/KVbYbWkZ06/imo83Psc6sXXl41XWemJYk0MToz0VA5e4u8l+VBCVRFtej+AWcqI9IdRjKibcnX/RhB0YBA3A8OFdCxKGo=
In-Reply-To: <45EEBA9B.9030903@sun.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@sun.com>
Cc: linux-c-programming@vger.kernel.org

On 3/7/07, Prasanta Sadhukhan <Prasanta.Sadhukhan@sun.com> wrote:
> Steve Graegert wrote:
>
> > On 3/7/07, Prasanta Sadhukhan <Prasanta.Sadhukhan@sun.com> wrote:
> >
> >> Hi,
> >>
> >> When I tried the following program
> >> void test4()
> >> {
> >>     printf("doing execv\n");
> >>     if(execv("/bin/ls", "-l") =3D=3D -1)
> >>         printf("exec failed with errno %d\n", errno);
> >>     else
> >>         printf("exec succeed\n");
> >> }
> >
> >
> > Prasanta,
> >
> > A NULL terminated array of arguments must be passed to execv(2) as =
the
> > prototype indicates: int execv(const char *path, char *const argv[]=
);
> >
> > For example:
> >
> > #include <unistd.h>
> >
> > char *cmd[] =3D { "ls", "-l", NULL };
> > int result =3D execv ("/bin/ls", cmd);
> >
> > An error of EFAULT usually means that an argument points to an ille=
gal
> > address.
> >
> >     \Steve
>
> Thanks Steve... If I have a string like this sprintf(str,
> "-Xparameter:%d %s, value, command"), how to make it NULL terminated.=
 Is
> this declaration char *cmd[] =3D {str, NULL} and invocation
> execv(path, cmd) correct?

If you mean

        sprintf(str, "-Xparameter:%d %s", value, command);

your declaration and invocation of

        char *cmd[] =3D {str, NULL}
        execv(path, cmd);

should be OK.

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
