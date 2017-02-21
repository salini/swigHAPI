

//=== MACRO =============================================================================================

%define ADD_DISOWN_METHOD(classType, className)

#if defined(SWIGPYTHON)   //=== Only for the PYTHON code ========================
%typemap(in, disown="1") classType *  __ ## className ## __DISOWN__ {
	void * argp = 0;
	int res = 0;
	res = SWIG_ConvertPtr($input, &argp,$descriptor, $disown | %convertptr_flags);
	if (!SWIG_IsOK(res)) { 
	%argument_fail(res, "$type", $symname, $argnum); 
	}
	$1 = %reinterpret_cast(argp, $ltype);
}
#endif


#if defined(SWIGCSHARP)  //=== Only for the CSHARP code ========================
%typemap(cscode) classType %{
  public className __disown__() {
    if (!swigCMemOwn)
      throw new csHAPI.AlreadyDisownException();
    swigCMemOwn = false;
    return new className(swigCPtr.Handle, false);
  }
%}
%typemap(csin) classType * __ ## className ## __DISOWN__ "$csclassname.getCPtr($csinput.__disown__())"
#endif

%enddef

%pragma(csharp) modulecode=%{
  // Custom C# Exception
  public class AlreadyDisownException : global::System.ApplicationException {
    public AlreadyDisownException(string message="")
      : base("Object already disown, another object has taken control; cannot do it twice\n"+message) {
    }
  }
%}








//=== TYPEMAPS =============================================================================================

#ifdef SWIGPYTHON  //=== FOR PYTHON ========================================================================
%typemap(in) const HAPI::Vec3& {

	PyObject* arr = reinterpret_cast< PyObject* >($input);
	if (PyList_Size(arr) != 3) {
		PyErr_SetString(PyExc_TypeError,"array not of size 3");
	}
	$1 = new HAPI::Vec3();
	for (size_t idx=0; idx<3; ++idx) {
		$1->operator[](idx) = PyFloat_AsDouble(PyList_GetItem($input, idx));
	}
}
%typemap(freearg) const HAPI::Vec3& {
   delete $1;
}

%typemap(in) const HAPI::Vec3 {
	PyObject* arr = reinterpret_cast< PyObject* >($input);
	if (PyList_Size(arr) != 3) {
		PyErr_SetString(PyExc_TypeError,"array not of size 3");
	}
	for (size_t idx=0; idx<3; ++idx) {
		$1[idx] = PyFloat_AsDouble(PyList_GetItem($input, idx));
	}
}


%typemap(out) HAPI::Vec3 {
    $result = Py_BuildValue("(ddd)", $1.x, $1.y, $1.z );
}



// THE FOLLOWING IS FOR TYPECHECK USE FOR TYPEMAP & OVERLOADING. ACTUALLY NOTHING DONE.
%typecheck(1200) HAPI::Vec3 {
    $1 = 1;
}

#endif




#ifdef SWIGCSHARP  //=== FOR C# ========================================================================

%include "arrays_csharp.i"
%apply double INPUT[]  { double* }
%apply double INPUT[]  { double& }


%define CREATE_TYPEMAP_FOR_AUTOREFVECTOR_PROXY(cname, cscname)

%typemap(cstype) H3DUtil::AutoRefVector< HAPI::cname >  "cscname"
%typemap(csin)   H3DUtil::AutoRefVector< HAPI::cname >  "cscname.getCPtr($csinput)"
%typemap(csout)  H3DUtil::AutoRefVector< HAPI::cname >  "{ return new cscname($imcall, $owner); }"
%typemap(cstype) H3DUtil::AutoRefVector< HAPI::cname >& "cscname"
%typemap(csin)   H3DUtil::AutoRefVector< HAPI::cname >& "cscname.getCPtr($csinput)"
%typemap(csout)  H3DUtil::AutoRefVector< HAPI::cname >& "{ return new cscname($imcall, $owner); }"


%typemap(in) H3DUtil::AutoRefVector< HAPI::cname > , H3DUtil::AutoRefVector< HAPI::cname >& {
	$1 = new H3DUtil::AutoRefVector< HAPI::cname >();
	std::vector<HAPI::cname*>* stdVec = (std::vector<HAPI::cname*>*)$input;
	(*$1) = *stdVec;
}

%typemap(out) H3DUtil::AutoRefVector< HAPI::cname >& {
	$result = new H3DUtil::AutoRefVector< HAPI::cname >();
	std::vector<HAPI::cname*>* stdVec = new std::vector<HAPI::cname*>($1->begin(), $1->end());
	*(std::vector<HAPI::cname*>**)&$result = stdVec;
}

%typemap(out) H3DUtil::AutoRefVector< HAPI::cname > {
	$result = new H3DUtil::AutoRefVector< HAPI::cname >();
	//std::vector<HAPI::cname*>* stdVec = new std::vector<HAPI::cname*>($1->begin(), $1->end());
	H3DUtil::AutoRefVector< HAPI::HAPIForceEffect > rr = $1;
	std::vector<HAPI::cname*>* stdVec = new std::vector<HAPI::cname*>(rr.begin(), rr.end());
	*(std::vector<HAPI::cname*>**)&$result = stdVec;
}

%enddef


CREATE_TYPEMAP_FOR_AUTOREFVECTOR_PROXY(HAPIForceEffect, VecHAPIForceEffect)
CREATE_TYPEMAP_FOR_AUTOREFVECTOR_PROXY(HAPIHapticShape, VecHAPIHapticShape)

#endif
