

//=== C++ INCLUDES ==========================================================================================
%{
#include <sstream>
%}

%define ADD_LINALG_ELEMENT(cname, cignore, nname)
	%rename("nname") H3DUtil::ArithmeticTypes::cname;
	%ignore H3DUtil::ArithmeticTypes::cname::cname( const cignore & );
	%import <H3DUtil/cignore.h>
	%include <H3DUtil/cname.h>
	namespace H3DUtil {
	  using ArithmeticTypes::cignore;
	  using ArithmeticTypes::cname;
	}
%enddef

%define EXTEND_REPR(cname)
%extend H3DUtil::ArithmeticTypes::cname {
	string __repr__() {
		std::ostringstream oss;
		oss << (*$self);
		return oss.str();
	}
};
%enddef

%define EXTEND_GETITEM(cname, outtype)
%extend H3DUtil::ArithmeticTypes::cname {
	outtype __getitem__(int idx) {
		return $self->operator[](idx);
	}
};
%enddef

%define EXTEND_GETITEM2(cname, outtype)
%extend H3DUtil::ArithmeticTypes::cname {
	outtype __getitem__(int i, int j) {
		return $self->getElement(i,j);
	}
};
%enddef

%define EXTEND_NEG(cname)
%extend H3DUtil::ArithmeticTypes::cname {
	H3DUtil::ArithmeticTypes::cname __neg__() {
		return -(*$self);
	}
};
%enddef



%define RENAME_OPERATORS_COMMON(cname)
%rename("__eq__")  operator==(const cname &, const cname  & );
%rename("__add__") operator+( const cname &, const cname  & );
%rename("__mul__") operator*( const cname &, const double & );
%rename("__mul__") operator*( const cname &,       double   );
%rename("__sub__") operator-( const cname &, const cname  & );
%rename("__neg__") operator-( const cname & );
%enddef



%define RENAME_OPERATORS_COMMON_INNER_MUL(cname)
RENAME_OPERATORS_COMMON(cname)
%rename("__mul__") operator*( const cname &, const cname & );
%enddef



%define EXTEND_REPR_NEG(cname)
#if defined(SWIGCSHARP)    //=== Only for the CSHARP code ========================
%csmethodmodifiers H3DUtil::ArithmeticTypes::cname::__repr__     "protected";
#endif
EXTEND_REPR(cname)
#if defined(SWIGPYTHON)   //=== Only for the PYTHON code ========================
EXTEND_NEG(cname)
#endif
%enddef



%define EXTEND_GETITEM_REPR_NEG(cname, outype)
#if defined(SWIGCSHARP)    //=== Only for the CSHARP code ========================
%csmethodmodifiers H3DUtil::ArithmeticTypes::cname::__getitem__  "protected";
#endif
EXTEND_GETITEM(cname, outype)
EXTEND_REPR_NEG(cname)
%enddef


%define EXTEND_GETITEM2_REPR_NEG(cname, outype)
EXTEND_GETITEM2(cname, outype)
EXTEND_REPR_NEG(cname)
%enddef


%define ADD_PYTHON_OPERATOR_LEN(pycname, lenNb)
#if defined(SWIGPYTHON)   //=== Only for the PYTHON code ========================
%pythoncode %{
pycname.__len__  = lambda self: lenNb
%}
#endif
%enddef



%define ADD_PYTHON_OPERATORS_COMMON(pycname)
#if defined(SWIGPYTHON)   //=== Only for the PYTHON code ========================
%pythoncode %{
pycname.__eq__   = lambda self, v: _pyHAPI.__eq__( self, v)
pycname.__add__  = lambda self, v: _pyHAPI.__add__(self, v)
pycname.__sub__  = lambda self, v: _pyHAPI.__sub__(self, v)
pycname.__mul__  = lambda self, v: _pyHAPI.__mul__(self, v)
pycname.__rmul__ = lambda self, v: _pyHAPI.__mul__(v, self)
%}
#endif
%enddef



//============================================================================
%define ADD_CSHARP_CUSTOM_METHODS(cname, cscname, FN0)
#if defined(SWIGCSHARP)    //=== Only for the CSHARP code ========================
%typemap(cscode) H3DUtil::ArithmeticTypes::cname %{
  FN0
%}
#endif
%enddef

%define __CS_OP_REPR(cscname)
  public override string ToString() {
    return this.__repr__();
  }
%enddef
%define __CS_OP_GETITEM1(cscname)
  public double this[int key] {
    get { return this.__getitem__(key); }
  }
%enddef
%define __CS_OP_GETITEM2(cscname)
  public double this[int i, int j] {
    get { return this.__getitem__(i,j); }
  }
%enddef
%define __CS_OP_NEG(cscname)
  public static cscname operator-(cscname v0) {
    return csHAPI.__neg__(v0);
  }
%enddef
%define __CS_OP_ADD(cscname)
  public static cscname operator+(cscname v0, cscname v1) {
    return csHAPI.__add__(v0, v1);
  }
%enddef
%define __CS_OP_SUB(cscname)
  public static cscname operator-(cscname v0, cscname v1) {
    return csHAPI.__sub__(v0, v1);
  }
%enddef
%define __CS_OP_MUL_DOUBLE(cscname)
  public static cscname operator*(cscname v0, double d) {
    return csHAPI.__mul__(v0, d);
  }
  public static cscname operator*(double d, cscname v0) {
    return csHAPI.__mul__(v0, d);
  }
%enddef

%define __CS_OP_MUL_INNER(cscname)
  public static cscname operator*(cscname v0, cscname v1) {
    return csHAPI.__mul__(v0, v1);
  }
%enddef



%define __CS_OP_CUSTOM_METH(methname, input, ouput, cmd)
  public ouput methname(input) {
    cmd;
  }
%enddef

%define __CS_OP_TO_UNITY(methname, input, ouput, cmd)
%#if UNITY_EDITOR || UNITY_STANDALONE || UNITY_WEBPLAYER
__CS_OP_CUSTOM_METH(methname, input, ouput, cmd)
%#endif
%enddef


%ignore  H3D_API_EXCEPTION;



