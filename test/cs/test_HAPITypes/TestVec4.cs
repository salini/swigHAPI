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
	public class TestVec4: TestCase<TestVec4>
	{
		Vec4 v0 = new Vec4(1,2,3,4);
		Vec4 v1 = new Vec4(-9,-8, -7, -6);
		
		public TestVec4 ()
		{
		}
		
		public void test_getitem() {
			double d = v0[0];
		}
		public void test_add() {
			Vec4 v2 = v0 + v1;
		}
		public void test_sub() {
			Vec4 v2 = v0 - v1;
		}
		public void test_neg() {
			Vec4 v2 = - v1;
		}
		public void test_mul() {
			Vec4 v2 = v0 * 4.0;
			Vec4 v3 = 4.0 * v0;
		}
	}
}
