From: Anindya Mozumdar <anindya.lugbang@gmail.com>
Subject: Order preserving encryption of numeric data
Date: Tue, 17 May 2005 15:05:52 +0530
Message-ID: <4e829fd30505170235691da664@mail.gmail.com>
Reply-To: Anindya Mozumdar <anindya.lugbang@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,
    Dont know whether this is an appropriate question to ask in this
list, but someone experienced in dealing with such a situation could
help.

    I would like an algorithm which will encrypt/decrypt numeric data
using a key, such that after encryption their orders will be
preserved,i.e, if crypt(a) denotes the encrypted form of a, and a < b,
then crypt(a) < crypt(b). ( Note that this assumes that the algorithm
will produce crypted data which can actually be ordered ). Of course,
something like a -> ma + n, where m and n are constants would work,
but I would like something more nontrivial.

    The order preserving property is necessary as the crypted data
will be stored in a database, and I would like to issue database
queries on them. ( The other solution is to retrieve all values from
the database, decrypt them, and find the appropriate subset, but that
would be too expensive ).

Thanks.
Anindya.
