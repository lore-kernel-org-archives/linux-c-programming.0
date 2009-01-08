From: Nicholas Mc Guire <hofrat@hofr.at>
Subject: Re: c preprocessor expansion
Date: Thu, 8 Jan 2009 08:46:18 -0900 (AKST)
Message-ID: <Pine.LNX.4.58.0901080843500.3415@vlab.hofr.at>
References: <ef37ea20901080949i2cd875fbk58b4ae3605655812@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <ef37ea20901080949i2cd875fbk58b4ae3605655812@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Task Struct From Hell <taskstructfromhell@googlemail.com>
Cc: linux-c-programming@vger.kernel.org

>
>
> #define FOO "bar"
>
> int main() {
>    printf(FOO);
> }
>
> It will output this:
>
> int main() {
>    printf("bar");
> }
>
gcc -E file.c
hofrat@rtl14:~/stuff$ cat file.c
#define FOO "bar"

int main() {
   printf(FOO);
}

hofrat@rtl14:~/stuff$ gcc -E file.c
# 1 "file.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "file.c"


int main() {
   printf("bar");
}


hofrat
