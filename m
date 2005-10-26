From: fabio <fabio@crearium.com>
Subject: gcc -static -ggdb not working
Date: Tue, 25 Oct 2005 23:39:33 -0600
Message-ID: <435F1695.3050206@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello, I wonder why I cant dbug C programs on Solaris/sparc with gcc:

-bash-3.00$ cat 1.c;\gcc -static -ggdb 1.c -o 1
main(){
        printf("hello world\n");
}
ld: fatal: library -lc: not found
ld: fatal: library -lc: not found
ld: fatal: File processing errors. No output written to 1
collect2: ld returned 1 exit status
-bash-3.00$

I use the "\" to avoid bash aliases.

Thanks for the help,

fabio
