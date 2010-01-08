From: Nanakos Chrysostomos <linuxcprog@wired-net.gr>
Subject: Re: float
Date: Fri, 08 Jan 2010 18:40:55 +0200
Message-ID: <4B476017.2050406@wired-net.gr>
References: <a24b3c171001080830l4bb72defr32b60386e4e45ae9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <a24b3c171001080830l4bb72defr32b60386e4e45ae9@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: phoenixxz <vim.xxz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 8/1/2010 18:30, phoenixxz wrote:
> float i=1.34;
> printf("%f",i);
>
>
> ->> 0
> why?
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   
printf("%lf",i);
