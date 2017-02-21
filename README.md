swigHAPI
********

This project aims to create swig wrappers for the H3D HAPI library (http://www.h3dapi.org/)
The wrappers are generated for python and/or c#


TO GET H3DAPI in UBUNTU
=======================

open sources.list:
------------------

>>> sudo gedit /etc/apt/sources.list

add in the file:
----------------

deb ftp://www.h3dapi.org/pub/releases/linux/debian/ trusty sensegraphics
deb-src ftp://www.h3dapi.org/pub/releases/linux/debian/ trusty sensegraphics


the install package:
--------------------

>>> sudo apt-get update
>>> sudo apt-get install libh3dapi-dev



