require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "a user can be authenticated" do
    assert_equal User.authenticate(users(:horst).email, 'geheim'), users(:horst)
  end

  test "a user can NOT be authenticated with the wrong password" do
    assert_equal User.authenticate(users(:horst).email, 'nicht_das_passwort'), nil
  end

  test "a users password is hashed with salt and the right format" do
    user = User.new(email: 'horst@mail.com', password: 'geheim')
    user.encrypt_password
    assert_match /\$2a\$10\$/, user.password_salt
    assert_match Regexp.new('^'+Regexp.quote(user.password_salt)), user.password_hash
  end
end
