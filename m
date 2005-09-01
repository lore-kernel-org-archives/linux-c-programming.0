From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Shared Object
Date: Thu, 1 Sep 2005 07:24:15 +0200
Message-ID: <6a00c8d5050831222433e20d63@mail.gmail.com>
References: <4316802D.4030309@effigent.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4316802D.4030309@effigent.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: raja <vnagaraju@effigent.net>
Cc: linux-c-programming@vger.kernel.org

On 9/1/05, raja <vnagaraju@effigent.net> wrote:
> Hi,
>    Can anyone help me how to see list of object files that are in a
> shared object.(.so file)

You probably mean listing all symbols exported by an object file.  If
so, try nm, objdump and their friends.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
