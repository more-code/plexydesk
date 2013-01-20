#
# (C) Copyright 2009 Johns Hopkins University (JHU), All Rights
# Reserved.
#
# --- begin cisst license - do not edit ---
# 
# This software is provided "as is" under an open source license, with
# no warranty.  The complete license can be found in license.txt and
# http://www.cisst.org/cisst/license.txt.
# 
# --- end cisst license ---

SET(CMAKE_SYSTEM_NAME QNX)
SET(CMAKE_SYSTEM_VERSION 6.4.1)
SET(CMAKE_SYSTEM_PROCESSOR armv7le)
SET(TOOLCHAIN QNX)

#SET(CMAKE_IMPORT_LIBRARY_SUFFIX ".a")

SET(CMAKE_SHARED_LIBRARY_PREFIX "lib")
SET(CMAKE_SHARED_LIBRARY_SUFFIX ".so")
SET(CMAKE_STATIC_LIBRARY_PREFIX "lib")
SET(CMAKE_STATIC_LIBRARY_SUFFIX ".a")

IF(CMAKE_HOST_WIN32)
  SET(HOST_EXECUTABLE_SUFFIX ".exe")
ENDIF(CMAKE_HOST_WIN32)

FIND_PATH(QNX_HOST
  NAME usr/bin/qcc${HOST_EXECUTABLE_SUFFIX}
  PATHS $ENV{QNX_HOST} C:/QNX641/host/win32/x86
  NO_CMAKE_PATH
  NO_CMAKE_ENVIRONMENT_PATH
)
  
FIND_PATH(QNX_TARGET
  NAME usr/include/qnx_errno.h
  PATHS $ENV{QNX_TARGET} C:/QNX641/target/qnx6
  NO_CMAKE_PATH
  NO_CMAKE_ENVIRONMENT_PATH
)

IF(CMAKE_HOST_WIN32)
  FIND_PATH(QNX_CONFIGURATION
    NAME bin/qnxactivate.exe
    PATHS $ENV{QNX_CONFIGURATION}
    "C:/Program Files/QNX Software Systems/qconfig"
    NO_CMAKE_PATH
    NO_CMAKE_ENVIRONMENT_PATH
 )
ENDIF(CMAKE_HOST_WIN32)

SET(ENV{QNX_HOST} ${QNX_HOST})
SET(ENV{QNX_TARGET} ${QNX_TARGET})
IF(CMAKE_HOST_WIN32)
  SET(ENV{QNX_CONFIGURATION} ${QNX_CONFIGURATION})
  SET(ENV{PATH} "$ENV{PATH};${QNX_HOST}/usr/bin")
ENDIF(CMAKE_HOST_WIN32)

SET(CMAKE_MAKE_PROGRAM "${QNX_HOST}/usr/bin/make${HOST_EXECUTABLE_SUFFIX}"    CACHE PATH "QNX Make Program")
SET(CMAKE_SH           "${QNX_HOST}/usr/bin/sh${HOST_EXECUTABLE_SUFFIX}"      CACHE PATH "QNX shell Program")
SET(CMAKE_AR           "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-ar${HOST_EXECUTABLE_SUFFIX}"      CACHE PATH "QNX ar Program")
SET(CMAKE_RANLIB       "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-ranlib${HOST_EXECUTABLE_SUFFIX}"      CACHE PATH "QNX ranlib Program")
SET(CMAKE_NM           "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-nm${HOST_EXECUTABLE_SUFFIX}"      CACHE PATH "QNX nm Program")
SET(CMAKE_OBJCOPY      "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-objcopy${HOST_EXECUTABLE_SUFFIX}" CACHE PATH "QNX objcopy Program")
SET(CMAKE_OBJDUMP      "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-objdump${HOST_EXECUTABLE_SUFFIX}" CACHE PATH "QNX objdump Program")
SET(CMAKE_LINKER       "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-ld -L${QNX_TARGET}/armle-v7/usr/lib -L${QNX_TARGET}/armle-v7/lib"     CACHE PATH "QNX Linker Program")
SET(CMAKE_STRIP        "${QNX_HOST}/usr/bin/nto${CMAKE_SYSTEM_PROCESSOR}-strip${HOST_EXECUTABLE_SUFFIX}"   CACHE PATH "QNX Strip Program")

message (${CMAKE_LINKER})

SET(CMAKE_C_COMPILER ${QNX_HOST}/usr/bin/qcc -V4.6.3,gcc_ntoarmv7le)
SET(CMAKE_C_FLAGS_DEBUG "-mword-relocations -V4.6.3,gcc_ntoarmv7le -g")
SET(CMAKE_C_FLAGS_MINSIZEREL " -mword-relocations -V4.6.3,gcc_ntoarmv7le -Os -DNDEBUG")
SET(CMAKE_C_FLAGS_RELEASE "-V4.6.3,gcc_ntoarmv7le -DNDEBUG")
SET(CMAKE_C_FLAGS_RELWITHDEBINFO "-V4.6.3,gcc_ntoarmv7le -O2 -g")

SET(CMAKE_CXX_COMPILER ${QNX_HOST}/usr/bin/qcc -V4.6.3,gcc_ntoarmv7le_cpp)
SET(CMAKE_CXX_FLAGS_DEBUG "-fPIC -mword-relocations -V4.6.3,gcc_ntoarmv7le_cpp -g")
SET(CMAKE_CXX_FLAGS_MINSIZEREL "-fPIC -mword-relocations -V4.6.3,gcc_ntoarmv7le_cpp -Os -DNDEBUG")
SET(CMAKE_CXX_FLAGS_RELEASE "-fPIC -mword-relocations -V4.6.3,gcc_ntoarmv7le_cpp -O3 -DNDEBUG")
SET(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-fPIC -mword-relocations -V4.6.3,gcc_ntoarmv7le_cpp -O2 -g")

SET(CMAKE_FIND_ROOT_PATH ${QNX_TARGET}) 
#SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
#SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
#SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_MODULE_LINKER_FLAGS " -mword-relocations -fPIC")
SET(CMAKE_SHARED_LINKER_FLAGS " -mword-relocations -fPIC")
