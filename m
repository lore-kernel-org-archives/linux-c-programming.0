From: Stephen Kratzer <kratzers@pa.net>
Subject: Re: ftw , nftw doesn't work
Date: Wed, 25 Apr 2007 09:16:42 -0400
Message-ID: <200704250916.43481.kratzers@pa.net>
References: <462F4D67.5090600@zg.t-com.hr>
Reply-To: kratzers@pa.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <462F4D67.5090600@zg.t-com.hr>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikola <root.admin1@zg.t-com.hr>
Cc: linux-c-programming@vger.kernel.org

On Wednesday 25 April 2007 08:45:27 Nikola wrote:
> Hi,
>
> I am trying to parse dir tree with ftw and nftw on Linux (debian) but
> without result.
>
> ------------------------------------------------------
>
> #include <stdio.h>
> #include <ftw.h>
>
>
> int fn(const char *file, const struct stat *sb, int flag){
>
>         printf("-->\n");
> }
>
>
> int main(int argc,char **argv){
>
>
>         ftw("/etc/", fn, 5);
>
>         return 0;
> }
>
> ------------------------------------------------------
>
> bash# gcc test.c
> bash# ./a.out
> -->
> bash#
>
> ------------------------------------------------------
>
> Does anyone knows what might be the problem.
>
> tnx in advance.
>

The return value of fn should be 0 if you want the walk to continue past the 
first file or directory.

