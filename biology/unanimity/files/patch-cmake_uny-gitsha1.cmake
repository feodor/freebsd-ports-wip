--- cmake/uny-gitsha1.cmake.orig	2016-09-07 19:13:09.950327612 -0500
+++ cmake/uny-gitsha1.cmake	2016-09-07 19:13:17.424537305 -0500
@@ -7,7 +7,7 @@ set(__find_git_sha1 YES)
 function(find_git_sha1 _GIT_SHA1)
     find_package(Git QUIET REQUIRED)
     execute_process(COMMAND
-        "${GIT_EXECUTABLE}" "describe" "--always" "--dirty=*"
+        echo 0b166c4
         WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
         RESULT_VARIABLE res
         OUTPUT_VARIABLE out