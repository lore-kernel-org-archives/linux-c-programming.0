From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: value computed is not used ??
Date: Tue, 1 Jun 2004 04:25:58 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16571.63302.688793.269892@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.21.0406010333220.1813-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0406010333220.1813-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


J. wrote:

> When I try to compile the listed program, with gcc version 2.95.4 20011002
> and the command `gcc -Wall program.c -o program` It gives me a warning
> message like: warning: value computed is not used
> 
> The program works perfectly fine, as far as I can judge the code isn't
> wrong in any way ? And the value is certainly used.. Unfortunatly this
> message shows to many times when I try to compile other code at my system.
> 
> Can anyone explain to me what the sense behind that warning is ? And what
> to do about it ? e.g. what the ``better way`` of coding would be?
> 
> #include <stdio.h>
> 
> int main(void) {
>  char *ptr = NULL;
>  char str[] = "whats up";
> 
>  for(ptr = str; *ptr; *ptr++) {

	for(ptr = str; *ptr; ptr++) {

There is no point in dereferencing "ptr++", which is why you get the
warning.

-- 
Glynn Clements <glynn.clements@virgin.net>
