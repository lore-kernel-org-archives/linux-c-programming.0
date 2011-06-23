From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: extra slash in current path
Date: Thu, 23 Jun 2011 18:31:06 +0400
Message-ID: <4E034E2A.1010100@msgid.tls.msk.ru>
References: <BANLkTi=y1roManmZGMLBXSFbBVqK_KqDZg@mail.gmail.com> <20110623153116.404f2a63.taeuber@bbaw.de> <BANLkTinOb-4Xm_W2fmzivk6jBJwjeHYKVA@mail.gmail.com> <BANLkTimXH8K91cZ69oPRu=wbYt9JgBadfA@mail.gmail.com> <BANLkTin9bQ4hzs-odYU-Gxy-f-T+HLLAdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTin9bQ4hzs-odYU-Gxy-f-T+HLLAdQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: yuyichao-mit <yuyichao@mit.edu>
Cc: richard -rw- weinberger <richard.weinberger@gmail.com>, =?ISO-8859-1?Q?Lars_T=E4uber?= <taeuber@bbaw.de>, linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

23.06.2011 18:11, yuyichao-mit wrote:

>>>> $ cd //
>>>> $ pwd
>>>> //

The current directory is cached in $PWD environment
variable by shell (bash at least).  This variable is
checked in glibc (getcwd() et al) - if it is set and
stat($PWD) is the same as stat("."), that value is used.

It has nothing to do with kernel, probably the issue
is in bash which somehow allows double slash for root
dir (but not triple).

/mjt
