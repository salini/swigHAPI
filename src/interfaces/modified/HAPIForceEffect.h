
/* =========================================================================================
* WARNING: this class comes from <HAPI/HAPIForceEffect.h> and it has been written by Joseph Salini:
* Due to a parsing error in the original file, this one is a copy with some modifications to
* make it suitable for swig and for the sake of readability.
========================================================================================= */

/****************************************************************
redefinition of nested class "HAPI::HAPIForceEffect::EffectInput"
*****************************************************************/
struct HAPI_API EffectInput {
	// NO INTERFACE FOR THESE FUNCTIONS
    //EffectInput( HAPI::HAPIHapticsDevice *_hd, const TimeStamp &dt = 0 );
	//TimeStamp deltaT;

	EffectInput( HAPI::HAPIHapticsDevice *_hd);
    HAPI::HAPIHapticsDevice *hd;
};



/*****************************************************************
redefinition of nested class "HAPI::HAPIForceEffect::EffectOutput"
******************************************************************/
struct HAPI_API EffectOutput {
    EffectOutput( const HAPI::Vec3 _force = HAPI::Vec3( 0,0,0 ), const HAPI::Vec3 _torque = HAPI::Vec3( 0,0,0 ) );

	// We don't want to expose these attributes as is; through setter/getter instead
	//HAPI::Vec3 force;
    //HAPI::Vec3 torque;

    EffectOutput operator +( const EffectOutput &o );
    EffectOutput operator *( float f );
    EffectOutput operator *( double f );
};




/*******************************
definition HAPI::HAPIForceEffect
********************************/
namespace HAPI {
    
class HAPI_API HAPIForceEffect: public HAPI::HAPIHapticObject, public H3DUtil::RefCountedClass {
public:
    HAPIForceEffect();

    /* =========================================================================================
     * WARNING: this line has been modified by Joseph Salini:
     * The original line is : "EffectOutput virtual calculateForces( const EffectInput &input ) = 0;"
     * but the inversion of the two first words prevent swig to parse the file correctly (parsing error)
     * To overcome this problem, a copy of the file is done here, with the correct line syntax
     * It will allow swig to import the file correctly
    ========================================================================================= */
    virtual EffectOutput calculateForces( const EffectInput &input ) = 0;

    virtual ~HAPIForceEffect();
  };
}


