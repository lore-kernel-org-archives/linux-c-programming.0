From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: [Fwd: Re: Implementing a file counter (like "ls | wc")]
Date: 07 Apr 2004 12:54:02 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1081356842.18677.23.camel@Marx.fesnel.no-ip.org>
References: <4074313A.5090808@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4074313A.5090808@ig.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

You should read the GNU source code for ls, they actually filter out
directories in a quite interesting maner. 

instead of using stat which is quite expensive, they try to open each
file as a directory, which is expensive, but not as expensive as stat.  
If a file opens as a directory, then it is, and they treat it as one,
(in your case closing it and ignoring it); else if it fails to open as a
directory, they then use stat to get information about it to print;

a simple counter could look something like (my code is paraphrasing
parts of the GNU code, but is not a copy)  Also treat it as Sudo code
that just looks a lot like C as it is untested (not even compiled) and
is only trying to make the point.
 
___________________________________________________
int count = 0; 
struct dirent dir_entry;
DIR* directory, test;
char buff[512];


directory = opendir('/etc');  
/* check that it opened*/ 
... 

while( dir_entry = readdir(directory) ) {
        strncpy(buff, '/etc/', 6);
        strcat(buff, dir_entry->d_name);
        if( test = opendir( buff ) ) {
                /* gets here the its a directory */ 
                closedir(test);
        } else {
                /* gets here not a directory */ 
                /* code to test if its a regular file */
                count++;
        }
}

closedir(directory);





On Wed, 2004-04-07 at 12:50, Luciano Moreira - igLnx wrote:
> Does exist another way to detect a directory without stat() ?
> 
> Luciano
> 
> 
> Holger Kiehl wrote:
> 
> >On Wed, 7 Apr 2004, Luciano Moreira - igLnx wrote:
> >
> >  
> >
> >>-------------- THE CODE HAVE THIS STRUCTURE:
> >>while ((pFile=readdir(pDir))!=NULL) {
> >>     sprintf(szBuf, "%s/%s", pPath, pFile->d_name);
> >>     stat(szBuf, &statFile);
> >>     if (S_ISDIR(statFile.st_mode))  /// LOOK THAT: We don't use recursive
> >>searching, we count only files at current directory excluding others
> >>directories.
> >>        continue;
> >>
> >>     /* Filtering */
> >>     if (nNeedFilter) {
> >>         //// I DONT HAVE THE CODE OF FILTERING NOW
> >>         //// BUT I CAN SEND IT LATER IF NECESSARY
> >>        }
> >>
> >>  }
> >>-------------- CODE FINISH HERE
> >>
> >>    
> >>
> >Don't use sprintf(), its very expansive. Before the while loop put a pointer
> >after path and / and then strcpy(ptr, pFile->d_name)
> >
> >stat() is _very_ epansive! It means physical IO and fills up a structure
> >with things you just don't need. If you really do need to filter out
> >directories from your result do the stat after it has passed the filter.
> >
> >  
> >
> >>Does have another mechanism to filter without using of strcmp() / memcmp() ?
> >>How if we dont know the size of extension (.c, .cpp, .teste, .longextension,
> >>and so on). ?
> >>
> >>    
> >>
> >Compare them yourself with a pointer byte for byte. But the speed gain
> >will not be so high as when you leave away the stat() call.
> >
> >Holger
> >
> >
> >  
> >
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

