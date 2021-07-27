SECTION code_user


PUBLIC _main
EXTERN test_out_glyph8
EXTERN test_out_glyph8_span

_main:
    CALL test_out_glyph8
    CALL test_out_glyph8_span
    RET
