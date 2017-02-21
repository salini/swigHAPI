
%define CREATE_TEMPLATE_VECTOR(cname, elemcppname, elemcsname)

#if defined(SWIGPYTHON)   //=== Only for the PYTHON code ========================
%template(cname) std::vector< elemcppname >;
#endif


#if defined(SWIGCSHARP)    //=== Only for the CSHARP code ========================
/*
%typemap(cscode) std::vector< elemcppname > %{
	cast from C# string array
    public static implicit operator cname(elemcsname[] inVal) {
        var outVal= new cname();
        foreach (elemcsname element in inVal) {
            outVal.Add(element);
        }
        return outVal;
    }

    // cast to C# string array
    public static implicit operator elemcsname[](cname inVal) {
        var outVal= new elemcsname[inVal.Count];
        inVal.CopyTo(outVal);
        return outVal;
    }
%}
*/
%template(cname) std::vector< elemcppname >;
#endif

%enddef



%include "std_vector.i"
%include "std_pair.i"


CREATE_TEMPLATE_VECTOR(VecInt              , int                                , int)
CREATE_TEMPLATE_VECTOR(VecVec3             , H3DUtil::ArithmeticTypes::Vec3d    , Vec3)
CREATE_TEMPLATE_VECTOR(VecPoint            , HAPI::Collision::Point             , Point)
CREATE_TEMPLATE_VECTOR(VecTriangle         , HAPI::Collision::Triangle          , Triangle)
CREATE_TEMPLATE_VECTOR(VecLineSegment      , HAPI::Collision::LineSegment       , LineSegment)
CREATE_TEMPLATE_VECTOR(VecHAPIForceEffect  , HAPI::HAPIForceEffect*             , HAPIForceEffect)
CREATE_TEMPLATE_VECTOR(VecGeometryPrimitive, HAPI::Collision::GeometryPrimitive*, GeometryPrimitive)

%template(PairShapeContactInfo) std::pair< HAPI::HAPIHapticShape*, HAPI::HAPISurfaceObject::ContactInfo>;
%template(VecPairShapeContactInfo) std::vector< std::pair< HAPI::HAPIHapticShape*, HAPI::HAPISurfaceObject::ContactInfo> >;

CREATE_TEMPLATE_VECTOR(VecHAPIHapticShape  , HAPI::HAPIHapticShape*             , HAPIHapticShape)
