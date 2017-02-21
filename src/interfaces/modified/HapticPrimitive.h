

//MODIFIED ARG NAME TO ACTIVATE THE DISOWN METHOD

namespace HAPI {

 
  class HAPI_API HapticPrimitive: public HAPIHapticShape {
  public:

    HapticPrimitive( const Matrix4 &_transform,
                     Collision::GeometryPrimitive * __GeometryPrimitive__DISOWN__,
                     HAPISurfaceObject * __HAPISurfaceObject__DISOWN__,
                     Collision::FaceType _touchable_face = Collision::FRONT_AND_BACK,
                     void *_userdata = NULL,
                     int _shape_id = -1,
                     void (*_clean_up_func)( void * ) = 0
                     );


    HapticPrimitive( Collision::GeometryPrimitive * __GeometryPrimitive__DISOWN__,
                     HAPISurfaceObject * __HAPISurfaceObject__DISOWN__,
                     Collision::FaceType _touchable_face = Collision::FRONT_AND_BACK,
                     void *_userdata = NULL,
                     int _shape_id = -1,
                     void (*_clean_up_func)( void * ) = 0
                     );

#ifdef HAVE_OPENGL
    virtual int nrTriangles();
    virtual int nrPoints();
    virtual int nrLines();
#endif

  protected:

    virtual bool lineIntersectShape( const Vec3 &from, const Vec3 &to, Collision::IntersectionInfo &result, Collision::FaceType face = Collision::FRONT_AND_BACK); 
    virtual void closestPointOnShape( const Vec3 &p, Vec3 &cp, Vec3 &n, Vec3 &tc );
    virtual bool movingSphereIntersectShape( HAPIFloat radius, const Vec3 &from, const Vec3 &to );
    virtual void getConstraintsOfShape( const Vec3 &point, Constraints &constraints, Collision::FaceType face = Collision::FRONT_AND_BACK, HAPIFloat radius = -1 );
    virtual void getTangentSpaceMatrixShape( const Vec3 &point, Matrix4 &result_mtx );

#ifdef HAVE_OPENGL
    virtual void glRenderShape();
#endif

    H3DUtil::AutoRef< Collision::GeometryPrimitive > primitive;

  };
}


