From: "Sandro Dangui" <sdangui@nortelnetworks.com>
Subject: RE: C++ class inheritance
Date: Thu, 2 Oct 2003 09:27:51 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <31E38B53D182D51195FA00508BE3A33402C89DFB@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rafael@thinkfreak.com.br, linux-c-programming@vger.kernel.org


RasPDU is a template.
If you look at its .h file you will see something like this:

template <class T> 
class RasPDU
{
  ...
};

In your case, "T" will be replaced (compiler) by H225_RegistrationRequest.
In my opinion, tamplates are the most powerful feature of C++.




-----Original Message-----
From: Rafael Costa dos Santos [mailto:rafael@thinkfreak.com.br] 
Sent: quinta-feira, 2 de outubro de 2003 01:00
To: linux-c-programming@vger.kernel.org
Subject: C++ class inheritance



Can anyone explain me what does < > means ? 
Example:

class RegistrationRequestPDU : public RasPDU<H225_RegistrationRequest> { } ;

Is "RegistrationRequestPDU" inheriting from RasPDU, H225_RegistrationRequest

or both ?

-- 
Rafael Costa dos Santos
rafael@thinkfreak.com.br
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
