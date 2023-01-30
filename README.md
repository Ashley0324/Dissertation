# The museum of museums: an augmented reality application for digital museum heritage 

The program uses the data of the four museums mentioned above for experimental testing and has achieved good results. It proves that it is feasible to apply augmented reality technology to the field of museum heritage and build a museum of museums.


## Overview

This project is a starting point for a Flutter application.

## Questions

If you have problems with permissions on iOS (e.g. with the camera view not showing up even though camera access is allowed), add this to the podfile of your app's ios directory:

'''
post_install do |installer|
    installer.pods_project.targets.each do |target|
      flutter_additional_ios_build_settings(target)
      target.build_configurations.each do |config|
        # Additional configuration options could already be set here

        # BEGINNING OF WHAT YOU SHOULD ADD
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
          '$(inherited)',

          ## dart: PermissionGroup.camera
          'PERMISSION_CAMERA=1',

          ## dart: PermissionGroup.photos
          'PERMISSION_PHOTOS=1',

          ## dart: [PermissionGroup.location, PermissionGroup.locationAlways, PermissionGroup.locationWhenInUse]
          'PERMISSION_LOCATION=1',

          ## dart: PermissionGroup.sensors
          'PERMISSION_SENSORS=1',

          ## dart: PermissionGroup.bluetooth
          'PERMISSION_BLUETOOTH=1',

          # add additional permission groups if required
        ]
        # END OF WHAT YOU SHOULD ADD
      end
    end
  end
'''
