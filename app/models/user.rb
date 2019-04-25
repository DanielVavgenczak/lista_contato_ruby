class User < ApplicationRecord

  # Aqui vamos reforçar a segurança fazendo um hash da senha
  # Que será uma gem bcryp que devemos descomentar do codigo gemfile
  # Caso tenha que fazer isso devemos rodar bundle install
  has_secure_password

  #expressao regular para evitar que seja informado algo alemn do email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  #vamos validar os campos
  validates :name, presence:true
  validates :password, length: {minimum: 6}
  validates :email, presence: true, length: {maximum: 25},
                                    format:{with: VALID_EMAIL_REGEX},
                                    uniqueness: {case_sensite: true}
end
