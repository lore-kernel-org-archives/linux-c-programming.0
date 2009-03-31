From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Linux process...
Date: Tue, 31 Mar 2009 06:57:27 +0100
Message-ID: <18897.45255.497602.593898@cerise.gclements.plus.com>
References: <34e1241d0903292306m3e879639u4752e821349c84ee@mail.gmail.com>
	<49D0AEAF.1070607@somanetworks.com>
	<34e1241d0903301812t3197a0f0n8e5888b032095127@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <34e1241d0903301812t3197a0f0n8e5888b032095127@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: beginner_h4x3r <nightdecoder@gmail.com>
Cc: Fabian Ischia <fischia@somanetworks.com>, linux-c-programming@vger.kernel.org


beginner_h4x3r wrote:

> Okay, so the child process was not actually access it's parent
> variable, the child given a copy (i have learned about Copy On Write
> mechanism too).  But it is like a C language issue: we can access any
> variable which declared in that function in this case main() function.
> So in my code, when i try to access stack_int variable in child
> process, it's not wrong, compiler even recognize this as 'valid'
> approach... How about my conclusion?

What about it? If you compile with warnings enabled, gcc will tell you
that the first printf() is using the value of an uninitialised
variable.

-- 
Glynn Clements <glynn@gclements.plus.com>
