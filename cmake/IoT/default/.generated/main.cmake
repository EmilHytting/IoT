include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(IoT_default_library_list )

set(OUTPUT_SUFFIX elf)
# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-XC8
if(IoT_default_default_XC8_FILE_TYPE_assemble)
add_library(IoT_default_default_XC8_assemble OBJECT ${IoT_default_default_XC8_FILE_TYPE_assemble})
    IoT_default_default_XC8_assemble_rule(IoT_default_default_XC8_assemble)
    list(APPEND IoT_default_library_list "$<TARGET_OBJECTS:IoT_default_default_XC8_assemble>")

endif()

# Handle files with suffix S, for group default-XC8
if(IoT_default_default_XC8_FILE_TYPE_assemblePreprocess)
add_library(IoT_default_default_XC8_assemblePreprocess OBJECT ${IoT_default_default_XC8_FILE_TYPE_assemblePreprocess})
    IoT_default_default_XC8_assemblePreprocess_rule(IoT_default_default_XC8_assemblePreprocess)
    list(APPEND IoT_default_library_list "$<TARGET_OBJECTS:IoT_default_default_XC8_assemblePreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC8
if(IoT_default_default_XC8_FILE_TYPE_compile)
add_library(IoT_default_default_XC8_compile OBJECT ${IoT_default_default_XC8_FILE_TYPE_compile})
    IoT_default_default_XC8_compile_rule(IoT_default_default_XC8_compile)
    list(APPEND IoT_default_library_list "$<TARGET_OBJECTS:IoT_default_default_XC8_compile>")

endif()

# Handle files with suffix elf, for group default-XC8
if(IoT_default_default_XC8_FILE_TYPE_objcopy_avr)
add_library(IoT_default_default_XC8_objcopy_avr OBJECT ${IoT_default_default_XC8_FILE_TYPE_objcopy_avr})
    IoT_default_default_XC8_objcopy_avr_rule(IoT_default_default_XC8_objcopy_avr)
    list(APPEND IoT_default_library_list "$<TARGET_OBJECTS:IoT_default_default_XC8_objcopy_avr>")

endif()


# Main target for this project
add_executable(IoT_default_image_7kwz5KGt ${IoT_default_library_list})

set_target_properties(IoT_default_image_7kwz5KGt PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    ADDITIONAL_CLEAN_FILES "${output_extensions}"
    RUNTIME_OUTPUT_DIRECTORY "${IoT_default_output_dir}")
target_link_libraries(IoT_default_image_7kwz5KGt PRIVATE ${IoT_default_default_XC8_FILE_TYPE_link})
# Add the link options from the rule file.
IoT_default_link_rule( IoT_default_image_7kwz5KGt)


#Add objcopy steps
IoT_default_objcopy_avr_rule(IoT_default_image_7kwz5KGt)

