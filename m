From: "IVAN DE JESUS DERAS TABORA" <i.deras@unitec.edu>
Subject: Re: C++ class inheritance
Date: Fri, 03 Oct 2003 15:18:23 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1460d043642d73d6.642d73d61460d043@unitec.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Language: en
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rafael@thinkfreak.com.br
Cc: Voicu Liviu <pacman@mscc.huji.ac.il>, Sandro Dangui <sdangui@nortelnetworks.com>, linux-c-programming@vger.kernel.org

Templates are like a C macros, but templates provide a more elegant form
to do things that normally you could do with C macros, in some way.
For example:

template <class T>
struct MyStruct
{ int x, y;
  T* ptr; 
}

Now you could define vars in C++:
MyStruct<int> myVar1OfTypeMyStruct;
MyStruct<float> myVar2OfTypeMyStruct;

You could do almot the same in C:
#define MyStructType(T)  typedef struct { \
                             int x, y; \
                             T* ptr;    \         
                         } MyStruct_##T \

MyStruct(int);
MyStruct(float);

Now you could define vars in C like this:
MyStruct_int myVar1OfTypeMyStruct;
MyStruct_float myVar1OfTypeMyStruct;

A i said before is more elegant the C++ form!!!!!!!!!!!

----- Original Message -----
From: Rafael Costa dos Santos <rafael@thinkfreak.com.br>
Date: Friday, October 3, 2003 6:57 am
Subject: Re: C++ class inheritance

> Ok, but as I am C ANSI programmer it is a bit dificult to underestand.
> 
> Are you saying that "RasPDU" is a general class that depends on the 
> template 
> (in this case "H225_RegistrationRequest") that is informed ?
> 
> Is it similar to create a specific class like:
> 
> class RasPDU : public H225_RegistrationRequest
> {
> } ;
> 
> and inherit from it ?
> 
> class RegistrationRequestPDU : public RasPDU
> {
> } ;
> 
> On Thursday 02 October 2003 07:30, Voicu Liviu wrote:
> > Rafael Costa dos Santos wrote:
> > >Can anyone explain me what does < > means ?
> > >Example:
> > >
> > >class RegistrationRequestPDU : public 
> RasPDU<H225_RegistrationRequest>> >{
> > >} ;
> > >
> > >Is "RegistrationRequestPDU" inheriting from RasPDU,
> > > H225_RegistrationRequest or both ?
> >
> > RegistrationRequestPDU  inherits from RasPDU using template
> > H225_RegistrationRequest ?
> 
> -- 
> Rafael Costa dos Santos
> rafael@thinkfreak.com.br
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-
> programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

