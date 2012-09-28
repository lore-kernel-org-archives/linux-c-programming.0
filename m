From: Ole Bjorn Hessen <obh@telenor.net>
Subject: strace -p <pid> EPERM after root process changed uid/gid to non-root user
Date: Fri, 28 Sep 2012 18:11:12 +0200
Message-ID: <v5626yi0v3.fsf@shell02.nsc.no>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org


Hi,

I have a program that starts as root and changes uid/gid to a non-root
user on linux. I'd like to run strace -p on that process as non-root
but I do only get ptrace(PTRACE_ATTACH, ...): Operation not
permitted. I can send kill to that program though as that non-root user.

Anybody care to explain what magic is neccessary for a root program to
reduce priv level so that an unpriv process can strace -p that program:

Attach is a small program that changes uid from root to "news".
Try to strace that program in another window:

## in window 1

echo '
#include <sys/types.h>
#include <unistd.h>

#define UID 9
int main(char **argv, int argc) {
    setresgid(UID, UID, UID);
    gid_t list[2];
    list[0] = UID;
    list[1] = 0;
    setgroups(1, list);
    setresuid(UID, UID, UID);
    while (1) {
        sleep(1);
        write(1, "hello\n", 6);
    }
 return 1;
}
' > /tmp/ffo.c


gcc -o /tmp/ffo /tmp/ffo.c
super sh
/tmp/ffo

## in window 2
su news
strace -p $(ps -ef | grep ffo | grep -v grep | awk '{print $2}')
attach: ptrace(PTRACE_ATTACH, ...): Operation not permitted

## kill is ok though
kill $(ps -ef | grep ffo | grep -v grep | awk '{print $2}')


--

Kind regards,

Ole Bjorn Hessen.
Telenor
----------

