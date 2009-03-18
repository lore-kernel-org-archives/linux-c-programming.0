From: xcomp@arcor.de
Subject: swapcontext and free memory
Date: Wed, 18 Mar 2009 19:05:51 +0100 (CET)
Message-ID: <18142048.1237399551641.JavaMail.ngmail@webmail17.arcor-online.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arcor.de; s=mail-in;
	t=1237399551; bh=tjGhiQAnqToNs1S1c55Me2C8nRFdzEd22VaGbdmzNpc=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=U7w/hgmjboOJEcJpMkpnrTSUFB8XcEtbU+G06Cad4lVfmGRR7+0cx2T9++nFQDjhV
	 LJjbWAd2rOPKR3bYXfSb2jzTbOmTs5ByQDRNpLYQUZjE1H6bDAMznsm0sI6xWY0Gdq
	 GDlRXZZ/2Riv7D3ru9lTZr3+rAyiMzQaWMmOplyk=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hi all,
I have written a small test case which simply creates a new context, sw=
aps to it and returns to the main function. I am allocating memory for =
the ucontext_t structures and the stack on which the context is execute=
d using malloc. Because of this I also want to deallocate the memory ag=
ain using free. The problem is I can't deallocate the memory after swap=
ping back. It runs only if all three free() calls are commented out. Ot=
herwise a segmentation fault occurs. Does swapcontext handle this on it=
s own? Can anyone explain this behavior? I didn't find anything concern=
ing this problem in the web.
I am running this program on Ubuntu 8.04 with the following system info=
rmation: Linux ubuntu8041 2.6.24-23-generic #1 SMP i686 GNU/Linux

The test program is the following one:
---
#include <stdlib.h>
#include <stdio.h>

#include <ucontext.h>

#define STACKSIZE 4096

void thread_function() {
	printf("\nthread_function was called...");
}

int main(int argc, char** argv) {
	printf("\nStart");

	ucontext_t *main_context, *thread_context;

	main_context =3D (ucontext*) malloc(sizeof(ucontext));
	thread_context =3D (ucontext*) malloc(sizeof(ucontext));

	void* thread_stack =3D malloc(STACKSIZE);

	printf("\n\nAllocated memory:\n\tmain_context:\t%p\n\tthread_context:\=
t%p\n\tthread_stack:\t%p", main_context, thread_context, thread_stack);

	getcontext(thread_context);
	thread_context->uc_stack.ss_sp =3D thread_stack;
	thread_context->uc_stack.ss_size =3D sizeof(thread_stack);
	thread_context->uc_stack.ss_flags =3D 0;
	thread_context->uc_flags =3D 0;
	thread_context->uc_link =3D main_context;
	sigemptyset(&(thread_context->uc_sigmask));
	makecontext(thread_context, thread_function, 0);

	swapcontext(main_context, thread_context);

	printf("\n\nswapcontext() returned. Freeing memory starts now...");

	free(thread_stack);
	printf("\nthread_stack was deallocated...");

	free(thread_context);
	printf("\nthread_context was deallocated...");

	free(main_context);
	printf("\nmain_context was deallocated...");

	printf("\n\nEnd");
}
---

Best,
Matthias :-)

Zerrei=DFen Sie die Netze der Phisher, Hacker und Betr=FCger!
Ihre Internet-Sicherheits-Seiten auf Arcor.de bieten alle Infos und Hil=
fsmittel, die Sie zum sicheren Surfen brauchen! Play it safe!
http://www.arcor.de/footer-sicherheit/
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
