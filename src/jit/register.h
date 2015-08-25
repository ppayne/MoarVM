/* Register allocator based on linear-scan allocation. For this
 * algorithm, we need the live ranges of values, sorted ascending and
 * descending by end point. I want to use this algorithm online, so it
 * seems logical to use a heap */
struct MVMJitRegisterAllocator {
    /* Heap of active 'live' ranges */
    MVM_DYNAR_DECL(MVMJitExprValue*, active);
    /* stacks of free registers */
    MVMint8 free_reg[8];
    MVMuint8 reg_use[16];
    MVMint8 reg_top;
    /* topmost spill location used */
    MVMint32 spill_top;
    /* Bitmap of used registers */
    MVMint32 reg_lock;
};


void MVM_jit_register_allocator_init(MVMThreadContext *tc, MVMJitCompiler *compiler, MVMJitRegisterAllocator *allocator);
void MVM_jit_register_allocator_deinit(MVMThreadContext *tc, MVMJitCompiler *compiler, MVMJitRegisterAllocator *allocator);
MVMint8 MVM_jit_register_alloc(MVMThreadContext *tc, MVMJitCompiler *compiler, MVMint32 reg_cls);
void MVM_jit_register_take(MVMThreadContext *tc, MVMJitCompiler *compiler,
                           MVMint32 reg_cls, MVMint8 reg_num);
void MVM_jit_register_free(MVMThreadContext *tc, MVMJitCompiler *compiler,
                           MVMint32 reg_cls, MVMint8 reg_num);
void MVM_jit_register_use(MVMThreadContext *tc, MVMJitCompiler *compiler,
                          MVMint32 reg_cls, MVMint8 reg_num);
void MVM_jit_register_release(MVMThreadContext *tc, MVMJitCompiler *compiler,
                              MVMint32 reg_cls, MVMint8 reg_num);
void MVM_jit_register_load(MVMThreadContext *tc, MVMJitCompiler *compiler, MVMint32 spill_location,
                           MVMint32 reg_cls, MVMint8 reg_num, MVMint32 size);
void MVM_jit_register_spill(MVMThreadContext *tc, MVMJitCompiler *compiler, MVMint32 spill_location,
                            MVMint32 reg_cls, MVMint8 reg_num, MVMint32 size);
void MVM_jit_register_assign(MVMThreadContext *tc, MVMJitCompiler *compiler,
                             MVMJitExprValue *value, MVMint32 reg_cls, MVMint8 reg_num);
void MVM_jit_register_expire(MVMThreadContext *tc, MVMJitCompiler *compiler,
                             MVMJitExprValue *value);

void MVM_jit_expire_values(MVMThreadContext *tc, MVMJitCompiler *compiler, MVMint32 order_nr);