

//=== C++ INCLUDES ==========================================================================================
%{
#include <HAPI/CollisionObjects.h>
%}


//=== SWIG INCLUDES =========================================================================================

/*
%extend HAPI::Collision::GeometryPrimitive {
    GeometryPrimitive() {
    }
    virtual ~GeometryPrimitive() {
    }
};
*/


// These class are constructed with function in arguments (BoundNewFunc), we don't use that, so ignore corresponding constructors
%ignore HAPI::Collision::BBPrimitiveTree::BBPrimitiveTree(BoundNewFunc ,  const vector< GeometryPrimitive * > &, unsigned int = 1);
%ignore HAPI::Collision::BBPrimitiveTree::new_func;

%ignore HAPI::Collision::BinaryBoundTree::BinaryBoundTree( BoundNewFunc, const vector< Triangle > &, unsigned int = 1 );
%ignore HAPI::Collision::BinaryBoundTree::BinaryBoundTree( BoundNewFunc, const vector< Triangle > &,
                       const vector< LineSegment > &,const vector< Point > &,unsigned int = 1 );
%ignore HAPI::Collision::BinaryBoundTree::new_func;


//TO DELETE ALL THE AUTOREF
%ignore HAPI::Collision::BBPrimitiveTree::left;
%ignore HAPI::Collision::BBPrimitiveTree::right;
%ignore HAPI::Collision::BBPrimitiveTree::bound;
%ignore HAPI::Collision::BBPrimitiveTree::primitives;
%extend HAPI::Collision::BBPrimitiveTree {
	BBPrimitiveTree* getLeft() {
		return $self->left.get();
	}
	BBPrimitiveTree* getRight() {
		return $self->right.get();
	}
	BoundPrimitive* getBound() {
		return $self->bound.get();
	}
};

%ignore HAPI::Collision::BinaryBoundTree::left;
%ignore HAPI::Collision::BinaryBoundTree::right;
%ignore HAPI::Collision::BinaryBoundTree::bound;
%extend HAPI::Collision::BinaryBoundTree {
	BinaryBoundTree* getLeft() {
		return $self->left.get();
	}
	BinaryBoundTree* getRight() {
		return $self->right.get();
	}
	BoundPrimitive* getBound() {
		return $self->bound.get();
	}
};



ADD_DISOWN_METHOD(HAPI::Collision::GeometryPrimitive, GeometryPrimitive)


%include <HAPI/IntersectionInfo.h>
%include <HAPI/CollisionObjects.h>

