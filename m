From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: array pointer
Date: Tue, 18 Jan 2011 18:52:51 +0530
Message-ID: <AANLkTi=n0P0DQSU8a2OMgEaeUAeCNuecjSg0+2MdF8+_@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=P+9cMgOmZncRE9y4EJvzjXFssG58VQmrVwI4D/mftJI=;
        b=ChjcqwrmSDY2U1sytZg/TCjZeFIDIeYFrdZI95P5s/hPWp1wAfRuqchUMRlG7cxBMv
         YD6B5N2RCtXK+CHAfrPcYdaM+vNKAE8Wfy/IbEiqFJUK8IdIt+OE9DgYX6Ncdn7gL2St
         dNacsevv1j/JynF/o9nT+ACHlGvLkSF+xUyQg=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

int  *s_ptr;
int  *d_ptr;
int arr[2][2]={1,2,3,4};

s_ptr=*arr;  /* This is perfectly fine */
d_ptr=arr /* this line throws a  warning: assignment from incompatible
pointer type */

What is the problem here ?
