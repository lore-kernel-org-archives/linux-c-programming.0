From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: pass 2 D array in C
Date: Thu, 14 Oct 2004 10:13:50 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <416E7B8E.7080207@ig.com.br>
References: <20041014112615.91429.qmail@web52901.mail.yahoo.com> <416E7A5E.6090603@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <416E7A5E.6090603@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Ankit Jain <ankitjain1580@yahoo.com>, linux prg <linux-c-programming@vger.kernel.org>

Sorry, I found 2 big mistakes !!!
the functions parameters, should be:

fill_array(char **pp, int nLength)
dump_array(char **pp, int nLength)

instead of:
fill_array(char *pp, int nLength)
dump_array(char *pp, int nLength)



Luciano Moreira - igLnx escreveu:

> The following sample was coded now, without compiling, then It can 
> have some mistakes for compiler.
> But I think that it ll can be good for your analyse. Using this 
> sample, you can allocate any kind of array, like as 3D, 4D, 5D, and so 
> on.
>
> Luciano
> ----------------------------------------------------------------------------------------- 
>
> main()
> {
>   int THE_LENGTH = 200; /* Numbers of itens of array */
>   long **p2DArray;
>
>   pp2DArray = new long[THE_LENGTH];
>   /* for C-ANSI: pp2DArray = malloc(sizeof(long) * THE_LENGTH); */
>
>   fill_array(pp2dArray, THE_LENGTH);
>   dump_array(pp2dArray, THE_LENGTH);
>
>   delete pp2DArray;
>  /* forC-ANSI:  free(pp2DArray); */
> }
>
> fill_array(char *pp, int nLength)
> {
>   int ct;
>   for ct(=0; ct<nLength; ct++) {
>      ppArray[ct] = (long) rand();
>   }
> }
>
>
> dump_array(char *pp, int nLength)
> {
>   int ct;
>   for (ct=0; ct<nLength; ct++) {
>      printf("Item %d: %ld\n", ct, ppArray[ct]);
>   }
> }
> ----------------------------------------------------------------------------------------- 
>
>
>
>
> Ankit Jain escreveu:
>
>> its a simple question...
>>
>> how to pass a 2 D array address in C
>>
>> is there any way by **pointer?
>>
>> thanks
>>
>> ankit
>>
>> ________________________________________________________________________
>> Yahoo! Messenger - Communicate instantly..."Ping" your friends today! 
>> Download Messenger Now http://uk.messenger.yahoo.com/download/index.html
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>  
>>
>
