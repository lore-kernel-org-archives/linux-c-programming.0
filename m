From: Fabian Ischia <fischia@somanetworks.com>
Subject: Re: libCurl in C
Date: Tue, 20 Jan 2009 15:52:31 -0500
Message-ID: <4976398F.6000502@somanetworks.com>
References: <1f714d50901201243v289c2e84o19c79adfd0ef463d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1f714d50901201243v289c2e84o19c79adfd0ef463d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jai Sharma <jai.unix@gmail.com>
Cc: linux-c-programming@vger.kernel.org

You have to set a write function that will be called when curl receives 
the data. You can do whatever you want with the raw info retrieved by 
the funciton

........
curl_easy_setopt(handle, CURLOPT_WRITEFUNCTION, write_data);
..........


size_t write_data(void *buffer, size_t size, size_t nmemb, void *userp)
{
    char *data;

    fprintf(stderr, "Allocating %ld * %ld = %ld\n", (long)size, 
(long)nmemb, (long)(size * nmemb));
    data = calloc(size, nmemb);
    if(!data)
        return -1;
    fprintf(stderr, "Allocation succeeded\n");

    memcpy(data, buffer, size * nmemb);

    return size * nmemb;
}


Jai Sharma wrote:
> Dear Friends,
>
> I am using CURL to get HTTP response.
> The default output for CURL is stdout, but i am unable to change it to
> a variable.
>
> Right now,
> I am using a temporary file for this purpose and read it to process it.
> Is there any way, by which method i will get CURL output to a string
> or any structure?
>
> ===================== main.c =====================
>
> #include <stdio.h>
> #include <stdlib.h>
> #include <curl/curl.h>
>
> int
> main()
> {
> 	CURL *curl;
> 	char *data1[512];
>
> 	FILE *fp;
> 	fp = fopen("/tmp/curl","w");
>
> 	curl = curl_easy_init();
>   	if(curl) {
>     		curl_easy_setopt(curl, CURLOPT_URL, "http://127.0.0.1");
>     		curl_easy_setopt(curl, CURLOPT_HEADER, 0);
> 		curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
> 	    	curl_easy_perform(curl);
> 	    	curl_easy_cleanup(curl);
>   	}
>
> 	fclose(fp);    	
> 	return 0;
> }
>
> ================================================
>
> Thanks and Regards
> Jai
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
