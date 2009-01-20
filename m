From: Jai Sharma <jai.unix@gmail.com>
Subject: libCurl in C
Date: Wed, 21 Jan 2009 02:13:04 +0530
Message-ID: <1f714d50901201243v289c2e84o19c79adfd0ef463d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=NCGKSGjYux0iqNF7f2SEFbk4En0QejQjfaFb9uRUDcI=;
        b=lD+1yOeu3plJbxY33EZKWa8ffhKFWuwBzCiSI9m5CUCk2rXz2k26fDs3dGkYcufkOR
         MXfNTypFH5WB6CPQVeFJsXjZZoqwK/53eAQ9e7Ca7A+B51hAVtLF9mnFc3ulB7rkimSK
         F9Q15QJ06P2jNNFaJIRarFxMVGhDlbUKZfegI=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Dear Friends,

I am using CURL to get HTTP response.
The default output for CURL is stdout, but i am unable to change it to
a variable.

Right now,
I am using a temporary file for this purpose and read it to process it.
Is there any way, by which method i will get CURL output to a string
or any structure?

===================== main.c =====================

#include <stdio.h>
#include <stdlib.h>
#include <curl/curl.h>

int
main()
{
	CURL *curl;
	char *data1[512];

	FILE *fp;
	fp = fopen("/tmp/curl","w");

	curl = curl_easy_init();
  	if(curl) {
    		curl_easy_setopt(curl, CURLOPT_URL, "http://127.0.0.1");
    		curl_easy_setopt(curl, CURLOPT_HEADER, 0);
		curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
	    	curl_easy_perform(curl);
	    	curl_easy_cleanup(curl);
  	}

	fclose(fp);    	
	return 0;
}

================================================

Thanks and Regards
Jai
