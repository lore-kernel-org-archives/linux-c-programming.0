From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: Re: Misc C question
Date: Thu, 20 Jun 2002 13:35:58 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0206201333470.26820-100000@soochak.ncst.ernet.in>
References: <1293884575.20020620092823@kgpa.ru>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1293884575.20020620092823@kgpa.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Cc: xmp <xmp@multipasto.net.co>, linux-c-programming@vger.kernel.org



Hi,

The simple C function is

	int access(const char *pathname, int mode);

to suit you needs. Read man pages to find out more.

regards...

-- 

**************************************************************************

Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
Assistant Manager II                          (off) : 0091-022-2024641
National Centre for Software Technology   Fax       : 0091-022-2049573 
8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in 	
Mumbai 400021.

Homepage : http://soochak.ncst.ernet.in/~khalid			  	  

**************************************************************************

On Thu, 20 Jun 2002, Oleg O. Ossovitskii wrote:

> Hello xmp,
> 
> Thursday, June 20, 2002, 5:46:02 AM, you wrote:
> 
> x> hi, What is the correct unix-style way to check if a file exists ? create it ? and delete it ?.
> x> Maybe trying to fopen() it and if call != NULL it exist, else it doesnt?.
> x> I want to know the most standard and used in system such as FreeBSD and solaris, linux.
> 
> You should use stat() function:
> 
> =========================================================================
> stat()
> get information about a file or directory
> 
> Synopsis:
> #include <sys/stat.h>
> int stat( const char *path, struct stat *buf );
> Description:
> The stat() function obtains information about the file or directory referenced in path. This information is placed in the structure located at the address indicated by buf. 
> 
> 
> --------------------------------------------------------------------------------
>  This function follows symbolic links and gives you information about the resulting file or directory. If you want information about the link itself, use lstat() instead. 
> 
> --------------------------------------------------------------------------------
> 
> The file <sys/stat.h> contains definitions for the structure stat. 
> 
> At least the following macros are defined in the <sys/stat.h> header file: 
> 
> S_ISBLK(m) 
> Test for block special file. 
> S_ISCHR(m) 
> Test for character special file. 
> S_ISDIR(m) 
> Test for directory file. 
> S_ISFIFO(m) 
> Test for FIFO. 
> S_ISREG(m) 
> Test for regular file. 
> The value m supplied to the macros is the value of the st_mode field of a stat structure. The macro evaluates to a nonzero value if the test is true, and zero if the test is false. 
> 
> The access permissions for the file or directory are specified as a combination of bits in the st_mode field of a stat structure. These bits are defined in the <sys/stat.h> header file, and are described in the section on this file in the Header Files chapter. The following bits are also encoded in the st_mode field: 
> 
> S_ISUID 
> Set user ID on execution. The process's effective user ID is set to that of the owner of the file when the file is run as a program. On a regular file, this bit should be cleared on any write. 
> S_ISGID 
> Set group ID on execution. Set effective group ID on the process to the file's group when the file is run as a program. On a regular file, this bit should be cleared on any write. 
> Returns:
> 0 
> the information was successfully obtained. 
> -1 
> the information wasn't successfully obtained. 
> Errors:
> EACCES 
> Search permission is denied for a component of path. 
> EIO 
> A physical error occurred on the block device. 
> ENAMETOOLONG 
> The argument path exceeds PATH_MAX in length, or a pathname component is longer than NAME_MAX. These manifests are defined in the <limits.h> header file. 
> ENOENT 
> The named file doesn't exist, or path is an empty string. 
> ENOTDIR 
> A component of path isn't a directory. 
> Examples:
> #include <stdio.h>
> #include <sys/stat.h>
> 
> void main()
>   {
>     struct stat buf;
> 
>     if( stat( "file", &buf ) != -1 ) {
>       printf( "File size = %d\n", buf.st_size );
>     }
>   }
> 
> ===================================================================================
> 
> 
> Best regards, Oleg O. Ossovitskii
> programming engineer, KGPA Ltd.
> tel: +7(0112)46-23-40, fax: +7(0112)43-64-96
> mailto:oleg@kgpa.ru, icq# 33366588
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

