##################################################################
# TITLE: Boot Up Code
# AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
# DATE CREATED: 1/12/02
# FILENAME: boot.asm
# PROJECT: Plasma CPU core
# COPYRIGHT: Software placed into the public domain by the author.
#    Software 'as is' without warranty.  Author liable for nothing.
# DESCRIPTION:
#    Initializes the stack pointer and jumps to main2().
##################################################################
	.text
	.align	2
	.globl	__start
	.ent	__start
	
__start:
   .set noreorder

    b       $_reset     #Addr: 0x00000000
    nop
    b       $_INT       #Addr: 0x00000008
    nop
    
$_reset:
    #These eight instructions must be the first instructions.
    #convert.exe will correctly initialize $gp
    lui     $gp,0
    ori     $gp,$gp,_gp
    #convert.exe will set $a0=.bss_start $a1=.bss_end
    lui     $a0,0
    ori     $a0,$4,_fbss
    lui     $a1,0
    ori     $a1,$a1,_end
    lui     $sp,0
    ori     $sp,$sp,_sp     #initialize stack pointer
   
$BSS_CLEAR:
    sw      $zero,0($4)
    slt     $v1,$a0,$a1
    bnez    $v1,$BSS_CLEAR
    addiu   $a0,$a0,4

# Enable Interrupt
    ori     $t0,$zero, 0x01
    mtc0    $t0,$12            #STATUS=1; enable interrupts

# CALL main()   
    jal     main
    nop

# HALT   
$L1:    
    j       $L1

$_INT:
# interrupt_service_routine:
    
   #registers $k0 and $k1 are reserved for the OS      
   
   # CALL ISR
    addiu   $sp,$sp,-112
    sw      $at,  0($sp)
    sw      $v0,  4($sp)
    sw      $v1, 16($sp)
    sw      $a0, 20($sp)
    sw      $a1, 24($sp)
    sw      $a2, 28($sp)
    sw      $a3, 32($sp)
    sw      $t0, 36($sp)
    sw      $t1, 40($sp)
    sw      $t2, 44($sp)
    sw      $t3, 48($sp)
    sw      $t4, 52($sp)
    sw      $t5, 58($sp)
    sw      $t6, 60($sp)
    sw      $t7, 64($sp)
    sw      $s0, 68($sp)
    sw      $s1, 72($sp)
    sw      $s2, 76($sp)
    sw      $s3, 80($sp)
    sw      $s4, 84($sp)
    sw      $s5, 88($sp)
    sw      $s6, 92($sp)
    sw      $s7, 96($sp)
    sw      $t8,100($sp)
    sw      $t9,104($sp)
    sw      $ra,108($sp)
    
    jal     YF32_ISR
    
    nop    
    lw      $at,  0($sp)
    lw      $v0,  4($sp)
    lw      $v1, 16($sp)
    lw      $a0, 20($sp)
    lw      $a1, 24($sp)
    lw      $a2, 28($sp)
    lw      $a3, 32($sp)
    lw      $t0, 36($sp)
    lw      $t1, 40($sp)
    lw      $t2, 44($sp)
    lw      $t3, 48($sp)
    lw      $t4, 52($sp)
    lw      $t5, 58($sp)
    lw      $t6, 60($sp)
    lw      $t7, 64($sp)
    lw      $s0, 68($sp)
    lw      $s1, 72($sp)
    lw      $s2, 76($sp)
    lw      $s3, 80($sp)
    lw      $s4, 84($sp)
    lw      $s5, 88($sp)
    lw      $s6, 92($sp)
    lw      $s7, 96($sp)
    lw      $t8,100($sp)
    lw      $t9,104($sp)
    lw      $ra,108($sp)  
    
    addiu   $sp,$sp,112
    
   #return and re-enable interrupts
    ori     $k0,$zero,0x1
    mfc0    $k1,$14      #C0_EPC=14
    jr      $k1
    mtc0    $k0,$12      #STATUS=1; enable interrupts
    .set reorder
.end	__start
