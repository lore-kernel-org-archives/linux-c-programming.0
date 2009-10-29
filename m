From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: Re: code to list contents of zip files
Date: Thu, 29 Oct 2009 15:03:52 +0530
Message-ID: <4AE96180.8000807@sun.com>
References: <4ADDADEE.1060806@sun.com>
 <19165.47003.922855.202636@cerise.gclements.plus.com>
 <4ADEFDE3.9000303@sun.com>
 <19167.22609.946075.575192@cerise.gclements.plus.com>
 <4AE04FD0.9080603@sun.com> <4AE94373.8020702@sun.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_pa4eSbvc17VfjRUqSo9i+A)"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <4AE94373.8020702@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>, Glynn Clements <glynn@gclements.plus.com>

This is a multi-part message in MIME format.

--Boundary_(ID_pa4eSbvc17VfjRUqSo9i+A)
Content-type: text/plain; CHARSET=US-ASCII; format=flowed
Content-transfer-encoding: 7BIT

Hi All,

Is it possible to output the content of a particular file from a zip file?
For example, in the attached ziptest.c I want to get the contents of a 
particular file Class3.class from testclasses.zip into a buffer, can 
anyone point out what I need to change in the code?

Thx in advance
Prasanta Sadhukhan wrote:
>> Thanks Glynn.
>> I tried to rectify the flaw and now I am getting the whole file 
>> contents from the zip file, ie., it is outputting the contents of the 
>> file stored in the zipfile.
>> But Actually, I wanted only to list the content of the zip file as 
>> zipinfo does.
>>
>> Regards
>> Prasanta
>> Glynn Clements wrote:
>>> Prasanta Sadhukhan wrote:
>>>
>>>  
>>>> I have tried to create a ziptest code with the information found 
>>>> but when I tried to inflate the contents by calling inflate() 
>>>> [line68], I am getting Z_DATA_ERROR citing  input data is corrupted 
>>>> or not conforming to zlib format but I can do zipinfo or unzip on 
>>>> the attached ziptest.zip file successfully (and also the zip header 
>>>> is found to be valid by the header validity check done in the program)
>>>> Can anyone point me as to what should I being more to get rid of 
>>>> this problem?
>>>>     
>>>
>>> I've found 3 flaws:
>>>
>>> 1. You're not skipping over the variable-length fields (file name and
>>> extra field) at the end of the header; add:
>>>
>>>     fseek(file, SH(&h[LOCFIL]), SEEK_CUR);
>>>     fseek(file, SH(&h[LOCEXT]), SEEK_CUR);
>>>
>>> after reading the header but before calling inf().
>>>
>>> 2. You're trying to inflate() everything up to end-of-file, when you
>>> should be using the compressed length from the header (LOCSIZ) to
>>> determine how much compressed data is available (even with only one
>>> file, the central directory occurs at the end of the file).
>>>
>>> 3. This one wasn't obvious until I looked at the unzip source code. 
>>> You need to call inflateInit2(&strm, -15) rather than inflateInit(),
>>> in order to have it process "raw" data. zlib.h says:
>>>
>>>      windowBits can also be -8..-15 for raw inflate. In this case, 
>>> -windowBits
>>>    determines the window size. inflate() will then process raw 
>>> deflate data,
>>>    not looking for a zlib or gzip header, not generating a check 
>>> value, and not
>>>    looking for any check values for comparison at the end of the 
>>> stream. This
>>>    is for use with other formats that use the deflate compressed 
>>> data format
>>>    such as zip. ...
>>>
>>> IOW, inflateInit() expects the data to be "wrapped" with a zlib or
>>> gzip header and trailer, but ZIP files don't have these.
>>>
>>> After fixing the above issues, I get C source code on stdout.
>>>
>>>   
>>


--Boundary_(ID_pa4eSbvc17VfjRUqSo9i+A)
Content-type: application/x-zip-compressed; name=testclasses.zip
Content-transfer-encoding: BASE64
Content-disposition: inline; filename=testclasses.zip

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
BQYAAAAAAwADAO0AAABxHQAAAAA=

--Boundary_(ID_pa4eSbvc17VfjRUqSo9i+A)
Content-type: text/plain; name=ziptest.c
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=ziptest.c

#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include <zlib.h>
#include <errno.h>
#include <assert.h>

#define CHUNK 16384

/* PKZIP header definitions */
#define ZIPMAG 0x4b50           /* two-byte zip lead-in */
#define LOCREM 0x0403           /* remaining two bytes in zip signature */
#define LOCSIG 0x04034b50L      /* full signature */
#define LOCFLG 4                /* offset of bit flag */
#define  CRPFLG 1               /*  bit for encrypted entry */
#define  EXTFLG 8               /*  bit for extended local header */
#define LOCHOW 6                /* offset of compression method */
#define LOCTIM 8                /* file mod time (for decryption) */
#define LOCCRC 12               /* offset of crc */
#define LOCSIZ 16               /* offset of compressed size */
#define LOCLEN 20               /* offset of uncompressed length */
#define LOCFIL 24               /* offset of file name field length */
#define LOCEXT 26               /* offset of extra field length */
#define LOCHDR 28               /* size of local header, including LOCREM */
#define EXTHDR 16               /* size of extended local header, inc sig */

#define SH(p) ((unsigned short)(unsigned char)((p)[0]) | ((unsigned short)(unsigned char)((p)[1]) << 8))

int inf(FILE *source, FILE *dest)
{
    int ret;
    unsigned have;
    z_stream strm;
    unsigned char in[CHUNK];
    unsigned char out[CHUNK];
	unsigned char dict;

    /* allocate inflate state */
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.avail_in = 0;
    strm.next_in = Z_NULL;
    ret = inflateInit2(&strm, -15);
    if (ret != Z_OK) {
		printf("inflateInit failed\n");
        return ret;
	}

		printf("inflateInit succeeded\n");
    /* decompress until deflate stream ends or end of file */
    do {
        strm.avail_in = fread(in, 1, CHUNK, source);
        if (ferror(source)) {
			printf("fread failed\n");
            (void)inflateEnd(&strm);
            return Z_ERRNO;
        }
		printf("fread succeeded\n");
        if (strm.avail_in == 0)
            break;
        strm.next_in = in;

        /* run inflate() on input until output buffer not full */
        do {
            strm.avail_out = CHUNK;
            strm.next_out = out;
            ret = inflate(&strm, Z_NO_FLUSH);
            assert(ret != Z_STREAM_ERROR);  /* state not clobbered */
            switch (ret) {
            case Z_NEED_DICT:
		printf("inflate returned Z_NEED_DICT\n");
                ret = Z_DATA_ERROR;     /* and fall through */
            case Z_DATA_ERROR:
		printf("inflate returned Z_DATA_ERROR\n");
            case Z_MEM_ERROR:
		printf("inflate returned Z_MEM_ERROR\n");
                (void)inflateEnd(&strm);
                return ret;
            }
		printf("inflate succeeded\n");
            have = CHUNK - strm.avail_out;
            if (fwrite(out, 1, have, dest) != have || ferror(dest)) {
		printf("fwrite failed\n");
                (void)inflateEnd(&strm);
                return Z_ERRNO;
            }
        } while (strm.avail_out == 0);

        /* done when inflate() says it's done */
    } while (ret != Z_STREAM_END);

    /* clean up and return */
    (void)inflateEnd(&strm);
    return ret == Z_STREAM_END ? Z_OK : Z_DATA_ERROR;
}

/* report a zlib or i/o error */
void zerr(int ret)
{
    fputs("ziptest: ", stderr);
    switch (ret) {
    case Z_ERRNO:
        if (ferror(stdin))
            fputs("error reading stdin\n", stderr);
        if (ferror(stdout))
            fputs("error writing stdout\n", stderr);
        break;
    case Z_STREAM_ERROR:
        fputs("invalid compression level\n", stderr);
        break;
    case Z_DATA_ERROR:
        fputs("invalid or incomplete deflate data\n", stderr);
        break;
    case Z_MEM_ERROR:
        fputs("out of memory\n", stderr);
        break;
    case Z_VERSION_ERROR:
        fputs("zlib version mismatch!\n", stderr);
    }
}

int main(char *argc, char **argv)
{
	char str[] = "./testclasses.zip/package1/package3/Class3.class";
	char *substr = strcasestr(str, ".zip");
	char *loc;
	char *zipfile;
	int errnum;
	unsigned short n;
	unsigned char h[LOCHDR];
	int ret;

	if (substr == NULL) {
		printf("zip not found\n");
		substr = strcasestr(str, ".jar");
		if (substr == NULL) 
			printf("jar not found\n");
		else
			printf("jar found at location: %s\n",substr);
	}
	else
		printf("zip found at location: %s\n",substr);
	if (*(substr+4) == '\0')
		printf("zip/jar found at last\n");

	loc = (char*)malloc(substr-str+4);
	strncpy(loc, str, substr-str+4);
	printf("zip path = %s\n",loc);

	zipfile = substr+4+1;
	printf("zipfile %s\n", zipfile);

	errno = 0;
	FILE* file = fopen(loc, "r");
	if (file == (FILE*)NULL)
		printf("cannot open zipfile. errno %d\n",errno);
	else 
		printf("file %p\n", file);

	n = getc(file);
	printf("n %x\n",n);
	n |= getc(file) << 8;
	printf("n %x\n",n);
	printf("getc returns n = 0x%x, errno %d\n", n, errno);
	if (n == ZIPMAG)
	{
		if (fread((char *)h, 1, LOCHDR, file) != LOCHDR || SH(h) != LOCREM) {
			printf("invalid zipfile");
		}
		else
			printf("valid zip or jar file\n");
	} else
		printf("input not a zip file\n");

	fseek(file, SH(&h[LOCFIL]), SEEK_CUR);
	fseek(file, SH(&h[LOCEXT]), SEEK_CUR);
	ret = inf(file, stdout);
	if (ret != Z_OK)
		zerr(ret);
}

--Boundary_(ID_pa4eSbvc17VfjRUqSo9i+A)--
