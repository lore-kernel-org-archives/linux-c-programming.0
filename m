From: David McMurray <david@davidmcmurray.net>
Subject: Re: array pointer
Date: Tue, 18 Jan 2011 16:59:44 +0000
Message-ID: <AANLkTikhBuoMeq+Ayt0kd=nR6=zJvE9mDzqX-eUF_n+1@mail.gmail.com>
References: <AANLkTi=n0P0DQSU8a2OMgEaeUAeCNuecjSg0+2MdF8+_@mail.gmail.com>
	<AANLkTi=DzN67nS=+s4408dBkAptJsA97=0EkYY+8WX9d@mail.gmail.com>
	<AANLkTim=n1tgwJgxnrtsdH0itKew7M2AD5C_Q_qkmtGX@mail.gmail.com>
	<op.vpid0asz3l0zgt@mnazarewicz.zrh.corp.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=74odaAENsBMTSQ1tFRZndtGyuE9ys34k0EJNZc/LHOw=;
        b=TfMtKusZW7Px/CQtNqcuCtpZaeYKgup6SoNdmsCJnDASLX2eYAEVwuvU7qAe+ZGpNo
         T+OLnVKlJzPrOtt+o9d+ZeR1deKRnL73HRJGCKYT5+Wf8E0M5nwG1VDQZiCE4GWx5Bzz
         C9mW12M5VfLjJPFfHnfEQJ1SEoXjKQ+PtM1rk=
In-Reply-To: <op.vpid0asz3l0zgt@mnazarewicz.zrh.corp.google.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

>> int =A0*s_ptr;
>> int =A0**d_ptr;
>> int arr[2][2]=3D{1,2,3,4};
>
> One image is worth a thousand words, so here it goes:
>
> arr is something like this in memory:
>
> +---+---+---+---+
> | 1 | 2 | 3 | 4 |
> +---+---+---+---+
>
> d_ptr would require something like:
>
> +---------+---------+
> | pointer | pointer |
> +----|----+----|----+
> =A0 =A0 | =A0 =A0 =A0 =A0 | =A0 =A0 +---+---+
> =A0 =A0 | =A0 =A0 =A0 =A0 +---> | 3 | 4 |
> =A0 =A0 | =A0 =A0 +---+---+ +---+---+
> =A0 =A0 +---> | 1 | 2 |
> =A0 =A0 =A0 =A0 =A0 +---+---+
>
> Ie. in arr all the numbers are lied linearly in memory whereas
> int **d_ptr is an array of pointers to array of ints.

I would say int **d_ptr is really a pointer to a pointer and not
necessarily an array of pointers.

So, the following is fine:
d_ptr =3D &s_ptr;
printf("s_ptr: %d, d_ptr: %d\n", *s_ptr, **d_ptr);

and displays "s_ptr: 1, d_ptr: 1"

To (attempt to) answer your original question though, the problem is
that "arr" will give you the address of the array, not the address of
a pointer to the array. For each extra dimension of the array you need
to add a * when referring to the name of the array without indices in
order to de-reference the additional dimensions.

So,
1-dimensional array
int *s_ptr;
int arr[2]=3D{1,2};
s_ptr =3D arr; /* Ok because arr references the address of the array
immediately */

2-dimensional array
int *s_ptr;
in arr[2][2]=3D{1,2,3,4};
s_ptr =3D *arr; /* Ok because the * de-references arr to the address of
the array, but arr is not the address of a pointer to the array */

3-dimensional array
int *s_ptr;
int arr[2][2][2]=3D{1,2,3,4,5,6,7,8};
s_ptr =3D **arr; /* Ok, again each * de-references additional dimension=
s
of the array */

But these references are not pointers, which is why int **d_ptr; int
arr[2][2]=3D{1,2,3,4}; d_ptr =3D arr; will not work, arr will not be a
pointer to a pointer.

HTH,
David McMurray.
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
