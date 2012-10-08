From: Ole Bjorn Hessen <obh@telenor.net>
Subject: Re: strace -p <pid> EPERM after root process changed uid/gid to non-root user
Date: Mon, 08 Oct 2012 12:43:02 +0200
Message-ID: <v5y5jhxmef.fsf@shell02.nsc.no>
References: <v5626yi0v3.fsf@shell02.nsc.no>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <v5626yi0v3.fsf@shell02.nsc.no>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org



Hi,

I got an email from Celelibi pointing me in the right direction
(thanks!).

It seems like that it is neccessary to use prctl(PR_SET_DUMPABLE, 1) to
let strace -p to work. The dumpable flag is cleared in some setuid
situations.

Linux requires that real uid of strace process matches all of real uid,
effective uid and saved uid and the real gid must match the real gid,
effective gid and saved gid. And the dumpable flag must be set.


--

#include <sys/types.h>
#include <unistd.h>
#include <sys/prctl.h>

#define UID 9
#define GID 13
int main(int argc, char **argv) {
    setresgid(GID, GID, GID);
    setresuid(UID, UID, UID);
    prctl(PR_SET_DUMPABLE, 1);
    while (1) {
        sleep(1);
        write(1, "hello\n", 6);
    }
 return 1;
}


Kind regards
Ole Bjorn Hessen.
Telenor
