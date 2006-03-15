From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Significance of using + before function calls.
Date: Wed, 15 Mar 2006 08:51:39 +0100
Message-ID: <6a00c8d50603142351u2def5e49vc6c40c221da40e5e@mail.gmail.com>
References: <44180FBC.50703@wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <44180FBC.50703@wipro.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/15/06, Vamsi <krishna.vamsi@wipro.com> wrote:
> Hi List,
>
> i have seen a code snippet which starts with + symbol,
>
> +system("ls -l");
>
> what is the significance of using + symbol before system.
>
> i also tried using + before printf ,, like +printf("Some text"); and it
> is compiling and working tooo,,
>
> Can somebody clarify wht does that + signify??

The unary plus operator returns the value of an expression.  Neither
the unary plus nor unary minus operators produce lvalues and is of
limited use.

	\Steve
