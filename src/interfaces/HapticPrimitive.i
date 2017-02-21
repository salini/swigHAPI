
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPIHapticShape.i"


//=== C++ INCLUDES ==========================================================================================
%{
#include <HAPI/HapticPrimitive.h>
%}


//=== SWIG INCLUDES =========================================================================================
%feature("notabstract") HapticPrimitive; //SWIG thinks that HapticPrimitive is abstract, but it is not


// These two constructor have been added to remove the possibility to set user_data, or cleaning function
%extend HAPI::HapticPrimitive {
	HapticPrimitive( const Matrix4 &_transform,
                     Collision::GeometryPrimitive * __GeometryPrimitive__DISOWN__,
                     HAPISurfaceObject * __HAPISurfaceObject__DISOWN__,
                     Collision::FaceType _touchable_face = Collision::FRONT_AND_BACK,
                     int _shape_id = -1
                     )
	{
		return new HAPI::HapticPrimitive(_transform, __GeometryPrimitive__DISOWN__, __HAPISurfaceObject__DISOWN__, _touchable_face, NULL, _shape_id, 0);
	}

	HapticPrimitive( Collision::GeometryPrimitive * __GeometryPrimitive__DISOWN__,
                     HAPISurfaceObject * __HAPISurfaceObject__DISOWN__,
                     Collision::FaceType _touchable_face = Collision::FRONT_AND_BACK,
                     int _shape_id = -1
                     )
	{
		return new HAPI::HapticPrimitive(__GeometryPrimitive__DISOWN__, __HAPISurfaceObject__DISOWN__, _touchable_face, NULL, _shape_id, 0);
	}

};


%ignore HAPI::HapticPrimitive::HapticPrimitive;

%include "modified/HapticPrimitive.h"


