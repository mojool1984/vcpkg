vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mojool1984/greet
    REF "v${VERSION}"
    SHA512 66efb31c05be45e3614fee0fccbb94c652681896a063f6c84a1824672dd92ad5f38582463dd13bb24ad0e84505f53167a1a09fcdd437ebf0a8fa66959b4ea84c
    HEAD_REF main
)

if(NOT VCPKG_TARGET_IS_WINDOWS OR VCPKG_TARGET_IS_MINGW)
    list(APPEND OPTIONS -DENABLE_LIBCXX=OFF)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${OPTIONS}
        #-DCPPTOML_BUILD_EXAMPLES=OFF
        #-DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=ON
)

vcpkg_cmake_install()
#vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")

#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

#vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")