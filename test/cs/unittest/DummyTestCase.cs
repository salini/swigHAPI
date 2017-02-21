using System;
//using System.Reflection;


namespace unittest
{
	public class DummyTestCase : TestCase<DummyTestCase>
	{
		public DummyTestCase ()
		{
		}

		public void test1() {
			AssertFalse (1 == 2);
		}

		public void test2() {
			AssertTrue (1 == 2);
		}

		public void test3() {
			AssertTrue (1 == 3);
		}
	}
}

