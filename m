From: Rafael Costa dos Santos <rafael@thinkfreak.com.br>
Subject: Re: C++ class inheritance
Date: Fri, 3 Oct 2003 12:57:13 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200310031257.14155.rafael@thinkfreak.com.br>
References: <200310020400.13292.rafael@thinkfreak.com.br> <3F7BD40E.3050100@mscc.huji.ac.il>
Reply-To: rafael@thinkfreak.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F7BD40E.3050100@mscc.huji.ac.il>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Voicu Liviu <pacman@mscc.huji.ac.il>, Sandro Dangui <sdangui@nortelnetworks.com>
Cc: linux-c-programming@vger.kernel.org

Ok, but as I am C ANSI programmer it is a bit dificult to underestand.

Are you saying that "RasPDU" is a general class that depends on the template 
(in this case "H225_RegistrationRequest") that is informed ?

Is it similar to create a specific class like:

class RasPDU : public H225_RegistrationRequest
{
} ;

and inherit from it ?

class RegistrationRequestPDU : public RasPDU
{
} ;

On Thursday 02 October 2003 07:30, Voicu Liviu wrote:
> Rafael Costa dos Santos wrote:
> >Can anyone explain me what does < > means ?
> >Example:
> >
> >class RegistrationRequestPDU : public RasPDU<H225_RegistrationRequest>
> >{
> >} ;
> >
> >Is "RegistrationRequestPDU" inheriting from RasPDU,
> > H225_RegistrationRequest or both ?
>
> RegistrationRequestPDU  inherits from RasPDU using template
> H225_RegistrationRequest ?

-- 
Rafael Costa dos Santos
rafael@thinkfreak.com.br
