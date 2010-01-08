From: andrej.gelenberg@udo.edu
Subject: Re: float
Date: Fri, 08 Jan 2010 19:00:46 +0100
Message-ID: <cone.1262973646.709094.2988.1000@eeekiste>
References: <a24b3c171001080830l4bb72defr32b60386e4e45ae9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: phoenixxz <vim.xxz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi,

work for me.

cat >test.c <<END
#include <stdio.h>
int main(){
 float i=1.34;
 printf("%f\n",i);
 return 0;
}
END
gcc -o test test.c && ./test

output:
1.340000

phoenixxz writes:

> float i=1.34;
> printf("%f",i);
> 
> 
> ->> 0
> why?
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
