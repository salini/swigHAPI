
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPITypes/linalgMacro.i"


//=== SWIG INCLUDES =========================================================================================

%ignore H3DUtil::ArithmeticTypes::Matrix3d::Matrix3d(const Quaternion&);
%ignore H3DUtil::ArithmeticTypes::Matrix3d::Matrix3d(const Rotation&);


RENAME_OPERATORS_COMMON_INNER_MUL(Matrix3d)

//ADD_CSHARP_OPERATORS_COMMON_GET2_INNER_MUL(Matrix3d, Mat3)
ADD_CSHARP_CUSTOM_METHODS(Matrix3d, Mat3,
__CS_OP_REPR(Mat3)
__CS_OP_GETITEM2(Mat3)
__CS_OP_NEG(Mat3)
__CS_OP_ADD(Mat3)
__CS_OP_SUB(Mat3)
__CS_OP_MUL_DOUBLE(Mat3)
__CS_OP_MUL_INNER(Mat3)
)

EXTEND_GETITEM2_REPR_NEG(Matrix3d, double)
ADD_LINALG_ELEMENT(Matrix3d, Matrix3f, Mat3)

ADD_PYTHON_OPERATORS_COMMON(Mat3)

