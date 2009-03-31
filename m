From: beginner_h4x3r <nightdecoder@gmail.com>
Subject: Re: Linux process...
Date: Tue, 31 Mar 2009 08:12:59 +0700
Message-ID: <34e1241d0903301812t3197a0f0n8e5888b032095127@mail.gmail.com>
References: <34e1241d0903292306m3e879639u4752e821349c84ee@mail.gmail.com>
	 <49D0AEAF.1070607@somanetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=O+wzwE/uGuLQCBikSrfAmKVMYRWm/Mwaoq3au75Xf4c=;
        b=LbMpnlqM/yLECTiMMiHtH0RgHJsUxm8Ng05BATVM1K8EPJ8x1v8LMrjimjJ58QA1Se
         0xRz8nWr0HBQsnRDeMRVlDr/qTluU98r6yxnE9l9UQp+6twTChC6Ka10ObuemNkW5uO9
         4mINbTbxhPOQLc/yeD0UbfVmXt5u/ZqAO5EG0=
In-Reply-To: <49D0AEAF.1070607@somanetworks.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabian Ischia <fischia@somanetworks.com>
Cc: linux-c-programming@vger.kernel.org

Okay, so the child process was not actually access it's parent
variable, the child given a copy (i have learned about Copy On Write
mechanism too).  But it is like a C language issue: we can access any
variable which declared in that function in this case main() function.
So in my code, when i try to access stack_int variable in child
process, it's not wrong, compiler even recognize this as 'valid'
approach... How about my conclusion?

On Mon, Mar 30, 2009 at 6:36 PM, Fabian Ischia <fischia@somanetworks.com> wrote:
> From the example code, I think the answer is a bit simpler than it looks
> like. The address space is "duplicated" not "shared". Whatever you do in one
> process "after" the fork will not affect the other process.
> The Child process has not initialized the variable, so being a stack
> variable it just contains garbage.
>
> Fabian
>
> beginner_h4x3r wrote:
>>
>> Hi All..
>>
>> I am a beginner hacker, i want to learn Linux from scratch. I read
>> some resources on Linux's process management. Process duplicates it's
>> page table to it's child process, right? so i wrote demonstrate code
>> to prove this.
>>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <unistd.h>
>> #include <sys/types.h>
>> #include <sys/wait.h>
>>
>> int main (void) {
>>  pid_t child;
>>  int stack_int;
>>
>>  child = fork ();
>>  if (child == 0) {
>>      sleep (1); /* ;p */
>>      printf ("child process stack_int value %i, address: %p\n",
>> stack_int, &stack_int);
>>      exit (0);
>>    }
>>  if (child == -1) {
>>      perror ("fork");
>>      return -1;
>>    }
>>  stack_int = 32;
>>  printf ("main process stack_int value %i, address: %p\n", stack_int,
>> &stack_int);
>>  waitpid (child, NULL, 0);
>>
>>  return 0;
>> }
>>
>> The output is:
>> main process stack_int value 32, address: 0xbf9c66ec
>> child process stack_int value 8495092, address: 0xbf9c66ec
>>
>> stack_int value is different from parent and it's child.
>>
>> My question: why the stack_int has a same address between parent and
>> it's child ?, but confusedly... they have a different value, i was
>> though it should be different, since process duplicate it's page to
>> child, please explain me. ;)
>>
>> Thanks before.
>>
>> --- curious_hacker
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
