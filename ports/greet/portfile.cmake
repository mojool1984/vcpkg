vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mojool1984/greet
    REF "v${VERSION}"
    SHA512 66802ed3727806d26ab05582870ee63aefd3c42b16fc16d197ad84bd488c2975481ea8e88afff8ed105e32d1866f8306f7f00906a9f8b0525a0e99d32920f8bc
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
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/greet)

#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

#vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")