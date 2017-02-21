
//=== OTHER INTERFACE INCLUDES ==============================================================================



//=== C++ INCLUDES ==========================================================================================
%{
#include <HAPI/HAPIForceEffect.h>
%}


//=== SWIG INCLUDES =========================================================================================

ADD_DISOWN_METHOD(HAPI::HAPIForceEffect, HAPIForceEffect)


#ifdef SWIGCSHARP
// Warning for HAPI::HAPIForceEffect proxy: Base H3DUtil::RefCountedClass ignored. Multiple inheritance is not supported in Java.
%warnfilter(833)  HAPIForceEffect;
#endif


%{ // to overcome nested class issues
typedef HAPI::HAPIForceEffect::EffectInput   EffectInput;
typedef HAPI::HAPIForceEffect::EffectOutput  EffectOutput;
%}



%extend EffectOutput {
	HAPI::Vec3 getForce() {
		return $self->force;
	}
	HAPI::Vec3 getTorque() {
		return $self->torque;
	}
};

#ifdef SWIGCSHARP

%rename("__add__") EffectOutput::operator+;
%rename("__mul__") EffectOutput::operator*;
%csmethodmodifiers EffectOutput::operator+ "protected";
%csmethodmodifiers EffectOutput::operator* "protected";
%typemap(cscode) EffectOutput %{

  public static EffectOutput operator+(EffectOutput e0, EffectOutput e1) {
    return e0.__add__(e1);
  }
  public static EffectOutput operator*(EffectOutput e0, double e1) {
    return e0.__mul__(e1);
  }
  public override string ToString() {
	return "F:"+this.getForce().ToString()+"; T:"+this.getTorque().ToString();
  }
%}

#endif


%feature("director") HAPI::HAPIForceEffect;  // To enable creating derived class in C#

%include "modified/HAPIForceEffect.h"




