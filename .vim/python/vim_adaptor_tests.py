import unittest

import vim_adaptor as a

class VimModuleBufferStub(list):

    def __init__(self):
        self.number = 1
        
    def set_contents(self, contents_string):
        self[:] = contents_string.split("\n")

class VimModuleCurrentStub(object):

    def __init__(self):
        self.buffer = VimModuleBufferStub()

class VimModuleStub(object):

    evaluated = []
    commanded = []
    
    def __init__(self):
        self.current = VimModuleCurrentStub()
        self.buffers = {}
        VimModuleStub.evaluated = []
        VimModuleStub.commanded = []
        
    def eval(self, vim_expr):
        VimModuleStub.evaluated.append(vim_expr)

    def command(self, vim_command):
        VimModuleStub.commanded.append(vim_command)

class VimAdaptorTests(unittest.TestCase):

    def stub_vim_buffer(self, bufnr, buffer_contents):
        a.vim.buffers[bufnr] = VimModuleBufferStub()
        a.vim.buffers[bufnr].set_contents(buffer_contents)

    def setUp(self):
        a.vim = VimModuleStub()
        
    def test_buffer_mock(self):
        test_string = "test buffer contents"
        self.stub_vim_buffer(0, test_string)
        self.assertEqual("test buffer contents", a.get_buffer_string(1))

    def test_xpath_evaluation(self):
        test_xml = "<Root>\n<Tag/>\n<Tag/>\n</Root>"
        self.stub_vim_buffer(0, test_xml)
        a.evaluate_xpath(1, 0, "//Tag")
        self.assertEqual("setloclist(0, [], 'r')", VimModuleStub.evaluated[0])

        self.assertEqual("setloclist(0, [{" +
                         "'bufnr': 1, " +
                         "'text': \"Results for: " + 
                         "//Tag\"" +
                         "}], 'a')",
                         VimModuleStub.evaluated[1])
        
        self.assertEqual("setloclist(0, [{" +
                         "'bufnr': 1, " +
                         "'lnum': 2, " +
                         "'text': \"<Tag>\", " +
                         "}], 'a')",
                         VimModuleStub.evaluated[2])
        
        self.assertEqual("setloclist(0, [{" +
                         "'bufnr': 1, " +
                         "'lnum': 3, " +
                         "'text': \"<Tag>\", " +
                         "}], 'a')",
                         VimModuleStub.evaluated[3])

    def test_xpath_with_undefined_namespace_errors(self):
        test_xml = "<Root xmlns:ns='test.org'><ns:Tag/></Root>"
        self.stub_vim_buffer(0, test_xml)

        a.evaluate_xpath(1, 0, '//vimns:Tag')

        self.assertEqual("setloclist(0, [{" +
                         "'bufnr': 1, " +
                         "'type': 'E', " +
                         "'text': \"XPath evaluation error: " + 
                         "undefined namespace prefix\"" +
                         "}], 'a')",
                         VimModuleStub.evaluated[2])

    def test_xpath_which_doesnt_return_a_line_number(self):
        text_xml = "<Root><Tag/></Root>"
        self.stub_vim_buffer(0, text_xml)

        a.evaluate_xpath(1, 0, "'test string'")

        self.assertEqual("setloclist(0, [{" +
                         "'bufnr': 1, " +
                         "'text': \"string: test string\", " +
                         "}], 'a')",
                         VimModuleStub.evaluated[2])

    def test_empty_buffer(self):
        self.stub_vim_buffer(0, "")
        a.evaluate_xpath(1, 0, "//*")

    def test_guess_prefixes(self):
        test_xml = "<Root><ns:Tag xmlns:ns='http://testprefixes.org'/></Root>"
        self.stub_vim_buffer(0, test_xml)

        a.guess_prefixes(1)

        self.assertEqual('let l:ns_prefixes = {' +
                        '"ns": "http://testprefixes.org",}',
                        VimModuleStub.commanded[0])

    def test_guess_prefixes_error(self):
        test_xml = "<Some><Malformed><Rubbish></Some>"
        self.stub_vim_buffer(0, test_xml)

        a.guess_prefixes(1)

        self.assertIn(
                'throw "An error occurred while guessing namespace prefixes:', 
                VimModuleStub.commanded[0])

    def test_escaping_in_evaluation_result(self):
        test_xml = "<Root><Tag>With apo's in result</Tag>"
        test_xml += "<Tag>\"and some quotes\"</Tag></Root>"
        self.stub_vim_buffer(0, test_xml)

        a.evaluate_xpath(1, 0, "//Tag")

        self.assertEqual("setloclist(0, [{" +
                         "'bufnr': 1, " +
                         "'lnum': 1, " +
                         "'text': \"<Tag>: With apo's in result\", " +
                         "}], 'a')",
                         VimModuleStub.evaluated[2])

        self.assertEqual("setloclist(0, [{" +
                         "'bufnr': 1, " +
                         "'lnum': 1, " +
                         "'text': \"<Tag>: \\\"and some quotes\\\"\", " +
                         "}], 'a')",
                         VimModuleStub.evaluated[3])
