cmake_minimum_required(VERSION 3.16)

project(GymHelper VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS VirtualKeyboard)

qt_standard_project_setup(REQUIRES 6.8)
set(CMAKE_AUTORCC ON)


qt_add_executable(appGymHelper
    main.cpp
    Models/ExerciseModel.h
    Models/ExerciseModel.cpp
    Models/ModelTypes.h
)

set_source_files_properties(Services/NavigationManager.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
set_source_files_properties(Styles/Styles.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(appGymHelper
    URI GymHelper
    VERSION 1.0
    QML_FILES
        Main.qml
        Components/NavBar.qml
        Components/CustomProgressBar.qml
        Components/SelectableIconButtons.qml
        Components/ParameterStepper.qml
        Services/NavigationManager.qml
        Styles/Styles.qml
    RESOURCES Icons.qrc
    QML_FILES pages/Workout.qml
    QML_FILES pages/HomePage.qml
    QML_FILES pages/Goals.qml
    QML_FILES pages/Calendar.qml
    QML_FILES pages/CreateWorkout.qml
    QML_FILES Components/CreateExerciseComponent.qml
)


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appGymHelper PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appGymHelper
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appGymHelper
    PRIVATE Qt6::Quick
    Qt6::VirtualKeyboard

)

include(GNUInstallDirs)
install(TARGETS appGymHelper
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

target_compile_definitions(appGymHelper PRIVATE QT_QML_DEBUG)
