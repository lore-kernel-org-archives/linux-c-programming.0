From: Santosh Sivaraj <ssantosh@fossix.org>
Subject: Re: Any problem ?
Date: Fri, 28 Jan 2011 17:32:43 +0530
Message-ID: <4D42B063.8030906@fossix.org>
References: <AANLkTikRjcxV6+uUr+8_5LHjCMiFf91d00bH7wu7p6CX@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <AANLkTikRjcxV6+uUr+8_5LHjCMiFf91d00bH7wu7p6CX@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 01/28/2011 05:23 PM, ratheesh k wrote:
> void free_it(char *ptr)
> {
>   free(ptr);
> }
>
>
> int main()
> {
> char *str = (char *)malloc(100);
> strcpy(str, "Ratheesh");
> free_it(str);
> str=NULL;
> return 0;
> }
Nothing is wrong.. should work fine.

Santosh
--
http://fossix.org
