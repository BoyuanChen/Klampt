# Package building stuff - Set CPACK_GENERATOR to whatever package type
# you wish to build...
SET(CPACK_PACKAGE_VERSION "${KLAMPT_VERSION}")
SET(CPACK_PACKAGE_VERSION_MAJOR "${KLAMPT_MAJOR_VERSION}")
SET(CPACK_PACKAGE_VERSION_MINOR "${KLAMPT_MINOR_VERSION}")
SET(CPACK_PACKAGE_VERSION_PATCH "${KLAMPT_PATCH_VERSION}")
#SET(CPACK_PACKAGE_INSTALL_DIRECTORY "Klampt ${V_MAJOR}.${V_MINOR}")
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "Klampt")
SET(CPACK_PACKAGE_CONTACT "K. Hauser")
SET(CPACK_PACKAGE_VENDOR "Indiana University")
IF(WIN32)
  SET(CPACK_GENERATOR "WIX")
  SET(CPACK_WIX_UPGRADE_GUID 6D28652E-751D-42F0-9D8A-44EAA79CB84B)
  SET(CPACK_SOURCE_GENERATOR "ZIP")
  SET(CPACK_SOURCE_PACKAGE_FILE_NAME
  "${PROJECT_NAME}-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
ELSE(WIN32)
  SET(CPACK_GENERATOR "DEB")
  SET(CPACK_SOURCE_GENERATOR "TGZ")
  SET(CPACK_SOURCE_PACKAGE_FILE_NAME
  "${PROJECT_NAME}-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
ENDIF(WIN32)

 # This must always be last statement!
INCLUDE(CPack)

