
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPITypes/linalgMacro.i"


//=== SWIG INCLUDES =========================================================================================

%ignore H3DUtil::ArithmeticTypes::Matrix4d::Matrix4d(const Quaternion&);
%ignore H3DUtil::ArithmeticTypes::Matrix4d::Matrix4d(const Rotation&);


RENAME_OPERATORS_COMMON_INNER_MUL(Matrix4d)

//ADD_CSHARP_OPERATORS_COMMON_GET2_INNER_MUL(Matrix4d, Mat4)
ADD_CSHARP_CUSTOM_METHODS(Matrix4d, Mat4,
__CS_OP_REPR(Mat4)
__CS_OP_GETITEM2(Mat4)
__CS_OP_NEG(Mat4)
__CS_OP_ADD(Mat4)
__CS_OP_SUB(Mat4)
__CS_OP_MUL_DOUBLE(Mat4)
__CS_OP_MUL_INNER(Mat4)
)

EXTEND_GETITEM2_REPR_NEG(Matrix4d, double)
ADD_LINALG_ELEMENT(Matrix4d, Matrix4f, Mat4)

ADD_PYTHON_OPERATORS_COMMON(Mat4)

