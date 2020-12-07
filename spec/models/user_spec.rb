require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it "nicknameとemailとpasswordとpassword_confirmationとlast_name_kanとfirst_name_kanとlast_name_kanaとfirst_name_kanaとbirthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できないこと" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できないこと" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_name_kanが空では登録できないこと" do
      @user.last_name_kan = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kan can't be blank")
    end
    it "first_name_kanが空では登録できないこと" do
      @user.first_name_kan = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kan can't be blank")
    end
    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birthdayが空では登録できないこと" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "passwordが6文字以上であれば登録できること" do
      @user.password = "1a1a1a"
      @user.password_confirmation = "1a1a1a"
      expect(@user).to be_valid
    end
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "1a1a1"
      @user.password_confirmation = "1a1a1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数混合でなければ登録できないこと" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "1a1a1a"
      @user.password_confirmation = "1a1a1a1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_name_kanが全角でなければ登録できないこと" do
      @user.last_name_kan = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kan is invalid")
    end
    it "first_name_kanが全角でなければ登録できないこと" do
      @user.first_name_kan = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kan is invalid")
    end
    it "last_name_kanaが全角カナでなければ登録できないこと" do
      @user.last_name_kana = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "first_name_kanaが全角カナでなければ登録できないこと" do
      @user.first_name_kana = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email:@user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@が含まれない場合登録できないこと" do
      @user.email = "aaaaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  end
end
