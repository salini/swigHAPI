
//=== OTHER INTERFACE INCLUDES ==============================================================================
%include "interfaces/HAPIForceEffect.i"


//=== C++ INCLUDES ==========================================================================================
%{
#include <HAPI/GodObjectRenderer.h>
#include <HAPI/RuspiniRenderer.h>
%}


//=== SWIG INCLUDES =========================================================================================

ADD_DISOWN_METHOD(HAPI::HAPIHapticsRenderer, HAPIHapticsRenderer)


%ignore HAPI::HAPIHapticsRenderer::registerRenderer;

%ignore HAPI::GodObjectRenderer::renderer_registration; // <== it is a  HapticsRendererRegistration attribute.
%ignore HAPI::RuspiniRenderer::renderer_registration;   // <== it is a  HapticsRendererRegistration attribute.


%ignore HAPI::HAPIHapticsRenderer::getContacts;
%extend HAPI::HAPIHapticsRenderer {
	std::vector< std::pair< HAPI::HAPIHapticShape*, HAPI::HAPISurfaceObject::ContactInfo> > contact() {

		std::vector< pair< H3DUtil::AutoRef< HAPI::HAPIHapticShape >, HAPI::HAPISurfaceObject::ContactInfo> >autoc = $self->getContacts();
		std::vector< std::pair< HAPI::HAPIHapticShape*, HAPI::HAPISurfaceObject::ContactInfo> > c( autoc.size() );
		for (size_t idx=0; idx<autoc.size(); ++idx) {
			c[idx].first  = autoc[idx].first.get();
			c[idx].second = autoc[idx].second;
		}
		
		return c;
	}
};

%include "modified/HAPIHapticsRenderer.h"
%include <HAPI/HAPIProxyBasedRenderer.h>
%include <HAPI/GodObjectRenderer.h>
%include <HAPI/RuspiniRenderer.h>
