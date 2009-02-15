From: Fundu <fundu_1999@yahoo.com>
Subject: =?utf-8?B?d2FybmluZzog4oCYc3RydWN0IOKAmSBkZWNsYXJlZCBpbnNpZGUgcGFyYW1l?=
 =?utf-8?B?dGVyIGxpc3Q=?=
Date: Sat, 14 Feb 2009 17:16:42 -0800 (PST)
Message-ID: <875251.26275.qm@web63406.mail.re1.yahoo.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming@vger.kernel.org

i'm running ubuntu 8.04 with gcc-4.2=20
and i'm getting=20

mb_con.h:43: warning: =E2=80=98struct query_resp=E2=80=99 declared insi=
de parameter list
mb_con.h:43: warning: its scope is only this definition or declaration,=
 which is probably not what you want

here's a snippet of how .h file looks

struct query_resp_type
{
  int type;
} query_resp;

void send_req(struct query_resp* resp);


what i don't understand is why this warning when i have declared the st=
ruct before the function in the header.

what am i missing ?=20

thanks in advance !



     =20
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
