From: Rechberger Markus <mrechberger@gmail.com>
Subject: Re: error func
Date: Fri, 8 Jul 2005 12:59:02 +0200
Message-ID: <d9def9db0507080359f4f2e8f@mail.gmail.com>
References: <42CE5868.8@effigent.net>
Reply-To: Rechberger Markus <mrechberger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42CE5868.8@effigent.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: raja <vnagaraju@effigent.net>, linux-c-programming@vger.kernel.org

Hey,

how about managing a table of all functions? and iterate over that
table using strcmp or so?

Markus

On 7/8/05, raja <vnagaraju@effigent.net> wrote:
> hi,
>    I am writing a function that takes the return value of the another
> function and gives the  status of the function.
> if
>    error("functionName",arguments)
> here the function with Name "functionName " is to be executed with the
> corresponding argunents.But by knowing the function name how can i get
> the address if that function and how can i execute the function with the
> arguments.
> 
> thanking you
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
