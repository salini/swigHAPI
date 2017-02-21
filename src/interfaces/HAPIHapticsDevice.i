


//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPIHapticShape.i"
%include "interfaces/HAPIHapticsRenderer.i"


//=== C++ INCLUDES ==========================================================================================
%{
#pragma warning( disable : 4715 )  //=> not all control paths return a value (release & operator= of some nested functions)
#include <HAPI/HAPIHapticsDevice.h>
#pragma warning( default : 4715 )
%}


//=== SWIG INCLUDES =========================================================================================


%{ // to overcome nested class issues
typedef HAPI::HAPIHapticsDevice::DeviceValues                DeviceValues;
%}


%ignore DeviceValues::user_data;  // namespace does not correspond because it is in modified header, for unesting classes purpose

//%ignore HapticsDeviceRegistration;
//%ignore ErrorHandler;
//%ignore DefaultErrorHandler;
%ignore HAPI::HAPIHapticsDevice::profiled_result_haptic;
%ignore HAPI::HAPIHapticsDevice::registerDevice;
%ignore HAPI::HAPIHapticsDevice::getErrorHandler;
%ignore HAPI::HAPIHapticsDevice::setErrorHandler;
%ignore HAPI::HAPIHapticsDevice::getThread;


%include "modified/HAPIHapticsDevice.h"
