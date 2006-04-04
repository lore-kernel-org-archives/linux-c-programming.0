From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: FILE_FLAG_WRITE_THROUGH
Date: Tue, 4 Apr 2006 21:13:02 +0200
Message-ID: <6a00c8d50604041213w5fda863btd5d675cbaa4d2ca5@mail.gmail.com>
References: <4432B296.8050408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4432B296.8050408@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 4/4/06, Rebelde <jrsilva2k@gmail.com> wrote:
> Hi
>
> On Windows XP I can write directly to disk whitout cache write using the
> CreateFile function with FILE_FLAG_WRITE_THROUGH. Could someone tell me
> how to make this on Linux?

What you're looking for is a filesystem-specific feature and can be
utilized using the O_DIRECT flag in the open(2) system call.  If
you're filesystem does not support raw i/o EINVAL is returned.  Since
I am using XFS I can't tell you about other fs, but I suppose Ext2,
Ext3 and JFS do support it. (Corrections welcome.)

	\Steve
