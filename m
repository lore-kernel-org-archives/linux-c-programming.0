From: "Joseph D. Wagner" <theman@josephdwagner.info>
Subject: Re: Pointer Woes: Pointer to a Pointer
Date: Wed, 19 Nov 2003 05:07:41 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200311190507.41687.theman@josephdwagner.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: glynn.clements@virgin.net
Cc: linux-c-programming@vger.kernel.org

> Given that you are using 1-based indexing, are you remembering to add 1
> to the number of elements when you (re)allocate the arrays
> (frag_log.block_order_log, block_order_log.block_id and all of the
> individual block_id arrays)?

In answering your question, this is where the code gets a little messy.  I'm 
99.999% sure that what you said IS the case for all of the 'frag_log' 
elements (after all, THAT code works, i.e. the rest of the program works 
fine if I take this one problematic line of code out), but I'm not so sure 
about all of the individual block_order_log.block_id elements.

Thanks again for all of your help.

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

if(total_fragments > 0)
{
    frag_log.total_fragmented_files++;

    /* Allocates more memory for the fragments log */
    frag_log.inode_id_array_size =
        (frag_log.total_fragmented_files + 1) *
        sizeof(ext2_ino_t);
    frag_log.inode_id = (ext2_ino_t*) realloc(
        frag_log.inode_id,
        frag_log.inode_id_array_size);
    if(frag_log.inode_id == NULL)
    {
        ...
    }
    frag_log.parent_inode_id_array_size =
        (frag_log.total_fragmented_files + 1) *
        sizeof(ext2_ino_t);
    frag_log.parent_inode_id = (ext2_ino_t*) realloc(
        frag_log.parent_inode_id,
        frag_log.parent_inode_id_array_size);
    if(frag_log.parent_inode_id == NULL)
    {
        ...
    }
    frag_log.total_fragments_array_size =
        (frag_log.total_fragmented_files + 1) *
        sizeof(e2_blkcnt_t);
    frag_log.total_fragments = (e2_blkcnt_t*) realloc(
        frag_log.total_fragments,
        frag_log.total_fragments_array_size);
    if(frag_log.total_fragments == NULL)
    {
        ...
    }
    frag_log.block_order_log_array_size =
        (frag_log.total_fragmented_files + 1) *
        sizeof(struct block_order_log_t);
    frag_log.block_order_log = (struct block_order_log_t*)
        realloc(frag_log.block_order_log,
        frag_log.block_order_log_array_size);
    if(frag_log.block_order_log == NULL)
    {
        ...
    }
    frag_log.block_order_log->is_indirect_block_array_size +=
        block_order_log.total_blocks * sizeof(bool);
    frag_log.block_order_log->is_indirect_block = (bool*)
        realloc(frag_log.block_order_log->is_indirect_block,
        frag_log.block_order_log->is_indirect_block_array_size);
    if(frag_log.block_order_log->is_indirect_block == NULL)
    {
        ...
    }
    frag_log.block_order_log->block_id_array_size +=
        block_order_log.total_blocks * sizeof(blk_t);
    frag_log.block_order_log->block_id = (blk_t*) realloc(
        frag_log.block_order_log->block_id,
        frag_log.block_order_log->block_id_array_size);
    if(frag_log.block_order_log->block_id == NULL)
    {
        ...
    }

...

