From: "Joseph D. Wagner" <theman@josephdwagner.info>
Subject: Pointer Woes: Pointer to a Pointer
Date: Tue, 18 Nov 2003 14:30:15 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200311181430.15586.theman@josephdwagner.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

valgrind (a.k.a. memcheck) says that the single line inside the 'for' loop 
below is the cause of my problems, saying things like 'uninitialized 
memory' and 'invalid write'.  However, I can't figure out where I went 
wrong in the line within my for loop.  I'd appreciate an extra/fresh set of 
eyes.

Is the problem in the single line inside the 'for' loop below, or is the 
problem somewhere back in my realloc statements?

FYI:
e2_blkcnt_t is signed 64-bit int
ext2_int_t is unsigned 32-bit int
frag_log is a global variable
block_order_log is a local variable reused for each file examined

TIA.

Joseph D. Wagner

struct block_order_log_t
{
    e2_blkcnt_t total_blocks;
    size_t is_indirect_block_array_size;
    bool *is_indirect_block;
    size_t block_id_array_size;
    blk_t *block_id;
};

struct fragments_log_t
{
    u_int32_t total_fragmented_files;
    size_t inode_id_array_size;
    ext2_ino_t *inode_id;
    size_t parent_inode_id_array_size;
    ext2_ino_t *parent_inode_id;
    size_t total_fragments_array_size;
    e2_blkcnt_t *total_fragments;
    size_t block_order_log_array_size;
    struct block_order_log_t *block_order_log;
};

...

for(e2_blkcnt_t index = 1;
    index <= block_order_log.total_blocks;
    index++)
{
    *((frag_log.block_order_log + frag_log.total_fragmented_files)->block_id 
+ index) = *(block_order_log.block_id + index);
}

