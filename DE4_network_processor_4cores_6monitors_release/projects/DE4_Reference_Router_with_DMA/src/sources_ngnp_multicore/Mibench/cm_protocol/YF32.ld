
ENTRY(__start)

MEMORY
{
    rom  (rx) : org = 0x00000000 , len = 8K
    ram  (wx) : org = 0x00002000 , len = 8K
}

SECTIONS
{
    .text : {
        __text_start = .;
        *(.text)
        __text_end = .;
     } >rom
     
    .rodata : {
        __rodata_start = .;
        *(.rodata)
        __rodata_end = .;
    } >rom
    
    .sdata : {
        __sdata_start = .;
        *(.sdata)
        __sdata_end = .;
    } >rom
    
    .pdr : {
        __pdr_start = .;
        *(.pdr)
        __pdr_end = .;
    } >rom
            
    .comment : {
        __comment_start = . ;
        *(.comment)
        __comment_end = . ;
    } >rom  
    
    .data : {
        __data_start = .;
        *(.data)
        __data_end = .;
    } >rom
    
    
    .sbss : {
        _fbss = . ;
        __sbss_start = . ;
        *(.sbss)
        *(.scommon)
        __sbss_end = . ;
    } >ram
    .bss : {
         __bss_start = .;
         *(.bss)
         *(.bss.*) 
         *(COMMON)
         . = ALIGN(32 / 8);
         __bss_end = .;
    } >ram
    _end = .;
    
     _gp = 0x00002000;
     _sp = 0x00003ff8;    
    
}

