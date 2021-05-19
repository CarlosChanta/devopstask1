import unittest
import app

class TestHello(unittest.TestCase):

    def setUp(self):
        app.app.testing = True
        self.app = app.app.test_client()

    def test_homepage(self):
        rv = self.app.get('/')
        self.assertEqual(rv.status, '200 OK')

    def test_greetings(self):
        rv = self.app.get('/greetings')
        self.assertEqual(rv.status, '200 OK')

    def hello_user(self):
        rv = self.app.get(f'/hello/carlos')
        self.assertEqual(rv.status, '200 OK')
        self.assertIn(bytearray(f"carlos", 'utf-8'), rv.data)

if __name__ == '__main__':
    unittest.main()