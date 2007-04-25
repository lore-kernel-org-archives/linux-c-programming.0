From: Benoit Fouet <benoit.fouet@purplelabs.com>
Subject: Re: ftw , nftw doesn't work
Date: Wed, 25 Apr 2007 15:43:20 +0200
Message-ID: <462F5AF8.6010108@purplelabs.com>
References: <462F4D67.5090600@zg.t-com.hr> <200704250916.43481.kratzers@pa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200704250916.43481.kratzers@pa.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kratzers@pa.net
Cc: Nikola <root.admin1@zg.t-com.hr>, linux-c-programming@vger.kernel.org

Stephen Kratzer wrote:
> On Wednesday 25 April 2007 08:45:27 Nikola wrote:
>   
>> Hi,
>>
>> I am trying to parse dir tree with ftw and nftw on Linux (debian) but
>> without result.
>>
>> ------------------------------------------------------
>>
>> #include <stdio.h>
>> #include <ftw.h>
>>
>>
>> int fn(const char *file, const struct stat *sb, int flag){
>>
>>         printf("-->\n");
>> }
>>
>>
>> int main(int argc,char **argv){
>>
>>
>>         ftw("/etc/", fn, 5);
>>
>>         return 0;
>> }
>>
>> ------------------------------------------------------
>>
>> bash# gcc test.c
>> bash# ./a.out
>> -->
>> bash#
>>
>> ------------------------------------------------------
>>
>> Does anyone knows what might be the problem.
>>
>> tnx in advance.
>>
>>     
>
> The return value of fn should be 0 if you want the walk to continue past the 
> first file or directory.
>   

and compiling with warning outputs could have helped, too :)
$ gcc -Wall test.c
surely leads to a "control reaches end of a non void function" or
something similar...

Ben

-- 
Purple Labs S.A.
www.purplelabs.com
