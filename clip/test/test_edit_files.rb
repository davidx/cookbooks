require 'rubygems'
require 'dust'

TESTFILE = File.dirname(__FILE__) + '/data/test_file.conf'
TESTSTRING = "Testline:"

unit_tests do
  test "can edit files" do

  end
  test "can append if no such line" do
    assert_nothing_raised do
      edit_file TESTFILE do
        append_if_no_such_line TESTSTRING
      end

    end
    assert respond_to?(:append_if_no_such_line)
    assert IO.read(TESTFILE).match(/#{TESTSTRING}/)
  end
end
