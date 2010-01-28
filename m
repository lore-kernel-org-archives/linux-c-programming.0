From: =?UTF-8?B?VcSfdXIgQVRB?= <ataugur@gmail.com>
Subject: Ever Increasing Stack Size and not reclaimed
Date: Thu, 28 Jan 2010 11:56:45 +0200
Message-ID: <8eec89ee1001280156k5fa5b999q78171193399f2b9f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:from:date:message-id
         :subject:to:content-type;
        bh=Q2PkLN9VG4qOrK7U3vlyb4X/U7ZTWAoW+CYyg3meEAM=;
        b=WMgidEURyGpETW7NfJYof6VX2BTpsN+ba+P4FNxCliwKWF5bedENDFpLl77J8nlMkh
         YS3KKEXSt1zC6gCDVeuThzSwr5IGHRKcSkmbtZJRcL51s5stcl50lou7BrfRXQ5G3v08
         Rei9aLA3bS71bTLdpImoMoC/kcD8GXfT+xsVU=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

I have a problem with a deamon process that I have written. It is
listening some text commands on a local socket and does some
background job. I am using the same executable to send commands to the
deamon process. What I observe is that it crashes after some time and
it is only when RSS size reaches 65500K.

I suspected of a heap problem at first and i have used valgrind to
track memory issues. It helped me to find some minor memory leaks but
it didn't affect much. Later I have written a logging method to log
current memory usage when called as below:

void getMemoryUsage(char *position) {
    char result[BUFFER_SIZE + 1];
    char* command =
    "ps -eaf | grep BSM | grep -v grep | awk '{print $2}' | xargs ps
-ly -p | tail -1";

    FILE* ptr;

    pthread_mutex_lock(&mutex_mem);
    if ((ptr = popen(command, "r")) != NULL) {
        fgets (result, BUFFER_SIZE, ptr);
        int len = strlen(result);
        result[len - 1] = '\0';
        log_debug("|%s||%s|\n", position, result);
    }
    pthread_mutex_unlock(&mutex_mem);

    pclose(ptr);
}

Sample output for this is:

[2010-01-28 12:31:19.162] |::loop1::||S     0 13967     1  0  80   0
944  5170 pipe_w pts/1    00:00:00 limit|


What i recoginezed is that the RSS value increases in each different
method call by 4K in the first call only.

For example in the following command RSS increases by 4K but only in
the first time. When it is called again RSS does not change:
    char* end_of_command = strchr(message, KEY_SOCKET_SEPERATOR);

This is almost the same for every other method type. So I thought that
it is because of the stack increase in each call or something. The
problem is that RSS usage never drops when a method returns and keeps
increasing in each call thus reaching near 65M and program crashes.

Does anybody have a clue on what might be causing that weird behaviour?

Thanks in advance.
