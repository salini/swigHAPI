
//=== C++ INCLUDES ==========================================================================================
%{
#include <H3DUtil/RefCountedClass.h>
#include <HAPI/HAPI.h>
%}


//=== SWIG INCLUDES =========================================================================================
// Nothing known about these class; but we don't want to interface them
%warnfilter(315) TimeStamp;
%warnfilter(315) RGBA;

// We don't want to expose the H3DUtil::RefCountedClass and its methods, but we give it there for inheritance
namespace H3DUtil {
  class RefCountedClass {
private:
	RefCountedClass();
  };
}


namespace H3DUtil {
	typedef float  H3DFloat;
	typedef double H3DDouble;
}


%import <H3DUtil/H3DUtil.h>
%import <HAPI/HAPI.h>




