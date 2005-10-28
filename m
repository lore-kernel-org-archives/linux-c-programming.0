From: Fabio Andres Miranda <fabiomiranda@racsa.co.cr>
Subject: Pointers to int
Date: Fri, 28 Oct 2005 07:19:26 -0600
Message-ID: <4362255E.90303@racsa.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello,

Can anyone explain to the list how this pointers to int work:
    int *p;
    p = (int *)(array);
    for (i = 0; i < arraysize - 1; i += 4)
        *p++ = j - 8;
    *p = 0x0;

P is defined as a pointer to a int. Then, it points to (the beginning ? 
) a char array.
What is the result of perform the instruction: *p++; ?
First, what is it? It adds 1 to what?

Thanks for a detailed explanation,

fabolo
