
import unittest


import sys
sys.path.append("../../build/py/")
import pyHAPI

from random import random


class test_VecElement:
    def __initValues__(self, cname, n):
        self.val0 = [random() for i in range(n)]
        self.val1 = [random() for i in range(n)]
        self.zero = cname()
        self.v0  = cname(*self.val0)
        self.v02 = cname(*self.val0)
        self.v1  = cname(*self.val1)

    def test_getitem(self):
        for idx in range(len(self.v0)):
            self.assertEqual(self.v0[idx], self.val0[idx])

    def test_add(self):
        v2 = self.v0 + self.v1
        for idx in range(len(v2)):
            self.assertEqual(v2[idx], self.val0[idx] + self.val1[idx])

    def test_sub(self):
        v2 = self.v0 - self.v1
        for idx in range(len(v2)):
            self.assertEqual(v2[idx], self.val0[idx] - self.val1[idx])

    def test_neg(self):
        v2 = - self.v0
        for idx in range(len(v2)):
            self.assertEqual(v2[idx], -self.val0[idx])

    def test_mul(self):
        n = 4.0
        v2 = self.v0 * n
        v3 = n * self.v0
        for idx in range(len(v2)):
            self.assertEqual(v2[idx], self.val0[idx] * n)
        for idx in range(len(v3)):
            self.assertEqual(v3[idx], self.val0[idx] * n)

    def test_equality(self):
        self.assertTrue( self.v0 == self.v02 )
        self.assertFalse( self.v0 == self.v1 )




class test_Vec2(test_VecElement, unittest.TestCase):
    def setUp(self):
        self.__initValues__(pyHAPI.Vec2, 2)

    def test_len(self):
        len(self.zero) == 2


class test_Vec3(test_VecElement, unittest.TestCase):
    def setUp(self):
        self.__initValues__(pyHAPI.Vec3, 3)

    def test_len(self):
        len(self.zero) == 3


class test_Vec4(test_VecElement, unittest.TestCase):
    def setUp(self):
        self.__initValues__(pyHAPI.Vec4, 4)

    def test_len(self):
        len(self.zero) == 4




if __name__ == '__main__':
    unittest.main()



