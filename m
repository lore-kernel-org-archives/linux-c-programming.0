From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: Fw: Array Empty Slots
Date: Tue, 05 Apr 2005 16:51:26 -0300
Message-ID: <4252EC3E.2010803@ig.com.br>
References: <004f01c539e0$ad829180$0101010a@dioxide>    <4252C177.7020601@labristeknoloji.com>    <002701c539e8$093d85f0$0101010a@dioxide>    <4252C84F.3070600@labristeknoloji.com>    <00a301c539eb$43448930$0101010a@dioxide> <4252C1F1.7050705@ig.com.br> <32785.62.38.143.174.1112726575.squirrel@webmail.wired-net.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <32785.62.38.143.174.1112726575.squirrel@webmail.wired-net.gr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: nanakos@wired-net.gr, linux-c-programming@vger.kernel.org

I don't know the best amount of itens, but if you have a low avarage of 
empties slots, maybe is possible to use array as your secondary data 
structure - Although, it ins't the better choice.

The concept is based on having a index to all empties slots, thus you ll 
need a secondary array to store the index of the main array ponting to 
the empties slots.

As you can see, you ll need to search whole itens of the first array 
(then this array needs to be small) looking for index for empties slots, 
if you don't find "empty index" through a especial flag like as 
0xFFFFFFFF (32 bits integer), you will need to go to the end of the main 
array, then you ll need also a special index to point to the last item 
into the main array.

All changes in the main array should be followed by refreshing the new 
empty item into de "INDEX ARRAY", so, you ll need to refresh it on 
load_itens, on delete_item, on inset_item, etc.


THE CONCEPT:
------------
unsigned long nLastIndex;
unsigned lont INDEX_ARRAY[10];
unsigned lont DATA_ARRAY[1000000];

nLastIndex = 600000

INDEX_ARRAY           DATA_ARRAY (MAIN ARRAY)
[0]=2                 [0]=3425
[1]=6                 [1]=798
[2]=0xFFFFFFFF        [2]=<EMPTY>
[3]=1234              [3]=344542
[4]=10000             [...]
[5]=0xFFFFFFFF        [1233]=8797
[6]=500000            [1234]=<EMPTY>
[7]=0xFFFFFFFF        [1235]=63784
[8]=0xFFFFFFFF        [...]
[9]=0xFFFFFFFF        [9999]=19
                      [10000]=<EMPTY>
                      [10001]=789
                      [...]
                      [499999]=9865
                      [500000]=<EMPTY>
                      [500001]=456
                      [...]
                      [600000]=<EMPTY>
                      [600001]=<EMPTY>
                      [600002]=<EMPTY>
                      ...
 
Luciano


nanakos@wired-net.gr escreveu:

>I appreciate your time spent to reply to my question.
>If you have seen the previous posts(emails) , i have an application that
>uses  a C API and retrieves a huge sequential array from a DBMS but some
>slots are empty.We need to find the missing integers from the sequential
>sorted array, so that we can use those slots to fill them with data.
>At the time we speak i use a very very simple algorithm that searches
>sequentially the array and finds the first missing integer,then exits and
>uses the first missing value.But the main problem comes when there is no
>empty value at all ,then we use the n+1 value to store the data.But what
>if the array is bigger than 100000 or bigger.The bottleneck of the
>application is that point.The sequential search is not fast enough after
>some thousands of integers.Do you know an efficient and optimized
>algorithm to solve that problem?? It becomes really slow after i lock the
>DB tables.The second user waits for me to end my array search,retrieve my
>slot and then proceed with my data fill up.
>I am willing to make changes in the application,and follow up with your
>suggestion(s) if the solution can really solve the problem.Can you
>describe your solution with the second data structure( i prefer an array
>).What do u have in mind???
>
>
>Best regards,
>Chris.
>
>
>  
>
>>I think you ll need a secondary data structure (maybe another array -
>>but I prefer a linked list) to flag or store something that could to
>>index your main data structure (your array).
>>
>>Of course, you ll need to feed the secondary structure -- The main
>>question: WHERE ? If you could answer this question maybe our can
>>suggest you some ways.
>>
>>Luciano
>>
>>
>>Chris escreveu:
>>
>>    
>>
>>>Nice try, but this problem has always been a sigificant point for DBMS
>>>applications, web based or not.
>>>Maybe i should better explain you the problem. Suppose that we have this
>>>array below:
>>>
>>>array = [ 0,1,2,3,4,5,7,8,9,10];
>>>
>>>Which is the quickest way to find the missing sequential number in a
>>>sorted
>>>array of a fixed lenght???
>>>
>>>-
>>>To unsubscribe from this list: send the line "unsubscribe
>>>linux-c-programming" in
>>>the body of a message to majordomo@vger.kernel.org
>>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>>
>>>
>>>      
>>>
>>-
>>To unsubscribe from this list: send the line "unsubscribe
>>linux-c-programming" in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>    
>>
>
>
>
>
>  
>
