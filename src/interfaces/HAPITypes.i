
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPI.i"


//=== C++ INCLUDES ==========================================================================================
%{
#include <HAPI/HAPITypes.h>
%}


//=== SWIG INCLUDES =========================================================================================

%ignore *::operator[];
%ignore operator<<;
%ignore operator*;
%ignore operator%;

%include "interfaces/HAPITypes/Vec2.i"
%include "interfaces/HAPITypes/Vec3.i"
%include "interfaces/HAPITypes/Vec4.i"

%include "interfaces/HAPITypes/Quat.i"
%include "interfaces/HAPITypes/Rot.i"
%include "interfaces/HAPITypes/Mat3.i"
%include "interfaces/HAPITypes/Mat4.i"

%include <HAPI/HAPITypes.h>
