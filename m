From: jnf <xjnfx@doityourself.com>
Subject: exploitable code?
Date: Sun, 30 Jun 2002 20:38:59 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020701033859.B54653ECC@sitemail.everyone.net>
Reply-To: xjnfx@doityourself.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hi, ive got a question, is this code exploitable?

int main(int argc, char **argv) {
char buf[256];

strcpy(buf,argv[1]);
exit(1);
}

everything i read says yes, but i cant seem to get it. I don't see any way of overwriting esp for ret, so as far as i can tell i must go into the exit function, and exit comes before leave, so i cant land to arb. code. So am I just dumb, or am I playing with code that isnt exploitable?

fyi, this isnt an actual program but a program created for educational purposes.
thx
j

_____________________________________________________________
Sign up for FREE email from DoItYourself.com at http://doityourself.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
