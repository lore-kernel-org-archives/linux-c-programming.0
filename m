From: vnanda@hss.hns.com
Subject: Re: tool.
Date: Mon, 6 Jan 2003 09:20:42 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <65256CA6.00143F84.00@sandesh.hss.hns.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pankaj Thapa <P.Thapa@zensar.com>
Cc: linux-c-programming@vger.kernel.org




Hi  Pankaj

You can use GDB to execute the program.
When you execute the program, you can see the list of global variables
and their values.

Also, to find out how many times a function has been executed,
simply put a brakpoint on the function and later do "info b".
This shall display the list of breakpoints and the number of times the
breakpoint(the function you wanted to count) has been hit.


Regards
Vaibhav
Hughes Software Systems






"Pankaj Thapa" <P.Thapa@zensar.com> on 01/03/2003 11:52:06 AM

To:   linux-c-programming@vger.kernel.org
cc:    (bcc: Vaibhav Nanda/HSS)

Subject:  tool.




Is there any tool in unix to find out no. of times a function used , global
variable
etc .. in a source code and provides the scope of writing generic functions
in the code for  optimization of the code.

regards,
pankaj thapa
Zensar Technology, Pune
020-4128233

-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming"
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html




