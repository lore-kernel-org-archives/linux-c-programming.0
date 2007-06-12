From: vadiraj <vadis.list@gmail.com>
Subject: getutline (3) fails on a daemon process
Date: Tue, 12 Jun 2007 20:31:57 +0530
Message-ID: <1181660517.5483.8.camel@blr-img.blr.novell.com>
Reply-To: vadis.list@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:subject:from:reply-to:to:content-type:date:message-id:mime-version:x-mailer:content-transfer-encoding;
        b=haKWd5WhYTxcFZeZaxXIwT9jTGKv573OcV5RFZTIkeKAwumuDQgNrT8qHIUTZaY1d9V5r3Yw9Sewy5LlGPFRcglbiIA+pk6Ad4DE0bp7QwhnW6Cv1rquQtzqSD3BjMBiS599r5F0OBPF5pHATIz1vCZTQ366+8+3oGAxjpH38E0=
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi List,

I'm trying to fetch userid using utmp.h API's. I'm able to get the
userid from the funciton getutline(3) on normal process. But the
same function while called by a daemon process it fails with perror
"no such process".

Any Idea why this is failing on a daemon process? 

here is the sudo code of the program I'm using.


    struct utmp *out_entry ;
    out_entry = calloc(1,sizeof(struct utmp));
    if(out_entry == NULL)
        return -1;

    strcpy (out_entry->ut_line,"pts/0") ;
    out_entry = getutline(out_entry) ;
    if(out_entry != NULL){
        strcpy(username,out_entry->ut_user) ;
        return 0;
    }
    

I have no alternate to get the username, other calls are of no fruit to
me. Only this call is of use to me and it does work on a normal process.
It fails only if the same code is run as a daemon process.


Thanks in advance


Regards,
Vadiraj




