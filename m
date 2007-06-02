From: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Subject: du and ls
Date: Sat, 2 Jun 2007 01:58:04 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0706050051290.29079@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1909733254-2071909937-1181026658=:29079"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Date: Tue, 5 Jun 2007 00:57:38 -0600 (CST)
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1909733254-2071909937-1181026658=:29079
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hello,

I am curious about the mismatch between du and ls. Apparently, du reports=
=20
amount of 512 or 1024-K blocks, and ls lists the absolute value.

But, why in some cases, a 1100 bytes file is reported by du as 4 x 512=20
bytes instead of 3 x 512bytes

I note both use fstat().

Thanks for advice,

---
Fabio Andr=E9s Miranda
Ingenier=EDa en sistemas inform=E1ticos
Universidad Latina - Costa Rica
---1909733254-2071909937-1181026658=:29079--
