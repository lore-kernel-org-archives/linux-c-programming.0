From: <vadiraj@mail.cyberneme.com>
Subject: Re: processing arguments
Date: Sat, 24 Apr 2004 10:36:45 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <003a01c429b9$f0bca540$4401a8c0@otl068>
References: <Pine.LNX.4.58.0404231743080.1006@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ameer armaly <ameer@charter.net>, linux-c-programming@vger.kernel.org

Hi,

> When I try that, and I type:
> ./a.out hello
>
> It doesn't give me any output.
> Can someone explain how to process args properly?
> Thanks,

  args are no special data type, they are just two dimenstional char array,
all the strings functions apply to them. Like the others mentioned
string compare should be done either charecter by charecter or use the
lib function on strings.


cheers,
Vadi.


