From: Suciu Flavius <suciuflavius@tiscali.de>
Subject: Re: printf format for Float number
Date: Thu, 30 Sep 2004 18:53:12 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <cjhd3g$4jn$1@sea.gmane.org>
References: <200409291701.16821.adixpope@rdsnet.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200409291701.16821.adixpope@rdsnet.ro>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi,

your problem it's a very common "Round-off error".

Please checkout this link from Micro$oft for a tutorial in floating 
points mistakes ;)

http://support.microsoft.com/default.aspx?scid=http://support.microsoft.com:80/support/kb/articles/Q42/9/80.ASP&NoWebContent=1


Regards and "Numa bine" ;)



Adrian Popescu wrote:
> Can anyone explain this please ???
> (what am I getting wrong and how can I avoid this ?)
> 
> I get a roughly output aproximation of a float number
> using printf: (f=123.1  to  123.099998)
> 
> If I use the format:
> %f  i get 123.099998
> %g i get 123.1
> 
> The printf "FORMAT" says:
> %f double-precision floating-point
> %g double-precision floating-point, using %f or %e
> 
> I read that "float" is promoted to "double" by printf for Format "%f"
> If I use "double" instead of "float" it works fine.
> 
> gcc version 3.2.2 20030222 (Red Hat Linux 3.2.2-5)
> 
> /*----------source---------------*/
> #include <stdio.h>
> 
> int main() {
> 
> float  f=123.1;
> double d=123.1;
> 
> printf ("%f\n", f);
> printf ("%g\n", f);
> printf ("%f\n", d);
> printf ("%f\n", 123.1);
> 
> }
> /*--------------------------------*/
> 
> <OUTPUT>
> 123.099998      <---- ?!?!?!
> 123.1
> 123.100000
> 123.100000
> 
> Thanx
> ___
> Adrian Popescu
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

