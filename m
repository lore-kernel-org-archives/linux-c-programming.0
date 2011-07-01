From: Davidlohr Bueso <dave@gnu.org>
Subject: Re: initializing a struct
Date: Fri, 01 Jul 2011 13:58:06 -0400
Message-ID: <1309543086.3374.1.camel@offbook>
References: <BANLkTimgJN2_SH+_mvkckZKBefCLN6aM=g@mail.gmail.com>
	 <BANLkTikvCRn1mdCosk=-Bm8EqDamE5FtpQ@mail.gmail.com>
Reply-To: dave@gnu.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <BANLkTikvCRn1mdCosk=-Bm8EqDamE5FtpQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadiraj <vadiraj.cs@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On Thu, 2011-06-30 at 15:48 +0530, Vadiraj wrote:
> Hey Guys,
>  I'm stuck with logical reason for initializing a struct variable. Please help..
>  Consider a struct defined this way..
>  struct foo
>  {
>      int a;
>      char *ptr;
>  };
>  in my function I declare a local variable of this struct.
>  void bar()
>  {
>        struct foo local_var[10];
>        ...
>        ...
>  }
>  do you suspect a initialization issue? do we need to initialize the
> local array local_var[10] ? What's the best practice?

This kind of initialization is done with memset(), so can use 0s to
avoid random data.
