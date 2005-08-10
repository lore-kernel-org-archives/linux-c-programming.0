From: Arvind Kalyan <base16@gmail.com>
Subject: Re: Shared Library
Date: Wed, 10 Aug 2005 08:04:28 +0530
Message-ID: <90c25f2705080919349b2a611@mail.gmail.com>
References: <20050809_200735_017781.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050809_200735_017781.r_zaca@ig.com.br>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 8/10/05, r_zaca <r_zaca@ig.com.br> wrote:

>   Is it possible to check what shared libraries a program is using or what
> shared libraries is available to a program inside the code?
>   I mean, I need to be sure that a function in a shared library is available
> before I call this function.


$ man 1 ldd

-- 
Arvind Kalyan
http://www.devforge.net/~arv
