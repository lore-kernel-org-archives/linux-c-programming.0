From: =?ks_c_5601-1987?B?wMzBvrnO?= <anapple.orange@gmail.com>
Subject: FW: [Lustre-discuss] Troubles compile lustre with --enable-quota
Date: Wed, 14 May 2008 23:31:47 +0900
Message-ID: <A00667DE0ABD4539AB12B3BDE8484ED6@OrangeMini>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject:date:message-id:mime-version:content-type:content-transfer-encoding:x-mailer:x-mimeole:thread-index:from;
        bh=g3tqohXFccDlKgNTA7U4k8ZcUqxuEeGu6Q6D7XKkE+o=;
        b=Wgvf3xjx+yZTC9Nzzu6Iqhu8zw4BrrqkYSeOjd/mnAs/AKOWAngOKa3SxT48NxhiKHZcq853zkkoczMUHvrCdqRnv/6H7bwAOpuRgkrDY30bGqwuBYVhhujy70RyolmrfWu51+arBlnRsyRlOcdC2HiLRjNM/YLqrhwcRPcrNU4=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

 

-----Original Message-----
From: lustre-discuss-bounces@clusterfs.com [mailto:lustre-discuss-
bounces@clusterfs.com] On Behalf Of Patrick Winnertz
Sent: Friday, September 21, 2007 10:52 PM
To: Lustre-discuss
Subject: [Lustre-discuss] Troubles compile lustre with --enable-quota

Hey,

I've troubles when i want to compile lustre with --enable-quota:

Here my configure call:

./configure --disable-dependency-tracking \
                   --disable-modules \
                   --enable-snmp \
                   --enable-quota \
                   --disable-tests \
                   --disable-client \
                   --disable-server

when compiling it, it fails with:

make[3]: Entering directory
`/home/winnie/svn/pkg-lustre/build-area/lustre-1.6.2/lustre/quota'
gcc -DHAVE_CONFIG_H -I. -I. -I../..  -D__arch_lib__ -D_LARGEFILE64_SOURCE=1
-include ../../config.h -I../../lnet/include -I../../lnet/include -
I../../lustre/include -I../../lustre/include  -g -Wall -fPIC -g -O2 -c -o
libquota_a-quota_check.o `test -f 'quota_check.c' || echo
'./'`quota_check.c gcc -DHAVE_CONFIG_H -I. -I. -I../..  -D__arch_lib__ -
D_LARGEFILE64_SOURCE=1 -include ../../config.h -I../../lnet/include -
I../../lnet/include -I../../lustre/include -I../../lustre/include  -g -Wall
-fPIC -g -O2 -c -o libquota_a-quota_ctl.o `test -f 'quota_ctl.c' || echo
'./'`quota_ctl.c
quota_ctl.c: In function 'lov_quota_ctl':
quota_ctl.c:236: error: 'Q_QUOTAON' undeclared (first use in this function)
quota_ctl.c:236: error: (Each undeclared identifier is reported only once
quota_ctl.c:236: error: for each function it appears in.)
quota_ctl.c:236: error: 'Q_QUOTAOFF' undeclared (first use in this
function)
make[3]: *** [libquota_a-quota_ctl.o] Fehler 1


Do I anything wrong, and if yes, what? :) If not: Bug in lustre 1.6.2 ?

It would be nice if anybody could help to sort this out ;-)

Greetings
Patrick Winnertz

_______________________________________________
Lustre-discuss mailing list
Lustre-discuss@clusterfs.com
https://mail.clusterfs.com/mailman/listinfo/lustre-discuss

