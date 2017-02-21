
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPITypes/linalgMacro.i"


//=== SWIG INCLUDES =========================================================================================

RENAME_OPERATORS_COMMON(Vec4d)

//ADD_CSHARP_OPERATORS_COMMON_GET1(Vec4d, Vec4)
ADD_CSHARP_CUSTOM_METHODS(Vec4d, Vec4,
__CS_OP_REPR(Vec4)
__CS_OP_GETITEM1(Vec4)
__CS_OP_NEG(Vec4)
__CS_OP_ADD(Vec4)
__CS_OP_SUB(Vec4)
__CS_OP_MUL_DOUBLE(Vec4)
__CS_OP_TO_UNITY(toUnity, bool leftHand=true, UnityEngine.Vector4, return new UnityEngine.Vector4((float)x, (float)y, (float) (leftHand ? -z : z), (float)w) )
)

EXTEND_GETITEM_REPR_NEG(Vec4d, double)
ADD_LINALG_ELEMENT(Vec4d, Vec4f, Vec4)

ADD_PYTHON_OPERATOR_LEN(Vec4, 4)
ADD_PYTHON_OPERATORS_COMMON(Vec4)
