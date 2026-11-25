require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '000aaａ'
        @user.password_confirmation = '000aaａ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'family_name_kanaが空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'family_nameが半角だと登録できない' do
        @user.family_name = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name 全角文字を使用してください'
      end
      it 'family_name_kanaが半角カタカナだと登録できない' do
        @user.family_name_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana 全角カタカナを使用してください'
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名）が含まれていると登録できない' do
        @user.family_name_kana = 'ヤマだ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana 全角カタカナを使用してください'
      end
      it '姓（カナ）にカタカナ以外の文字（漢字）が含まれていると登録できない' do
        @user.family_name_kana = 'ヤマ田'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana 全角カタカナを使用してください'
      end
      it '姓（カナ）にカタカナ以外の文字（英字）が含まれていると登録できない' do
        @user.family_name_kana = 'ヤマｄ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana 全角カタカナを使用してください'
      end
      it '姓（カナ）にカタカナ以外の文字（数字）が含まれていると登録できない' do
        @user.family_name_kana = 'ヤマ０'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana 全角カタカナを使用してください'
      end
      it '姓（カナ）にカタカナ以外の文字（記号）が含まれていると登録できない' do
        @user.family_name_kana = 'ヤマ！'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana 全角カタカナを使用してください'
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'Hanako'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name 全角文字を使用してください'
      end
      it 'first_name_kanaが半角カタカナだと登録できない' do
        @user.first_name_kana = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana 全角カタカナを使用してください'
      end
      it '名（カナ）にカタカナ以外の文字（平仮名）が含まれていると登録できない' do
        @user.first_name_kana = 'ハナこ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana 全角カタカナを使用してください'
      end
      it '名（カナ）にカタカナ以外の文字（漢字）が含まれていると登録できない' do
        @user.first_name_kana = 'ハナ子'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana 全角カタカナを使用してください'
      end
      it '名（カナ）にカタカナ以外の文字（英字）が含まれていると登録できない' do
        @user.first_name_kana = 'ハナｋ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana 全角カタカナを使用してください'
      end
      it '名（カナ）にカタカナ以外の文字（数字）が含まれていると登録できない' do
        @user.first_name_kana = 'ハナ０'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana 全角カタカナを使用してください'
      end
      it '名（カナ）にカタカナ以外の文字（記号）が含まれていると登録できない' do
        @user.first_name_kana = 'ハナ！'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana 全角カタカナを使用してください'
      end
      it 'date_of_birthが空だと登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '000aaa'
        @user.password_confirmation = '123aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
    end
  end
end
