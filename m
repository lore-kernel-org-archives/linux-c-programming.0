From: "Subbulakshmi Sadagopal (RBIN/EDS2) *" <Subbulakshmi.S@in.bosch.com>
Subject: Function call
Date: Wed, 1 Mar 2006 10:54:03 +0530
Message-ID: <CB6A009F461BE24BA3E10DAC95A4B25E12CE1A73@kormail01.in.bosch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>


Hello,

I have a doubt regarding the following code. There is a void function
funckey().

void funckey()
{
;
}

void main()
{
funckey;
funckey();
}

During execution, the second statement calls the function funckey().

What does the compiler do in the first statement funckey?

Thanks in advance, 
Subbulakshmi Sadagopal 

