From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: Implementing a file counter (like "ls | wc")
Date: Wed, 07 Apr 2004 11:47:42 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4074148E.9060205@ig.com.br>
References: <20040407183558.77510679.alphex@crew.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040407183558.77510679.alphex@crew.org.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alphex K." <alphex@crew.org.ru>
Cc: linux-c-programming@vger.kernel.org

-------------- THE CODE HAVE THIS STRUCTURE:
while ((pFile=readdir(pDir))!=NULL) {
      sprintf(szBuf, "%s/%s", pPath, pFile->d_name);
      stat(szBuf, &statFile);
      if (S_ISDIR(statFile.st_mode))  /// LOOK THAT: We don't use 
recursive searching, we count only files at current directory excluding 
others directories.
         continue;

      /* Filtering */
      if (nNeedFilter) {
          //// I DONT HAVE THE CODE OF FILTERING NOW
          //// BUT I CAN SEND IT LATER IF NECESSARY
         }

   }
-------------- CODE FINISH HERE

Does have another mechanism to filter without using of strcmp() / 
memcmp() ? How if we dont know the size of extension (.c, .cpp, .teste, 
.longextension, and so on). ?

Luciano

Alphex K. wrote:

>On Wed, 07 Apr 2004 11:27:02 -0300
>Luciano Moreira - igLnx <lucianolnx@ig.com.br> wrote:
>
>  
>
>>We implemented a program that use "opendir()", "readdir()", and 
>>"closedir()" to scan a directory and count the files contained into it.
>>    
>>
>How U use this functions?
>But I'm think that it's not good method
>  
>
>>But, it program have taking more time than "ls | wc" to count files.
>>
>>Does have any other way to count files faster?
>>
>>PS: Our program needs sometime to filter files by extension (like: *.c, 
>>*.cpp, and so on. Thus we use strcmp() to compare last letters of both 
>>strings).
>>    
>>
>If U want a more speed don't use strcmp or strncmp functions.
>  
>
>>Luciano
>>
>>    
>>
>U use a C++ ? or C ?
>  
>
>>-
>>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>    
>>
>
>
>---===---
>Alphex Kaanoken
>Senior developer of Crew IT research labs
>web: http://crew.org.ru
>mailto:Alphex@Crew.Org.RU
>
>
>---===---
>Alphex Kaanoken
>Senior developer of Crew IT research labs
>web: http://crew.org.ru
>mailto:Alphex@Crew.Org.RU
>
>
>  
>
