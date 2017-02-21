
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPITypes/linalgMacro.i"


//=== SWIG INCLUDES =========================================================================================

RENAME_OPERATORS_COMMON_INNER_MUL(Rotationd)

//ADD_CSHARP_OPERATORS_INNER_MUL(Rotationd, Rot)
ADD_CSHARP_CUSTOM_METHODS(Rotationd, Rot,
__CS_OP_REPR(Rot)
__CS_OP_NEG(Rot)
__CS_OP_MUL_DOUBLE(Rot)
__CS_OP_MUL_INNER(Rot)
)

EXTEND_REPR_NEG(Rotationd)
ADD_LINALG_ELEMENT(Rotationd, Rotation, Rot)

ADD_PYTHON_OPERATORS_COMMON(Rot)

