From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: [Fwd: Re: Implementing a file counter (like "ls | wc")]
Date: Wed, 07 Apr 2004 13:50:02 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4074313A.5090808@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org

Does exist another way to detect a directory without stat() ?

Luciano


Holger Kiehl wrote:

>On Wed, 7 Apr 2004, Luciano Moreira - igLnx wrote:
>
>  
>
>>-------------- THE CODE HAVE THIS STRUCTURE:
>>while ((pFile=readdir(pDir))!=NULL) {
>>     sprintf(szBuf, "%s/%s", pPath, pFile->d_name);
>>     stat(szBuf, &statFile);
>>     if (S_ISDIR(statFile.st_mode))  /// LOOK THAT: We don't use recursive
>>searching, we count only files at current directory excluding others
>>directories.
>>        continue;
>>
>>     /* Filtering */
>>     if (nNeedFilter) {
>>         //// I DONT HAVE THE CODE OF FILTERING NOW
>>         //// BUT I CAN SEND IT LATER IF NECESSARY
>>        }
>>
>>  }
>>-------------- CODE FINISH HERE
>>
>>    
>>
>Don't use sprintf(), its very expansive. Before the while loop put a pointer
>after path and / and then strcpy(ptr, pFile->d_name)
>
>stat() is _very_ epansive! It means physical IO and fills up a structure
>with things you just don't need. If you really do need to filter out
>directories from your result do the stat after it has passed the filter.
>
>  
>
>>Does have another mechanism to filter without using of strcmp() / memcmp() ?
>>How if we dont know the size of extension (.c, .cpp, .teste, .longextension,
>>and so on). ?
>>
>>    
>>
>Compare them yourself with a pointer byte for byte. But the speed gain
>will not be so high as when you leave away the stat() call.
>
>Holger
>
>
>  
>
