From: Rechberger Markus <mrechberger@gmail.com>
Subject: Re: ncurses problem
Date: Thu, 10 Feb 2005 15:28:30 +0100
Message-ID: <d9def9db050210062849a0d22d@mail.gmail.com>
References: <420B365D.7090109@hq.ntsp.nec.co.jp>
Reply-To: Rechberger Markus <mrechberger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <420B365D.7090109@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hey Earl!

try
FIELD *fields[3];
and
fields[2] = NULL;

I wondered how should new_form know when the array ends..

regards,

Markus


On Thu, 10 Feb 2005 18:24:29 +0800, Earl R. Lapus <elapus@ntsp.nec.co.jp> wrote:
> hi there,
> 
> i have a problem using ncurses. i attached the source code with this email.
> this program displays two text fields. my problem occurs when i add this,
> `char buff[256];` after the declaration, `int ch;`.
> after adding the character array declaration, the text fields won't
> display anymore.
> any ideas?
> 
> -earl-.
> 
> --
> ==========================================
>   There are seven words in this sentence.
> ==========================================
> 
> 
>
