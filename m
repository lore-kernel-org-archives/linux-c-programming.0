From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Subject: Re: C++ class inheritance
Date: Fri, 03 Oct 2003 13:19:29 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F7DA191.9040706@fi.uba.ar>
References: <200310020400.13292.rafael@thinkfreak.com.br> <3F7BD40E.3050100@mscc.huji.ac.il> <200310031257.14155.rafael@thinkfreak.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: rafael@thinkfreak.com.br
Cc: linux-c-programming@vger.kernel.org

   You better get a C++ book or tutorial, I can recommend you "The C++ 
Programming Language" by Bjarne Stroustrup, 3rd Edition.
   With templates you can parameterize types used in C++ constructs like 
classes, structs or functions.

Rafael Costa dos Santos wrote:
> Ok, but as I am C ANSI programmer it is a bit dificult to underestand.
> 
> Are you saying that "RasPDU" is a general class that depends on the template 
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
> 
>>Rafael Costa dos Santos wrote:
>>
>>>Can anyone explain me what does < > means ?
>>>Example:
>>>
>>>class RegistrationRequestPDU : public RasPDU<H225_RegistrationRequest>
>>>{
>>>} ;
>>>
>>>Is "RegistrationRequestPDU" inheriting from RasPDU,
>>>H225_RegistrationRequest or both ?
>>
>>RegistrationRequestPDU  inherits from RasPDU using template
>>H225_RegistrationRequest ?
> 
> 


