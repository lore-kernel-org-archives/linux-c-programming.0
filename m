From: simon <simon.guinot@laposte.net>
Subject: buggy_double_use_of _scanf
Date: Tue, 26 Oct 2004 14:42:40 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <417E4640.2040504@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-C-programming <linux-c-programming@vger.kernel.org>

hello,

I have observe a strange scanf behaviour...
when using two successive scanf... the second receive a return character

for example :

int a;
char b;

scanf ("%d", &a);
fflush (stdin);
scanf ("%c", &b);
fprintf (stdout, "a : %d\nb : %c\n", a, b);

what's the problem ?
is scanf using a buggy internal buffer ?

simon
