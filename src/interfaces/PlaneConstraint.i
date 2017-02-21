

//=== OTHER INTERFACE INCLUDES ==============================================================================
//%include "interfaces/CollisionObjects.i"


//=== C++ INCLUDES ==========================================================================================
%{
#include <HAPI/PlaneConstraint.h>
%}


//=== SWIG INCLUDES =========================================================================================

%ignore HAPI::Constraints::operator[];


#ifdef SWIGCSHARP
%csmethodmodifiers HAPI::Constraints::__getitem__  "protected";

%typemap(cscode) HAPI::Constraints %{
	public PlaneConstraint this[int key] {
		get {
			return this.__getitem__(key);
		}
	}
%}
#endif


%extend HAPI::Constraints {
	PlaneConstraint& __getitem__(int idx) {
		return self->operator[](idx);
	}
};


//TO DELETE ALL THE AUTOREF
%ignore HAPI::Collision::PlaneConstraint::haptic_shape;
%extend HAPI::Collision::PlaneConstraint {
	HAPIHapticShape* getHapticShape() {
		return $self->haptic_shape.get();
	}
};

%include "modified/PlaneConstraint.h"

