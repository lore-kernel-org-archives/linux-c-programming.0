From: Ronaldo.Afonso@cyclades.com
Subject: Re: Shared Object
Date: Thu, 1 Sep 2005 08:49:39 -0300
Message-ID: <OF4BF6ACC0.87C9FA4F-ON8325706F.0040B593-8325706F.0040F88F@Cyclades.com>
References: <4316802D.4030309@effigent.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4316802D.4030309@effigent.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: raja <vnagaraju@effigent.net>
Cc: linux-c-programming@vger.kernel.org, linux-c-programming-owner@vger.kernel.org





Hello,

You could use the following command line: objdump -t "yourlib.so". In order
to see the symbols, your lib mustn't be stripped.
For more information "man objdump".
Good luck.

Ronaldo Z. Afonso
Projetista de Software
Cyclades Brasil
ronaldo.afonso@cyclades.com.br

Phone: 55 11 5033-3361
Fax: 55 11 5033-3388
www.cyclades.com.br


                                                                           
             raja                                                          
             <vnagaraju@effige                                             
             nt.net>                                                    To 
             Sent by:                  linux-c-programming@vger.kernel.org 
             linux-c-programmi                                          cc 
             ng-owner@vger.ker                                             
             nel.org                                               Subject 
                                       Shared Object                       
                                                                           
             09/01/2005 01:14                                              
             AM                                                            
                                                                           
                                                                           
                                                                           




Hi,
    Can anyone help me how to see list of object files that are in a
shared object.(.so file)


thanking you,
Raja
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


