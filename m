From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Fri, 02 Jul 2004 21:12:37 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40E5F9F5.4080009@ig.com.br>
References: <20040702102014.58508.qmail@web8310.mail.in.yahoo.com> <16613.57971.207623.58581@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16613.57971.207623.58581@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: Dinesh Ahuja <mdlinux7@yahoo.co.in>, linux-c-programming@vger.kernel.org

Ok, but during our talk, I had asked for anothers ways to do anything 
similar, and I get a way using enum. And another hands, my compiler 
(MSVC), doesn't compile static const "initialized member", like as:

class MyClass {
   static const int size = 100;
   int arrSize[size];
};

It seems to think that I m trying to initialize a pure virutal function with wrog sintax, because it need "=0" and not "=100".
Sorry, I dont know why, but MSVC cannot compile it, I already searched MS documentation, but no answers.

Luciano

Glynn Clements wrote:

>Dinesh Ahuja wrote:
>
>  
>
>>There is a concept of constant folding in C++.
>>Whenever you declare any data member of class as a
>>constant, the compiler should allocate the memory for
>>it in the object layout and compiler should know the
>>size of the variable in advance. Suppose, if I have a
>>class like below :
>>
>>class MyClass {
>>   const int size;
>>   int arrSize[size];
>>};
>>This will not compile because compiler can not do the
>>constant folding in above case as memory needs to be
>>allocated for the constant data member size.
>>    
>>
>
>However, the title explicitly says:
>
>	STATIC const attribute in C++ (How to ?)
>
>[Emphasis mine.]
>
>There is a difference.
>
>  
>
>>The above problem can be resolved by using enums.
>>class MyClass {
>>   enum {size = 100};
>>   int arrSize[size];
>>};
>>    
>>
>
>It can also be resolved using an initialised static const member:
>
>class MyClass {
>   static const int size = 100;
>   int arrSize[size];
>};
>
>  
>
