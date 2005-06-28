From: "J." <mailing-lists@xs4all.nl>
Subject: Re: View hidden characters in a textfile
Date: Tue, 28 Jun 2005 10:16:39 +0200 (CEST)
Message-ID: <Pine.LNX.4.21.0506281002500.573-100000@hestia>
References: <1492.196.40.85.4.1119901509.squirrel@www.crearium.com>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1492.196.40.85.4.1119901509.squirrel@www.crearium.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Mon, 27 Jun 2005 fabio@crearium.com wrote:

> Hello,
> 
> Anyone know a tool (or c code) that allow a programmer to see hidden
> characters like "\n" or "\t" or "\r\n" ?
> 
> The command cat, tr or sed can help manipulate this character to make them
> visible but I wonder if there is a tool like a hex editor or something
> that detailed show each character that a file contain.
> 
> Thanks,
> 
> fabio.

The standard gnu's text-utils package features `od' .
There's also hexdump, xxd ... and a whole forest of other tools..

Possible C code, could be as basic as you want it to be..

int main(void) {
 char c;
 int i = 0;

 while((c = getchar()) != EOF) {
  printf(" \\%03o", c);
  if(i++ == 8)
   putchar('\n'), i = 0;

 }

 return 0;
}


J.

