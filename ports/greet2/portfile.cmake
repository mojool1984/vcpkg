vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mojool1984/greet2
    REF "v${VERSION}"
    SHA512 4bcfaced8adbaf6bcee3493e5ef5729675a565a104f6f82a6866a187701fa5c1b5257431dd35557a0e1c3444bc5df0d0f69d79cef2bf3e68e630abe233a3f346
    HEAD_REF master
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
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/greet2)

#vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")