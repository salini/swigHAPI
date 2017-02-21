
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPITypes/linalgMacro.i"


//=== SWIG INCLUDES =========================================================================================

RENAME_OPERATORS_COMMON(Vec3d)

//ADD_CSHARP_OPERATORS_COMMON_GET1(Vec3d, Vec3)
ADD_CSHARP_CUSTOM_METHODS(Vec3d, Vec3,
__CS_OP_REPR(Vec3)
__CS_OP_GETITEM1(Vec3)
__CS_OP_NEG(Vec3)
__CS_OP_ADD(Vec3)
__CS_OP_SUB(Vec3)
__CS_OP_MUL_DOUBLE(Vec3)
__CS_OP_TO_UNITY(toUnity, bool leftHand=true, UnityEngine.Vector3, return new UnityEngine.Vector3((float)x, (float)y, (float) (leftHand ? -z : z) ) )

)

EXTEND_GETITEM_REPR_NEG(Vec3d, double)
ADD_LINALG_ELEMENT(Vec3d, Vec3f, Vec3)

ADD_PYTHON_OPERATOR_LEN(Vec3, 3)
ADD_PYTHON_OPERATORS_COMMON(Vec3)
