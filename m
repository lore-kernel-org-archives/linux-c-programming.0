From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Pointers to classes
Date: Mon, 21 Jun 2004 10:55:12 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E3066113850B@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Eric wrote:


> The abstract class worked like a charm! I think I had some weird include 
>problems where they werent going in the order I needed them to and I
couldn't 
>trace it down. Firthermore I didnt want to redefine the class inside 
>connection.h...that would just be silly. But an abstract class worked 
>beautifully.

Actually, the correct term, AFAIR, is a forward declaration.  

An `abstract class' is a class that can not be instantiated due to having
one or
more abstract functions in the class.  The `abstract class' is used as a
base class
for inheridence.  For example, the following class is an abstract class:

class CShape
{
public:
   void virtual Draw() = 0;
   int   GetType();
   ...
private:
   int   m_nType;
};

The strange looking syntax `void virtual Draw() = 0' is how an abstract
function is 
declared.  This has several consequences:

1.  As stated before, it is impossible to instantiate an abstract class.  

2.  The compiler will require that _all_ classes derived from an abstract
class provide
    an implementation for the abstract function.  

3.  You can use pointers to the abstract class to get polymorphic behavior.
For example,
    if you represent a picture an a collections of shapes, you can declare a
picture like:

     std::vector<CShape*>     pic;

    and the compiler will be happy.  You will need typecast the derived
classes to the
    parent class to insert into the collection.  

George


