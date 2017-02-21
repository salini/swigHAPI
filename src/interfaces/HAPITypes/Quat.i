
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPITypes/linalgMacro.i"


//=== SWIG INCLUDES =========================================================================================

RENAME_OPERATORS_COMMON_INNER_MUL(Quaterniond)

//ADD_CSHARP_OPERATORS_COMMON_INNER_MUL(Quaterniond, Quat)
ADD_CSHARP_CUSTOM_METHODS(Quaterniond, Quat,
__CS_OP_REPR(Quat)
__CS_OP_NEG(Quat)
__CS_OP_ADD(Quat)
__CS_OP_SUB(Quat)
__CS_OP_MUL_DOUBLE(Quat)
__CS_OP_MUL_INNER(Quat)
__CS_OP_TO_UNITY(toUnity, bool leftHand=true, UnityEngine.Quaternion, return new UnityEngine.Quaternion((float)v.x, (float)v.y, (float) (leftHand ? -v.z : v.z) , (float)w) )
)

EXTEND_REPR_NEG(Quaterniond)
ADD_LINALG_ELEMENT(Quaterniond, Quaternion, Quat)

ADD_PYTHON_OPERATORS_COMMON(Quat)


