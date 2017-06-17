--- gcta.h.orig	2016-06-21 22:11:01.000000000 -0500
+++ gcta.h	2017-03-11 13:53:26.196740000 -0600
@@ -17,9 +17,9 @@
 #define EIGEN_YES_I_KNOW_SPARSE_MODULE_IS_NOT_STABLE_YET
 #endif
 
-#ifndef EIGEN_USE_MKL_ALL
-#define EIGEN_USE_MKL_ALL
-#endif
+//#ifndef EIGEN_USE_MKL_ALL
+//#define EIGEN_USE_MKL_ALL
+//#endif
 
 #include "CommFunc.h"
 #include "StrFunc.h"
@@ -36,8 +36,11 @@
 #include <unsupported/Eigen/SparseExtra>
 #include <unsupported/Eigen/IterativeSolvers>
 #include <omp.h>
-#include <mkl_cblas.h>
-#include <mkl_lapack.h>
+#include <cblas.h>
+#include <lapacke.h>
+// Looks like openblas, cblas and lapacke are all that's needed
+//#include <blaspp.h>
+//#include <lapackpp.h>
 
 using namespace Eigen;
 using namespace std;