--- FileUtils.cpp.orig	2017-08-02 18:43:24.000000000 -0500
+++ FileUtils.cpp	2017-11-10 09:16:27.900905000 -0600
@@ -187,7 +187,8 @@ namespace FileUtils {
   }
 
   AutoGzIfstream::operator bool() const {
-    return boost_in;
+    // Po-Ru suggestion to solve type mismatch
+    return ! boost_in.fail();
   }
 
   AutoGzIfstream& AutoGzIfstream::read(char *s, std::streamsize n) {
@@ -275,7 +276,7 @@ namespace FileUtils {
     uint Layout = (flags>>2)&0xf; cout << "Layout: " << Layout << endl;
     assert(Layout==1 || Layout==2); // REQUIRE Layout==1 or Layout==2
 
-    uint SampleIdentifiers = flags>>31; //cout << "SampleIdentifiers: " << SampleIdentifiers << endl;
+    // uint SampleIdentifiers = flags>>31; cout << "SampleIdentifiers: " << SampleIdentifiers << endl;
     fseek(fin, offset+4, SEEK_SET);
 
     // check first SNP
