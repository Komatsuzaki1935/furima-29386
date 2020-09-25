require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do
      it "ニックネーム、メールアドレス、パスワード、パスワードの確認、苗字、名前、苗字のフリガナ、名前のフリガナ、誕生日 が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "メールアドレスに＠が含まれていれば登録できる" do
        @user.email = "test123@test.com"
        expect(@user).to be_valid
      end
      it "パスワードが半角英数字混合で6文字以上であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）であること" do
        @user.first_name = "田なカ"
        @user.last_name = "太ろウ"
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
        @user.furigana_first_name = "タナカ"
        @user.furigana_last_name = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "ニックネームが空では登録できないこと" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空では登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスが一意性ではないと登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに＠が含まれていないと登録できないこと" do
        @user.email = "test123test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid. Input full-width characters.")
      end
      it "パスワードが空では登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは半角英字のみでは登録できないこと" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input full-width characters.")
      end
      it "パスワードは半角数字のみでは登録できないこと" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input full-width characters.")
      end
      it "パスワードが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは確認用の２回目が空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "苗字が空では登録できない" do
        @user.firs_tname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "苗字は全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.firs_tname = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "名前が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名前は全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.last_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "苗字のフリガナが空では登録できない" do
        @user.firs_tname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first name can't be blank")
      end
      it "苗字のフリガナは全角（カタカナ）以外では登録できない" do
        @user.firs_tname = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first name is invalid. Input full-width characters.")
      end
      it "名前のフリガナが空では登録できない" do
        @user.furigana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last name can't be blank")
      end
      it "名前のフリガナは全角（カタカナ）以外では登録できない" do
        @user.furigana_last_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last name is invalid. Input full-width characters.")
      end
      it "誕生日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end
end