From: "Vineet Joglekar" <vintya@excite.com>
Subject: Problem in encryption in kernel
Date: Mon, 21 Mar 2005 17:16:48 -0500 (EST)
Message-ID: <20050321221648.169188AECF@xprdmailfe2.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org


Hi all,



I am trying to use some encryption routines inside the kernel (2.4.28). I have done the following things, please let me know where I am going wrong, or anything additional needs to be done.



1: defined struct crypto_tfm * tfm and allocated to des using crypto_alloc_tfm()

2: called crypto_cipher_setkey() to set the DES key.

3: defined the ecryption function as follows:



int encrypt(char *buffer, size_t buffer_length)

{

    struct scatterlist sg;

    int ret = 0,i = 0;



    printk("addr sent = %x\n",buffer);

    sg.page = virt_to_page(buffer);

    printk("addr frm virt_to_page = %x\n",sg.page);

// these 2 address are coming out to be different.



    sg.length = 8;

    for(i=0; i < buffer_length; i+=8)

    {

        sg.offset = i;



        ret = crypto_cipher_encrypt(tfm,&sg,&sg,8);

        if(ret) printk("error");

    }

    return ret;

}



Now if I define a character array temp[16], pass it to encrypt as encrypt(temp,16) and on the next line, if I see the the array using printk again, it doesnt show it as encrypted. whats going wrong? (it didnt give any memory fault that this point, maybe it encrypted something else - as the address I saw were different)



I tried to see the address in pointer "buffer" and address returned by "virt_to_page", they are different.



Since the addresses were different, I tried to do following variations, but it always gave some memory fault:

1: instead of using sg.page, i tried to use sg.address as

sg.address = buffer; sg.offset = i;

2 : I tried to assign sg.page = buffer (w/o using virt_to_page) and sg.offset = i;

3: I tried

        sg.page = virt_to_page(buffer);

        sg.offset = ((unsigned long)buffer + ~PAGE_MASK) + i;



So I am stuck and out of ideas now. Please help me with it. All I want is that array getting encrypted after I pass it to the encrypt function (the size should remain the same)



Thanks in advance and regards,



Vineet

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
