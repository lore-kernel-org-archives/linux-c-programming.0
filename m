From: Yorgos Pagles <pagles@intralot.com>
Subject: Re: Need for const in function argument list
Date: Mon, 27 Mar 2006 11:25:41 +0300
Message-ID: <4427A185.4080306@intralot.com>
References: <200603261614.39708.samjnaa@gmail.com>	<6a00c8d50603260257u18642532l7b88ae11c86e46cb@mail.gmail.com>	<200603261908.36723.samjnaa@gmail.com> <17446.49419.665743.127524@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17446.49419.665743.127524@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Glynn Clements wrote:
> 
> If a pointer parameter is declared as const, you can pass either const
> or non-const pointers. If it isn't declared as const, then you can
> only pass non-const pointers, not const pointers.
> 

For that alone please use const when it is needed. Some moron I had to 
work with once wrote a wrapper for some printing functions and in the 
most significant  of his functions he had
void PrintText(char*){/...}
and there was no way for me to write:
PrintText("Hello World");
in my code, I had to use the ugly:
PrintText(const_cast<char*>("Hello World"));
because of someone else's ignorance.
-- 
Make it work. Make it fast. Make it right. Pick any two...
