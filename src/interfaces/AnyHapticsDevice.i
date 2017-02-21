
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPIHapticsDevice.i"


//=== C++ INCLUDES ==========================================================================================
%{
#include <HAPI/AnyHapticsDevice.h>
%}


//=== SWIG INCLUDES =========================================================================================

%ignore HAPI::AnyHapticsDevice::device_registration;

%include <HAPI/AnyHapticsDevice.h>
