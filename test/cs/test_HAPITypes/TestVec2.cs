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
	public class TestVec2: TestCase<TestVec2>
	{
		Vec2 v0 = new Vec2(1,2);
		Vec2 v1 = new Vec2(-9,-8);

		public TestVec2 ()
		{
		}


		public void test_getitem() {
			double d = v0[0];
		}
		public void test_add() {
			Vec2 v2 = v0 + v1;
		}
		public void test_sub() {
			Vec2 v2 = v0 - v1;
		}
		public void test_neg() {
			Vec2 v2 = - v1;
		}
		public void test_mul() {
			Vec2 v2 = v0 * 4.0;
			Vec2 v3 = 4.0 * v0;
		}

	}
}

