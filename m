From: elathan@phys.uoa.gr
Subject: function pointers in C++
Date: Mon, 15 Mar 2004 11:28:19 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1079342899.405577335bb24@webmail.uoa.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello! 
 
Suppose I have: 
 
class Foo 
{ 
public: 
	Foo(); 
	~Foo(); 
	int bar(int); 
}; 
 
Now, why I can't do this: 
 
Foo *f = new Foo(); 
taz(f->bar); 
 
Where taz()'s protype is: 
 
void taz(int (*f)(int)); 
 
In plain C, I can do: 
 
int f(int) { ... } 
taz(f); 
 
without a problem. Is there a way to accomplish such a thing (i.e. 
to pass the pointer of a C++ class's member function to another 
function that expects a pointer to function as an argument)? 
 
Regards, 
--  

