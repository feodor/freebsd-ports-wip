$NetBSD: patch-ab,v 1.3 2013/09/10 14:19:06 joerg Exp $

--- xroach.c.orig	1993-06-04 19:47:09 UTC
+++ xroach.c
@@ -77,7 +77,7 @@ int CalcRootVisible();
 int MarkHiddenRoaches();
 Pixel AllocNamedColor();
 
-void
+int
 main(ac, av)
 int ac;
 char *av[];
@@ -115,7 +115,7 @@ char *av[];
 	}
     }
 
-    srand((int)time((long *)NULL));
+    srand((int)time((time_t *)NULL));
     
     /*
        Catch some signals so we can erase any visible roaches.
@@ -212,6 +212,8 @@ char *av[];
     CoverRoot();
     
     XCloseDisplay(display);
+
+    exit(0);
 }
 
 #define USEPRT(msg) fprintf(stderr, msg)
@@ -465,7 +467,7 @@ CalcRootVisible()
     Region covered;
     Region visible;
     Window *children;
-    int nChildren;
+    unsigned int nChildren;
     Window dummy;
     XWindowAttributes wa;
     int wx;
