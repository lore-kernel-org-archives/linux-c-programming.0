From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: error func
Date: Sat, 9 Jul 2005 18:36:44 +0100
Message-ID: <17104.2860.755765.390496@gargle.gargle.HOWL>
References: <42CE5868.8@effigent.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42CE5868.8@effigent.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: raja <vnagaraju@effigent.net>
Cc: linux-c-programming@vger.kernel.org


raja wrote:

>    I am writing a function that takes the return value of the another 
> function and gives the  status of the function.
> if
>    error("functionName",arguments)
> here the function with Name "functionName " is to be executed with the 
> corresponding argunents.But by knowing the function name how can i get 
> the address if that function

dlsym().

> and how can i execute the function with the arguments.

You can't portably make a function call where the number of arguments
isn't known at compile time.

-- 
Glynn Clements <glynn@gclements.plus.com>
