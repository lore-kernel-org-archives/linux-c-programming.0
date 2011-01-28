From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Any problem ?
Date: Fri, 28 Jan 2011 17:23:43 +0530
Message-ID: <AANLkTikRjcxV6+uUr+8_5LHjCMiFf91d00bH7wu7p6CX@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=6xHbbiuNtVImtTZygp8bMDrjldIm8HUOUtSK2Vfp+xE=;
        b=bxsKYw6WvyhLRGle0sTK4dekITdeIsp9QPBiH3AcsV1ykvxNCnDn7t9qmuWQ9h0cX/
         NWF5RTVKLfKEIkcXdNWqaP2JwhbXjnucqo8Zgvrij1scKUzqSAncFxdX9eycoO8nhQmJ
         0oRXVHhj29dgOeOKIvfuSPoO05s3Hz3+vHeH4=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Is there any problem with this below code ? I just want to free memory.


void free_it(char *ptr)
{
 free(ptr);
}


int main()
{
char *str = (char *)malloc(100);
strcpy(str, "Ratheesh");
free_it(str);
str=NULL;
return 0;
}
