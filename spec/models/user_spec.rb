require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nick name can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'nick_nameが40字以内でないと登録できない' do
      @user.nick_name = 'testestestestestestsetestestestestsetestestestsetestsetsetestestetstestestesttestestesttestestesttestestesttestesteste'
      @user.valid?
      expect(@user.errors.full_messages).to include "Nick name is too long (maximum is 40 characters)"
    end

    it 'emailが正しいフォーマットでないと登録できない' do
      invalid_emails = ['user', 'user@', 'userexample.com']
    
      invalid_emails.each do |invalid_email|
        @user.email = invalid_email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end

    it 'passwordが6文字以上でないと登録できない' do
      @user.password = '123q'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'passwordが英字数字混合されたものでないと登録できない' do
      invalid_password = ['123456', 'abcdefg']
    
      invalid_password.each do |invalid_password|
        @user.password = invalid_password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end

    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @user.password_confirmation = '888888'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが全角ひらがな・カタカナ・漢字のみで構成されていないと登録できない' do
      invalid_first_name = ['123456', 'abcdefg', 'ﾊﾝｶｸｶﾅ', 'ﾊﾝｶｸ漢字', '123ひらがな', 'abcカタカナ']
    
      invalid_first_name.each do |invalid_first_name|
        @user.first_name = invalid_first_name
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
    end

    it 'last_nameが全角ひらがな・カタカナ・漢字のみで構成されていないと登録できない' do
      invalid_last_name = ['123456', 'abcdefg', 'ﾊﾝｶｸｶﾅ', 'ﾊﾝｶｸ漢字', '123ひらがな', 'abcカタカナ']
    
      invalid_last_name.each do |invalid_last_name|
        @user.last_name = invalid_last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
    end

    it 'first_name_kanaがカタカナのみで構成されていないと登録できない' do
      invalid_first_name_kana = ['123456', 'abcdefg', 'ﾊﾝｶｸｶﾅ', 'ﾊﾝｶｸ漢字', '123ひらがな', 'abcカタカナ']
    
      invalid_first_name_kana.each do |invalid_first_name_kana|
        @user.first_name_kana = invalid_first_name_kana
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end

    it 'last_name_kanaがカタカナのみで構成されていないと登録できない' do
      invalid_last_name_kana = ['123456', 'abcdefg', 'ﾊﾝｶｸｶﾅ', 'ﾊﾝｶｸ漢字', '123ひらがな', 'abcカタカナ']
    
      invalid_last_name_kana.each do |invalid_last_name_kana|
        @user.last_name_kana = invalid_last_name_kana
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
    end


  end
end