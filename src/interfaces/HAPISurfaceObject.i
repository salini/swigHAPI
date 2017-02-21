

//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/CollisionObjects.i"


//=== C++ INCLUDES ==========================================================================================
%{
#include <HAPI/HAPISurfaceObject.h>
%}


//=== SWIG INCLUDES =========================================================================================

ADD_DISOWN_METHOD(HAPI::HAPISurfaceObject, HAPISurfaceObject)


%{ // to overcome nested class issues
typedef HAPI::HAPISurfaceObject::ContactInfo   ContactInfo;
%}


%include  "modified/HAPISurfaceObject.h"
