From: Daniel Hilst Selli <danielhilst@gmail.com>
Subject: passing arguments to pthreads
Date: Fri, 14 Mar 2014 12:08:57 -0300
Message-ID: <53231B89.2020104@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=zich+SQ0vdjj03KbUlu+KQHo4maNqQA20TSK8G/NiOk=;
        b=i0p+lRfG+7034RHEYn3V/QqCC8RkWDOv39SdMscJEEn84apYgvw1j5mnFJDTC9+dG5
         4PoytzFuuQPC5FPDUAlhj+4Of6GbOWxtn2CwnxdhvdJJeu1NQFWvbb4a7h+sROSVYYHl
         1PPeDekaEnYlGrXxDJTCu5tjb70rWrR4wYxb8PA4c/wzsdsvmEpjmK9KvyWDc7QmMcML
         Vo6/JJz9na0LDGnow/FvuWRTe17TlEdERmCs/KobHnnAeJfXZHq7oyfTeLTdD0Pl2Gb6
         MWn65G+kLSxj8+yxeWx8mqKHBOGWqgKnhyptD5jyvcXPb2L9YbiX4aHeivGp7prBQwnJ
         Yoog==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi, I have a question about passing multiple arguments to pthreads, the 
big deal is where the paremeters are kept.. I see two possible 
solutions.. keep it on static variables that are never deallocated.. or 
on heap.. so here is my first question

Passing local (stack) variables as arguments to thread is trouble, since 
the scope of this variables can go away before my thread returns..right? 
So forget about local variables

So here is the two options I see, static vs heap...
I'm using this model on one of my applications, is the same senario, a 
function that receives 3 ints as arguments and is called as a thread.. I 
create a little wrapper... here is the code http://pastebin.com/Air7u0YD


How gurus does this? I free the args on threadfd wrapper since, on my 
real application can't join the thread, to be honest, is and deatached 
thread.. Is there something wrong with this strategy, it seems ugly to 
me....

Cheers,

