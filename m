From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: Fw: Array Empty Slots
Date: Tue, 05 Apr 2005 13:50:57 -0300
Message-ID: <4252C1F1.7050705@ig.com.br>
References: <004f01c539e0$ad829180$0101010a@dioxide> <4252C177.7020601@labristeknoloji.com> <002701c539e8$093d85f0$0101010a@dioxide> <4252C84F.3070600@labristeknoloji.com> <00a301c539eb$43448930$0101010a@dioxide>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <00a301c539eb$43448930$0101010a@dioxide>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris <nanakos@wired-net.gr>
Cc: "M.Baris Demiray" <baris@labristeknoloji.com>, linux-c-programming@vger.kernel.org

I think you ll need a secondary data structure (maybe another array - 
but I prefer a linked list) to flag or store something that could to 
index your main data structure (your array).

Of course, you ll need to feed the secondary structure -- The main 
question: WHERE ? If you could answer this question maybe our can 
suggest you some ways.

Luciano


Chris escreveu:

>Nice try, but this problem has always been a sigificant point for DBMS
>applications, web based or not.
>Maybe i should better explain you the problem. Suppose that we have this
>array below:
>
>array = [ 0,1,2,3,4,5,7,8,9,10];
>
>Which is the quickest way to find the missing sequential number in a sorted
>array of a fixed lenght???
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>
