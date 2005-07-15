From: Vadiraj <vadiraj.cs@gmail.com>
Subject: Re: Variable to sizeof function.
Date: Fri, 15 Jul 2005 20:30:16 +0530
Message-ID: <6eee1c405071508004e8e5200@mail.gmail.com>
References: <20050715140207.78402.qmail@web31901.mail.mud.yahoo.com>
Reply-To: Vadiraj <vadiraj.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050715140207.78402.qmail@web31901.mail.mud.yahoo.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vikas S <vikas_soolapani@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

Vikas,

On 7/15/05, Vikas S <vikas_soolapani@yahoo.com> wrote:
> I want to find out the size of a structure which the user will give as an argument
> as follows.
> 
> #include <>  -- All includes..
> ..
> main(int arc, char *argv[])

   argv is a charecter pointer . You cannot pass struct * as an
arguement to main.

> {
> printf("Size of structure %s is: %d\n", argv[1], sizeof(struct argv[1]));

use strlen(argv[1]) to find the lenght of the string.

-- 
cheers,
Vadi
