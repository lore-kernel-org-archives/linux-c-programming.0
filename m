From: Rechberger Markus <mrechberger@gmail.com>
Subject: Re: Variable to sizeof function.
Date: Fri, 15 Jul 2005 17:16:50 +0200
Message-ID: <d9def9db050715081655b4a580@mail.gmail.com>
References: <20050715140207.78402.qmail@web31901.mail.mud.yahoo.com>
	 <6eee1c405071508004e8e5200@mail.gmail.com>
Reply-To: Rechberger Markus <mrechberger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6eee1c405071508004e8e5200@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj <vadiraj.cs@gmail.com>
Cc: linux-c-programming@vger.kernel.org

strlen on a null pointer will segfault...
if arc is 1 then argv[0] will contain a pointer to an array of char
if arc is 2 then argv[1] (the users first argument) will contain an
array of char..
so don't forget to check the number of arguments ..

On 7/15/05, Vadiraj <vadiraj.cs@gmail.com> wrote:
> Vikas,
> 
> On 7/15/05, Vikas S <vikas_soolapani@yahoo.com> wrote:
> > I want to find out the size of a structure which the user will give as an argument
> > as follows.
> >
> > #include <>  -- All includes..
> > ..
> > main(int arc, char *argv[])
> 
>    argv is a charecter pointer . You cannot pass struct * as an
> arguement to main.
> 
> > {
> > printf("Size of structure %s is: %d\n", argv[1], sizeof(struct argv[1]));
> 
> use strlen(argv[1]) to find the lenght of the string.
> 
> --
> cheers,
> Vadi
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
