From: "Luiz Fernando N. Capitulino" <lcapitulino@terra.com.br>
Subject: Re: Pointer to int
Date: Wed, 21 Jul 2004 20:14:26 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040721201426.2856ba87.lcapitulino@terra.com.br>
References: <20040721_211129_060718.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040721_211129_060718.r_zaca@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ronaldo Zacarias Afonso <r_zaca@ig.com.br>
Cc: linux-c-programming@vger.kernel.org


 Hi Ronaldo,

Em Wed, 21 Jul 2004 18:11:29 -0300
Ronaldo Zacarias Afonso <r_zaca@ig.com.br> screveu:

|   I'm iniciating in the C programming language and there are some things 
| that I realy need to understand, so the question is: 
| 
|   In the code: 
| 
|   int i; 
|   struct some_struct *ptr; 
| 
|   ptr = &some_other_struct; 
| 
|   i = (int) ptr; 
| 
| 
|   1) Is the last sentence a valid one? 

 Yes, but depending on the architecture the int variable will not be enough.

|   2) If it is, what is realy happening? 
| 
| note - It seems very stranger to me. A struct pointer being "transformed" 
| into a int variable. 

 Variables address are also numbers, so you can handle it with int variables.

 The two most important questions here are: 1) you need to _know_ exactly what
you are doing, and 2) the variable size.

 For i386 architecture, you will need a 32-bit variable to store an address, so
for you example "unsigned int" is what we want (assuming you want all the address,
maybe you want a half of it, or something like that).

 And do a +1 in a pointer is not the something to do a +1 in the `i' above.

-- 
Luiz Fernando
