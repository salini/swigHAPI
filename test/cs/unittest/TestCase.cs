using System;
using System.Collections;
using System.Collections.Generic;

using System.Reflection;
using System.Diagnostics;
using System.Runtime.ExceptionServices;  //WARNING: to get all the critical exceptions

namespace unittest
{
	public class TestCase<ClassToTest> : TestReport where ClassToTest: new()
	{
		private static List<string> excludedMethods = new List<string> {"ToString", "Equals", "GetHashCode", "GetType"};


		public TestCase ()
		{
		}

		protected void disposeAll(params IDisposable[] objs) {
			foreach (IDisposable obj in objs) {
				obj.Dispose();
			}
		}

		[HandleProcessCorruptedStateExceptions]  //WARNING: to get all the critical exceptions
		public static void run() {
			ClassToTest instance = new ClassToTest ();

			MethodInfo[] myArrayMethodInfo = instance.GetType().GetMethods(BindingFlags.Public|BindingFlags.Instance);

			foreach (MethodInfo meth in myArrayMethodInfo)
			{
				if (!excludedMethods.Contains(meth.Name)) {
					try {
						meth.Invoke(instance, null);
						AddMethodResult(true,"");
						Console.Write (".");
					}
					catch (Exception e){
						Console.Write ("E");
						string className = instance.GetType ().Name;
						string methClassName = meth.Name;
						string errText = "Exception thrown:\n" + e.InnerException.Message;
						string errorStr = "---------------------------------\n";
						errorStr += String.Format ("class: {0}\nmeth: {1}\nfile: {2}\nline: {3}\n{4}\n", className, methClassName, "", "", errText);

						AddMethodResult(false,errorStr);
					}
				}
			}
		}



		protected void TestHasPassed( bool hasPassed, StackFrame sf) {
			string errorStr = "";
			if (hasPassed == true) {
				Console.Write (".");
			}
			else {
				Console.Write ("F");
				errorStr = getErrorString(sf);
			}
			AddAssertResult ( hasPassed, errorStr );
		}

		protected string getErrorString(StackFrame sf) {
			string className = this.GetType ().Name;
			string methClassName = sf.GetMethod ().Name;
			string filePath = sf.GetFileName();
			int lineNumber = sf.GetFileLineNumber();
			string lineText = "";
			if (filePath != null) {
				lineText = System.IO.File.ReadAllLines (filePath) [lineNumber - 1].TrimStart ();
			} else {
				lineText = "no info : is it build in debug mode?";
			}
			string errorStr = "---------------------------------\n";
			errorStr += String.Format ("class: {0}\nmeth: {1}\nfile: {2}\nline: {3}\n{4}\n", className, methClassName, filePath, lineNumber, lineText);
			return errorStr;
		}




		protected bool AssertTrue( bool expr) {
			StackFrame sf = new StackFrame(1, true);
			TestHasPassed (expr, sf);
			return expr;
		}
		
		protected bool AssertFalse( bool expr) {
			StackFrame sf = new StackFrame(1, true);
			TestHasPassed (!expr, sf);
			return !expr;
		}

		protected bool AssertEqual(double v0, double v1, double epsilon=1e-6) {
			StackFrame sf = new StackFrame(1, true);
			bool isEqual = (Math.Abs (v0 - v1) <= epsilon);
			TestHasPassed (isEqual, sf);
			return isEqual;
		}

		protected bool AssertThrow<T>(Action act) where T : System.Exception {
			StackFrame sf = new StackFrame(1, true);
			try {
				act();
			}
			catch (T) {
				TestHasPassed (true, sf);
				return true;
			}
			TestHasPassed (false, sf);
			return false;

		}

		protected bool AssertNoThrow(Action act) {
			StackFrame sf = new StackFrame(1, true);
			try {
				act();
			}
			catch {
				TestHasPassed (false, sf);
				return false;
			}
			TestHasPassed (true, sf);
			return true;
			
		}
	}
}

