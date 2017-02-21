

//=== MODULE DEFINITION ==========================================================================================
#ifdef SWIGPYTHON
    %module pyHAPI
#endif
#ifdef SWIGCSHARP
    %module(directors="1") csHAPI
#endif



//=== PRE DEFINITION ==========================================================================================
#ifdef WIN32
%include <windows.i>
#endif

%include "std_string.i"
typedef std::string string;



%include "interfaces/typemap_hapi.i"

%include "interfaces/HAPI.i"

%include "interfaces/HAPITypes.i"

%include "interfaces/HAPIHapticObject.i"



//=== INCLUDED INTERFACE ==========================================================================================


%include "interfaces/FrictionSurface.i"

%include "interfaces/PlaneConstraint.i"

%include "interfaces/HapticPrimitive.i"

%include "interfaces/HAPIForceEffect.i"

%include "interfaces/AnyHapticsDevice.i"




%include "interfaces/TemplateVector.i"



