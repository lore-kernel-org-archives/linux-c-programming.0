From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: array pointer
Date: Tue, 18 Jan 2011 19:33:31 +0000
Message-ID: <19765.60171.33627.492803@cerise.gclements.plus.com>
References: <AANLkTi=n0P0DQSU8a2OMgEaeUAeCNuecjSg0+2MdF8+_@mail.gmail.com>
	<AANLkTi=DzN67nS=+s4408dBkAptJsA97=0EkYY+8WX9d@mail.gmail.com>
	<AANLkTim=n1tgwJgxnrtsdH0itKew7M2AD5C_Q_qkmtGX@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <AANLkTim=n1tgwJgxnrtsdH0itKew7M2AD5C_Q_qkmtGX@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org


ratheesh k wrote:

> int  *s_ptr;
> int  **d_ptr;
> int arr[2][2]={1,2,3,4};
> 
> s_ptr=*arr;  /* This is perfectly fine */
> d_ptr=arr /* this line throws a  warning: assignment from incompatible
> pointer type */  ????????

Arrays are not pointers. If you use the name of an array as an
expression, it is treated as a pointer to the first element.

For one-dimensional arrays, this means that you can use an array in
most places where a pointer is required. But this doesn't hold for
higher dimensions; an array of pointers isn't the same as an array of
arrays. It also doesn't hold for many other cases, i.e. sizeof,
variable declarations, etc.

-- 
Glynn Clements <glynn@gclements.plus.com>
