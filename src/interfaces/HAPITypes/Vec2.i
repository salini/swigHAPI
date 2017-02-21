
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPITypes/linalgMacro.i"


//=== SWIG INCLUDES =========================================================================================

RENAME_OPERATORS_COMMON(Vec2d)

//ADD_CSHARP_OPERATORS_COMMON_GET1(Vec2d, Vec2)
ADD_CSHARP_CUSTOM_METHODS(Vec2d, Vec2,
__CS_OP_REPR(Vec2)
__CS_OP_GETITEM1(Vec2)
__CS_OP_NEG(Vec2)
__CS_OP_ADD(Vec2)
__CS_OP_SUB(Vec2)
__CS_OP_MUL_DOUBLE(Vec2)
__CS_OP_TO_UNITY(toUnity,, UnityEngine.Vector2, return new UnityEngine.Vector2((float)x, (float)y) )
)

EXTEND_GETITEM_REPR_NEG(Vec2d, double)
ADD_LINALG_ELEMENT(Vec2d, Vec2f, Vec2)

ADD_PYTHON_OPERATOR_LEN(Vec2, 2)
ADD_PYTHON_OPERATORS_COMMON(Vec2)



