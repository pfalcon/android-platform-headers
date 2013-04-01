#
# This ProGuard configuration file illustrates how to create a
# "link library" which is devoid of any code (i.e. as small as
# possible) and essentially contains only method prototypes
# and not suitable for running code, but otherwise perfectly
# suitable for compiling code against (assuming it will be run
# elsewhere where the full library is present).
# Usage:
#     java -jar lib.jar @linklib.pro
#

# Specify the input jars, output jars, and library jars.
# In this case, the input jar is the program library that we want to process.

-injars  in.jar
-outjars out.jar

-libraryjars  <java.home>/lib/rt.jar

-optimizations code/removal/all

# These attributes are essentially parts of class signature
-keepattributes Signature,Exceptions,Deprecated,InnerClasses,AnnotationDefault
# The bytecode produced generally may be not valid, but (some versions of?)
# javac compiles against it pretty well.
-dontpreverify

-keep public interface **
-keep public class **
-keepclassmembers public class * {
    public protected *;
}

-keepclasseswithmembers class *
-keeppackagenames **

-dump linklib.txt
# If you don't specify all dependencies, you may get lot of warnings.
# It's safe to ignore them - we we will never run resulting jar, and
# we keep all its public symbols unconditionally available.
-dontwarn
