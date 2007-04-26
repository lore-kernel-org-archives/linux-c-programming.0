From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: -ffunction-sections -Wl,--gc-sections trick and class members
Date: Thu, 26 Apr 2007 23:00:47 +0530
Message-ID: <4630E1C7.40804@gmail.com>
References: <46277EF0.900@gmail.com> <17959.34609.888091.432080@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020501020105010407040900"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17959.34609.888091.432080@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------020501020105010407040900
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Glynn Clements wrote:
> OTOH, I suspect that virtual methods are always "used" when
> intialising the virtual method table, so it's less likely that they
> could be omitted.
> 
> If you want a definite answer, test it.

Well I tested it and it is obvious that the trick is able to weed out 
unused class members too -- run the contents of the attachment.

But I did not comprehend how you suspect that having virtual function (I 
presume methods are the same as functions) will create different 
results. Can you make an example based on the example I attach here?

Thanks.

Shriramana Sharma.

--------------020501020105010407040900
Content-Type: application/gzip;
 name="class-member-function-sections.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="class-member-function-sections.tar.gz"

H4sICPjgMEYAA1NwSFVYYS50YXIA7ZdNT+MwEEBzxb9iKFoJBG7t5kvqrvaCxI0zl72kTtIa
pXZVJ0hotf997UBStG0IS0srxDypsuKMM0nHz05EkRhDF9limq1oXilRSq2oyerWjLx9wCxx
GLqWxyF72TZ4nEU84BHzI+4xHsUs8CDcS/YeKlMmKwDPJIt7lSSdcX3nPyni9fovHuuAoVgu
35/DFTgKgs76B9xv688DO0/G7sgDtr/H7OaL1/8MpBJFlWYwaGo9H5B17w9hylTqn4Q8aJnC
7eO1i4HJBHK5MuXN84yBczuihAQuyG9yslzZg9z2DTrj6xAD5TyDh6SoMviWDn+pwZW7BHwn
fzbz2TmpVfofCf8Z0Jvx2KU4Cm/0f75Ljj7/uR89+x/GLLbr/5iFfoD+H4K6vI1mVqVlNS2k
gAk5qf3rkNz68nS+S0onlP0d++mQPvr8T6TabfP33uI/b/3nPHb+++j/Ydi+/xOnsau9Nbr2
vN5lm70119otAK4ZbqwQ46+8m34+evyfVrJId83R9/3nR1H7/j92+z+PY/tKgP4fgLNTGE2l
Gpk5IbPLS6AzoAKaZf9l1/pLsO3VUGamlGo2VNrNnadxuo3VpDBAiy0XBppvTLbtyeDV0PUd
bM0P9K64onQm1iPrOzr2v44gCIIgCIIgCIIgCIIgCIIgH8tf89m7wgAoAAA=
--------------020501020105010407040900--

