From: Nicolas Kaiser <nikai@nikai.net>
Subject: duplicated modulo
Date: Fri, 1 Apr 2011 11:41:13 +0200
Message-ID: <20110401114113.6e2e91af@absol.kitzblitz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I'm curious: a duplicated modulo operation can't possibly make
any difference, can it?

diff -u -p ./arch/powerpc/platforms/powermac/nvram.c /tmp/nothing/arch/powerpc/platforms/powermac/nvram.c
--- ./arch/powerpc/platforms/powermac/nvram.c	2011-03-31 09:52:41.674292401 +0200
+++ /tmp/nothing/arch/powerpc/platforms/powermac/nvram.c
@@ -246,7 +246,6 @@ static u32 core99_calc_adler(u8 *buffer)
 	high = 0;
 	for (cnt=0; cnt<(NVRAM_SIZE-CORE99_ADLER_START); cnt++) {
 		if ((cnt % 5000) == 0) {
-			high  %= 65521UL;
 			high %= 65521UL;
 		}
 		low += buffer[cnt];


Best regards,
Nicolas Kaiser
