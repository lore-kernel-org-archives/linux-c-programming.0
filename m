From: "simon\.guinot" <simon.guinot@laposte.net>
Subject: memory_allocation
Date: Fri, 13 Aug 2004 14:27:51 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <I2DXAF$7B97927BCA10A589B58FC0F34E16A58F@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

hello,

i have a problem with a structure memory allocation...
=20
struct dns_answer {
         unsigned short type;
         unsigned short class;
         unsigned int ttl;
         unsigned short rdlength;
         unsigned int addr_answer;
         } dns_answ;

all this element are not adjacent in memory... i have two
"free bytes" between rdlenght and addr_answer...
since here, i have alway made my headers like this... and no
problem...
an idea to force this structure elements to be adjacent in
memory ?
=20
thank by advance for help

simon

ps : sorry for my poor english...


Acc=E9dez au courrier =E9lectronique de La Poste : www.laposte.net ;=20
3615 LAPOSTENET (0,34=80/mn) ; t=E9l : 08 92 68 13 50 (0,34=80/mn)



-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
