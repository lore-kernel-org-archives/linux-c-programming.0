From: Hemant Mohan <hemantm@pune.tcs.co.in>
Subject: Memory Leak issue
Date: Sat, 16 Nov 2002 12:29:38 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OF7DE96D1E.50C4E532-ON65256C73.002605A2@pune.tcs.co.in>
Reply-To: hemantm@pune.tcs.co.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,
Is it possible to have a C function return a char*, and have void arguememnts 
without the caller having to free the memory??
I mean something like this:

char* foo(void)
{
   char *ret;
   .....
   .....  
  
   return(ret);
}

int main()
{
   ....
   char * temp;
   temp = foo();
   /* here I don't want to do a free(temp) */
   .....

}

To my understanding in this case the function foo will have to internally to 
do a malloc for ret before doing any processing on it. And it will not be 
able free this memory.  This implies that the calling function will have to 
free the return pointer of foo somewhere to prevent any memory leakeage.  Is 
there any alternative solution to return a char* ?

Thanks,
Hemant Mohan
