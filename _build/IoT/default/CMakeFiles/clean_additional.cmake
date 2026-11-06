# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  [[D:\udvikling\IoT\out\IoT\default.cmf]]
  [[D:\udvikling\IoT\out\IoT\default.hex]]
  [[D:\udvikling\IoT\out\IoT\default.hxl]]
  [[D:\udvikling\IoT\out\IoT\default.mum]]
  [[D:\udvikling\IoT\out\IoT\default.o]]
  [[D:\udvikling\IoT\out\IoT\default.sdb]]
  [[D:\udvikling\IoT\out\IoT\default.sym]]
  )
endif()
