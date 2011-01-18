From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: array pointer
Date: Tue, 18 Jan 2011 19:02:43 +0530
Message-ID: <AANLkTim=n1tgwJgxnrtsdH0itKew7M2AD5C_Q_qkmtGX@mail.gmail.com>
References: <AANLkTi=n0P0DQSU8a2OMgEaeUAeCNuecjSg0+2MdF8+_@mail.gmail.com>
	<AANLkTi=DzN67nS=+s4408dBkAptJsA97=0EkYY+8WX9d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=PqN7yLFZ1NoSCLWsD9pTfB69WEjQYWgBrUAY8E0Cti8=;
        b=xB7VFrWXEiccruHt7M6dzPNa7TY+opRnaSkoEnJX9YMvIjnfSkddKCanDuZMA6L7SR
         Nm9+vz99cvyXSl77po/vlGVRAERp9QrxdlFafG+eUkTgI3bWDiZqnE6isAshskQj+oV5
         oAXrH8+wrZv1+Bu+wg0ucl41eXNXZT15eKpL0=
In-Reply-To: <AANLkTi=DzN67nS=+s4408dBkAptJsA97=0EkYY+8WX9d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

int  *s_ptr;
int  **d_ptr;
int arr[2][2]=3D{1,2,3,4};

s_ptr=3D*arr;  /* This is perfectly fine */
d_ptr=3Darr /* this line throws a  warning: assignment from incompatibl=
e
pointer type */  ????????



On Tue, Jan 18, 2011 at 6:53 PM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
> i made a mistake =A0d_ptr is =A0int **d_ptr
>
> On Tue, Jan 18, 2011 at 6:52 PM, ratheesh k <ratheesh.ksz@gmail.com> =
wrote:
>> int =A0*s_ptr;
>> int =A0*d_ptr;
>> int arr[2][2]=3D{1,2,3,4};
>>
>> s_ptr=3D*arr; =A0/* This is perfectly fine */
>> d_ptr=3Darr /* this line throws a =A0warning: assignment from incomp=
atible
>> pointer type */
>>
>> What is the problem here ?
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
