# Add more folders to ship with the application, here
folder_01.source = qml/Randomize
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0x20070cc1

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
#symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable

# Add dependency to Symbian components
CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

TARGET = Randomize
VERSION = 1.0.1
TRANSLATIONS = arrowpad_it.ts

symbian {
  supported_platforms = \
    "[0x20022E6D],0,0,0,{\"S60ProductID\"}" \ # and Symbian^3
    "[0x2003A678],0,0,0,{\"S60ProductID\"}" # and Symbian Belle
  # remove default platforms
  default_deployment.pkg_prerules -= pkg_platform_dependencies
  # add our platforms
  platform_deploy.pkg_prerules += supported_platforms
  DEPLOYMENT += platform_deploy
}

symbian {
  vendorinfo = "%{\"Mugna91\"}" \
                      ":\"Mugna91\""
  vendor_deploy.pkg_prerules += vendorinfo
  DEPLOYMENT += vendor_deploy
}
