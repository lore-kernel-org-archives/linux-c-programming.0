From: Billy O'Connor <billy@oconnoronline.net>
Subject: Re: Detecting file changes?
Date: Mon, 10 Jun 2002 17:50:29 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020610215029.A8C3B18@dps7.oconnoronline.net>
References: <20020609120501.A12543@whatever.local> <20020609174630.GA448@cam.ac.uk> <3D051E69.2040000@htec.demon.co.uk>
Reply-To: billy@oconnoronline.net
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3D051E69.2040000@htec.demon.co.uk> (cq@htec.demon.co.uk)
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cq@htec.demon.co.uk
Cc: linux-c-programming@vger.kernel.org

   >From billy  Mon Jun 10 16:51:33 2002
   Date:	Mon, 10 Jun 2002 22:47:21 +0100
   From: Christopher Quinn <cq@htec.demon.co.uk>
   X-Accept-Language: en-us, en
   Sender: linux-c-programming-owner@vger.kernel.org
   X-Mailing-List:	linux-c-programming@vger.kernel.org

   Hello list.

   Is there a way other than polling to detect when a file's contents change?
   I was hoping something like select(2).
   Any ideas?

   Thanks,
   Chris

   -
   To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
   the body of a message to majordomo@vger.kernel.org
   More majordomo info at  http://vger.kernel.org/majordomo-info.html

Check out sgi_fam.  This uses select to monitor file accesses.  One
source would be:

http://mirror.hiwaay.net/redhat/redhat/redhat-7.3-en/os/i386/SRPMS/fam-2.6.7-6.src.rpm

--
Billy O'Connor
