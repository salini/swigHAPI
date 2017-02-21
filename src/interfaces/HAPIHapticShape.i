
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPISurfaceObject.i"

//=== C++ INCLUDES ==========================================================================================
%{
#include <HAPI/HAPIHapticShape.h>
%}


//=== SWIG INCLUDES =========================================================================================

ADD_DISOWN_METHOD(HAPI::HAPIHapticShape, HAPIHapticShape)


#ifdef SWIGCSHARP
// Warning for HAPI::HAPIHapticShape proxy: Base HAPI::HAPIGLShape ignored. Multiple inheritance is not supported in Java.
%warnfilter(833)  HAPIHapticShape;

// Due to multiple inheritance, these function are set as override, but the selected base class
// does not countain these function. So we need to manually reset their settings
%csmethodmodifiers HAPI::HAPIHapticShape::closestPoint          "public";
%csmethodmodifiers HAPI::HAPIHapticShape::lineIntersect         "public";
%csmethodmodifiers HAPI::HAPIHapticShape::movingSphereIntersect "public";
%csmethodmodifiers HAPI::HAPIHapticShape::getConstraints        "public";

%csmethodmodifiers HAPI::HAPIHapticShape::glRender              "public";
%csmethodmodifiers HAPI::HAPIHapticShape::nrTriangles           "public";
%csmethodmodifiers HAPI::HAPIHapticShape::nrPoints              "public";
%csmethodmodifiers HAPI::HAPIHapticShape::nrLines               "public";
#endif


%ignore HAPI::HAPIHapticShape::getUserData;

%ignore HAPI::HAPIHapticShape::getRenderOptions;
%ignore HAPI::HAPIHapticShape::addRenderOption;
%ignore HAPI::HAPIHapticShape::removeRenderOption;



#ifdef HAVE_OPENGL
	#undef HAVE_OPENGL
	#define OPENGL_WAS_DEFINED
#endif

%import <HAPI/HAPIGLShape.h>
%include <HAPI/HAPIHapticShape.h>

#ifdef OPENGL_WAS_DEFINED
	#define HAVE_OPENGL
#endif

