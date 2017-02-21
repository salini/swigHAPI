using System;

using unittest;

namespace test_HAPITypes
{
	class MainClass
	{

		public static void Main (string[] args)
		{
			System.IO.File.Copy("../../../../../build/cs/csHAPI.dll", "./csHAPI.dll", true);

			TestVec2.run ();
			TestVec3.run ();
			TestVec4.run ();
			
			TestQuat.run ();
			TestRot.run ();
			TestMat3.run ();
			TestMat4.run ();
			
			TestForceEffect.run ();
			TestGeometryPrimitive.run ();
			TestGenericVectors.run ();

			TestAnyHapticsDevice.run ();

			TestVec2.printResults ();
		}
	}
}

