From: Voicu Liviu <pacman@mscc.huji.ac.il>
Subject: Re: C++ class inheritance
Date: Thu, 02 Oct 2003 10:30:22 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F7BD40E.3050100@mscc.huji.ac.il>
References: <200310020400.13292.rafael@thinkfreak.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200310020400.13292.rafael@thinkfreak.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: rafael@thinkfreak.com.br
Cc: linux-c-programming@vger.kernel.org

Rafael Costa dos Santos wrote:

>Can anyone explain me what does < > means ? 
>Example:
>
>class RegistrationRequestPDU : public RasPDU<H225_RegistrationRequest>
>{
>} ;
>
>Is "RegistrationRequestPDU" inheriting from RasPDU, H225_RegistrationRequest 
>or both ?
>
>  
>
RegistrationRequestPDU  inherits from RasPDU using template H225_RegistrationRequest ?


-- 
Liviu Voicu
Assistant Programmer and network support
Computation Center, Mount Scopus
Hebrew University of Jerusalem
Tel: 972(2)-5881253
E-mail: "Liviu Voicu"<pacman@mscc.huji.ac.il>

/**
 * cat /usr/src/linux/arch/i386/boot/bzImage > /dev/dsp
 * ( and the voice of God will be heard! )
 *
 */

Click here to see my GPG signature:
----------------------------------
	http://search.keyserver.net:11371/pks/lookup?template=netensearch%2Cnetennomatch%2Cnetenerror&search=pacman%40mscc.huji.ac.il&op=vindex&fingerprint=on&submit=Get+List


