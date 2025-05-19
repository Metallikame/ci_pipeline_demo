import unittest
from main import is_prime

class TestIsPrime(unittest.TestCase):

    def test_prime_numbers(self):
        self.assertTrue(is_prime(2))
        self.assertTrue(is_prime(3))
        self.assertTrue(is_prime(13))

    def test_non_prime_numbers(self):
        self.assertFalse(is_prime(1))
        self.assertFalse(is_prime(4))
        self.assertFalse(is_prime(100))

    def test_negative_and_zero(self):
        self.assertFalse(is_prime(0))
        self.assertFalse(is_prime(-5))

if __name__ == '__main__':
    unittest.main()
