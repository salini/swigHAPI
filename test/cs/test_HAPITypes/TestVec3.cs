//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System;

using unittest;

using HAPI;

namespace test_HAPITypes
{
	public class TestVec3: TestCase<TestVec3>
	{
		Vec3 v0 = new Vec3(1,2,3);
		Vec3 v1 = new Vec3(-9,-8, -7);
		
		public TestVec3 ()
		{
		}
		
		public void test_getitem() {
			double d = v0[0];
		}
		public void test_add() {
			Vec3 v2 = v0 + v1;
		}
		public void test_sub() {
			Vec3 v2 = v0 - v1;
		}
		public void test_neg() {
			Vec3 v2 = - v1;
		}
		public void test_mul() {
			Vec3 v2 = v0 * 4.0;
			Vec3 v3 = 4.0 * v0;
		}
	}
}
